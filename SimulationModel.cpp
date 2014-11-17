/*   Bridge Command 5.0 Ship Simulator
     Copyright (C) 2014 James Packer

     This program is free software; you can redistribute it and/or modify
     it under the terms of the GNU General Public License version 2 as
     published by the Free Software Foundation

     This program is distributed in the hope that it will be useful,
     but WITHOUT ANY WARRANTY; without even the implied warranty of
     MERCHANTABILITY Or FITNESS For A PARTICULAR PURPOSE.  See the
     GNU General Public License For more details.

     You should have received a copy of the GNU General Public License along
     with this program; if not, write to the Free Software Foundation, Inc.,
     51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA. */

#include "SimulationModel.hpp"
#include "Constants.hpp"
#include "Utilities.hpp"
#include <ctime>

using namespace irr;

SimulationModel::SimulationModel(IrrlichtDevice* dev, scene::ISceneManager* scene, GUIMain* gui, std::string scenarioName) //constructor, including own ship model
    {
        //get reference to scene manager
        device = dev;
        smgr = scene;
        driver = scene->getVideoDriver();
        guiMain = gui;

        //construct path to scenario
        std::string scenarioPath = "Scenarios/"; //Fixme: Think about proper path handling?
        scenarioPath.append(scenarioName);

        //Read world file name from scenario:
        std::string environmentIniFilename = scenarioPath;
        environmentIniFilename.append("/environment.ini");
        std::string worldName = IniFile::iniFileToString(environmentIniFilename,"Setting");
        irr::f32 startTime = IniFile::iniFileTof32(environmentIniFilename,"StartTime");
        irr::u32 startDay=IniFile::iniFileTou32(environmentIniFilename,"StartDay");
        irr::u32 startMonth=IniFile::iniFileTou32(environmentIniFilename,"StartMonth");
        irr::u32 startYear=IniFile::iniFileTou32(environmentIniFilename,"StartYear");

        //load the weather:
        //Fixme: add in wind direction etc
        weather = IniFile::iniFileTof32(environmentIniFilename,"Weather");

        //Fixme: Think about time zone handling
        //Fixme: Note that if the time_t isn't long enough, 2038 problem exists
        scenarioOffsetTime = Utilities::dmyToTimestamp(startDay,startMonth,startYear);//Time in seconds to start of scenario day (unix timestamp for 0000h on day scenario starts)

        //set internal scenario time to start
        scenarioTime = startTime * SECONDS_IN_HOUR;

        //Start paused initially
        accelerator = 0.0;

        //Set initial tide height to zero
        tideHeight = 0;

        if (worldName == "") {
            //Could not load world name from scenario, so end here
            //ToDo: Tell user problem
            exit(EXIT_FAILURE);
        }

        //construct path to world model
        std::string worldPath = "World/";
        worldPath.append(worldName);

        //Add terrain: Needs to happen first, so the terrain parameters are available
        terrain.load(worldPath, smgr);

        //add water
        water.load(smgr,weather);

        //sky box/dome
        Sky sky (smgr);

        //make ambient light
        light.load(smgr);

        //Load own ship model.
        ownShip.load(scenarioPath, smgr, this, &terrain);

        //make a camera, setting parent and offset
        std::vector<core::vector3df> views = ownShip.getCameraViews(); //Get the initial camera offset from the own ship model
        camera.load(smgr,ownShip.getSceneNode(),views);

        //Load other ships
        otherShips.load(scenarioPath,scenarioTime,smgr,this);

        //Load buoys
        buoys.load(worldPath, smgr, this);

        //Load land objects
        landObjects.load(worldPath, smgr, this, terrain);

        //Load land lights
        landLights.load(worldPath, smgr, this, terrain);

        //Load tidal information
        tide.load(worldPath);

        //make a radar screen, setting parent and offset from own ship
        core::vector3df radarOffset = core::vector3df(0,100,0); //FIXME: Temporary - radar 100m above ship - used to render 2d radar, but could also be used in 3d view if required
        //core::vector3df radarOffset = core::vector3df(0.45,-0.28,0.75); //Previous offset from camera
        radarScreen.load(smgr,ownShip.getSceneNode(),radarOffset);

        //make radar image
        radarImage = driver->createImage (video::ECF_R8G8B8, core::dimension2d<u32>(256, 256)); //Create image for radar calculation to work on
        radarImage->fill(video::SColor(255, 0, 0, 255)); //Fill with background colour

        //make radar camera
        std::vector<core::vector3df> radarViews; //Get the initial camera offset from the radar screen
        radarViews.push_back(core::vector3df(0,0,-0.25));
        radarCamera.load(smgr,radarScreen.getSceneNode(),radarViews);
        radarCamera.setAspectRatio(1.0);
        radarCamera.setNearValue(0.2);
        radarCamera.setFarValue(0.3);

        //initialise offset
        offsetPosition = core::vector3d<u64>(0,0,0);

        //store time
        previousTime = device->getTimer()->getTime();

    } //end of SimulationModel constructor

SimulationModel::~SimulationModel()
{
    radarImage->drop(); //We created this with 'create', so drop it when we're finished
}

    irr::f32 SimulationModel::longToX(irr::f32 longitude) const
    {
        return terrain.longToX(longitude); //Cascade to terrain
    }

    irr::f32 SimulationModel::latToZ(irr::f32 latitude) const
    {
        return terrain.latToZ(latitude); //Cascade to terrain
    }

    void SimulationModel::setSpeed(f32 spd)
    {
         ownShip.setSpeed(spd);
    }

    irr::f32 SimulationModel::getSpeed() const
    {
        return(ownShip.getSpeed());
    }

    void SimulationModel::setHeading(f32 hdg)
    {
         ownShip.setHeading(hdg);
    }

    irr::f32 SimulationModel::getHeading() const
    {
        return(ownShip.getHeading());
    }

    void SimulationModel::setRudder(irr::f32 rudder)
    {
        //Set the rudder (-ve is port, +ve is stbd)
        ownShip.setRudder(rudder);
    }

    void SimulationModel::setPortEngine(irr::f32 port)
    {
        //Set the engine, (-ve astern, +ve ahead)
        ownShip.setPortEngine(port);
    }

    void SimulationModel::setStbdEngine(irr::f32 stbd)
    {
        //Set the engine, (-ve astern, +ve ahead)
        ownShip.setStbdEngine(stbd);
    }

    void SimulationModel::setAccelerator(irr::f32 accelerator)
    {
        this->accelerator = accelerator;
    }

    void SimulationModel::setWeather(irr::f32 weather)
    {
        this->weather = weather;
    }

    void SimulationModel::lookLeft()
    {
        camera.lookLeft();
    }

    void SimulationModel::lookRight()
    {
        camera.lookRight();
    }

    void SimulationModel::lookAhead()
    {
        camera.lookAhead();
    }

    void SimulationModel::lookAstern()
    {
        camera.lookAstern();
    }

    void SimulationModel::lookPort()
    {
        camera.lookPort();
    }

    void SimulationModel::lookStbd()
    {
        camera.lookStbd();
    }

    void SimulationModel::changeView()
    {
        camera.changeView();
    }

    void SimulationModel::increaseRadarRange()
    {
        radarCalculation.increaseRange();
    }

    void SimulationModel::decreaseRadarRange()
    {
        radarCalculation.decreaseRange();
    }

    void SimulationModel::setRadarGain(irr::f32 value)
    {
        radarCalculation.setGain(value);
    }

    void SimulationModel::setRadarClutter(irr::f32 value)
    {
        radarCalculation.setClutter(value);
    }

    void SimulationModel::setRadarRain(irr::f32 value)
    {
        radarCalculation.setRainClutter(value);
    }

    void SimulationModel::setMainCameraActive()
    {
        camera.setActive();
    }

    void SimulationModel::setRadarCameraActive()
    {
        radarCamera.setActive();
    }

    void SimulationModel::setAspectRatio(irr::f32 aspect)
    {
        camera.setAspectRatio(aspect);
    }

    void SimulationModel::update()
    {

        //get delta time
        currentTime = device->getTimer()->getTime();
        deltaTime = accelerator*(currentTime - previousTime)/1000.f;
        //deltaTime = (currentTime - previousTime)/1000.f;
        previousTime = currentTime;

        //add this to the scenario time
        scenarioTime += deltaTime;
        absoluteTime = Utilities::round(scenarioTime) + scenarioOffsetTime;

        //Update tide height here.
        tide.update(absoluteTime);
        tideHeight = tide.getTideHeight();
        //std::cout << tideHeight << std::endl;

        //update ambient lighting
        light.update(scenarioTime);
        driver->setFog(light.getLightSColor(), video::EFT_FOG_EXP , 250, 5*M_IN_NM, .0003f, true, true);
        irr::u32 lightLevel = light.getLightLevel();

        //update other ship positions etc
        otherShips.update(deltaTime,scenarioTime,tideHeight,camera.getPosition(),lightLevel); //Update other ship motion (based on leg information), and light visibility.

        //update buoys (for lights)
        buoys.update(deltaTime,scenarioTime,tideHeight,camera.getPosition(),lightLevel);

        //std::cout << tideHeight << std::endl;

        //update own ship
        ownShip.update(deltaTime, scenarioTime, tideHeight);

        //update water position
        water.update(tideHeight,camera.getPosition(),light.getLightLevel(), weather);

        //Normalise positions if required (More than 2000 metres from origin)
        //FIXME: TEMPORARY MODS WITH REALISTICWATERSCENENODE
        if(ownShip.getPosition().getLength() > 1000) {
            core::vector3df ownShipPos = ownShip.getPosition();
            irr::s32 deltaX = -1*(s32)ownShipPos.X;
            irr::s32 deltaZ = -1*(s32)ownShipPos.Z;
            //Round to nearest 1000 metres - water tile width, to avoid jumps
            deltaX = 500.0*Utilities::round(deltaX/500.0);
            deltaZ = 500.0*Utilities::round(deltaZ/500.0);

            //Move all objects
            ownShip.moveNode(deltaX,0,deltaZ);
            terrain.moveNode(deltaX,0,deltaZ);
            otherShips.moveNode(deltaX,0,deltaZ);
            buoys.moveNode(deltaX,0,deltaZ);
            landObjects.moveNode(deltaX,0,deltaZ);
            landLights.moveNode(deltaX,0,deltaZ);

            //Change stored offset
            offsetPosition.X -= deltaX;
            offsetPosition.Z -= deltaZ;
            std::cout << "Normalised, offset X: " << offsetPosition.X << " Z: " << offsetPosition.Z <<std::endl;
        }


        //update the camera position
        camera.update();

        //set radar screen position, and update it with a radar image from the radar calculation
        radarCalculation.update(radarImage,terrain,ownShip,buoys,otherShips,weather,tideHeight,deltaTime);
        radarScreen.update(radarImage);
        radarCamera.update();

        //send data to gui
        guiMain->updateGuiData(ownShip.getHeading(), ownShip.getSpeed(), ownShip.getPortEngine(), ownShip.getStbdEngine(), ownShip.getRudder(), ownShip.getDepth(), weather, radarCalculation.getRangeNm(), radarCalculation.getGain(), radarCalculation.getClutter(), radarCalculation.getRainClutter(), Utilities::timestampToString(absoluteTime),accelerator==0); //Set GUI heading in degrees and speed (in m/s)
    }

