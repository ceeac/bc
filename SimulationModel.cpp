#include "irrlicht.h"

#include <iostream> //For debugging
#include <boost/lexical_cast.hpp> //For buoy loading

#include "main.hpp" //For ini file handling (buoy)

#include "SimulationModel.hpp"

using namespace irr;
using boost::lexical_cast; //For buoy loading

SimulationModel::SimulationModel(IrrlichtDevice* dev, video::IVideoDriver* drv, scene::ISceneManager* scene, GUIMain* gui) //constructor, including own ship model
    {
        //get reference to scene manager
        device = dev;
        driver = drv;
        smgr = scene;
        guiMain = gui;

        //initialise variables - Start with a hardcoded initial position
        heading = 0;
        xPos = 864.34f;
        yPos = 0.0f;
        zPos = 619.317f;
        speed = 0.0f;

        //store time
        previousTime = device->getTimer()->getTime();

        //Load a ship model
        ownShip.loadModel("Models/Ownship/Atlantic85/Hull.3ds",core::vector3df(0,0,0),smgr);

        //make a camera, setting parent and offset
        camera.loadCamera(smgr,ownShip.getSceneNode(),core::vector3df(0.0f,0.9f,0.6f));

        //Add terrain
        Terrain terrain (smgr, driver);

        //load example buoy object and put in the buoys array
        //Start: Will be moved into a Buoys object
        //load info from buoy.ini file

        //find number=x line, and get this value
        u32 numberOfBuoys;
        numberOfBuoys = IniFile::iniFileToul("Buoy.ini","Number");
        std::cout << "Buoys to load: " << numberOfBuoys << std::endl;


        if (numberOfBuoys > 0)
        {
                for(u32 i=1;i<=numberOfBuoys;i++)
                {
                    //Build up the 'Type(#)' string
                    std::string buoyTypeCommand = "Type(";
                    buoyTypeCommand.append(lexical_cast<std::string>(i));
                    buoyTypeCommand.append(")");
                    //Print out the 'type'
                    std::cout << IniFile::iniFileToString("Buoy.ini",buoyTypeCommand) <<std::endl;
                }
        }

        //find Long(#) and Lat(#)

        //Convert to position in metres

        //load and add to vector

        //close file

        buoys.push_back(Buoy ("Models/Buoy/Safe/buoy.x",core::vector3df(894.34f,0.0f,619.317f),smgr));
        //End: Will be moved into a Buoys object

        //add water
        Water water (smgr, driver);

        //sky box/dome
        Sky sky (smgr, driver);

        //make fog
        driver->setFog(video::SColor(128,128,128,128), video::EFT_FOG_LINEAR, 250, 1000, .003f, true, true);


    } //end of SimulationModel constructor

    void SimulationModel::setSpeed(f32 spd)
    {
         speed = spd;
    }

    const irr::f32 SimulationModel::getSpeed()
    {
        return(speed);
    }

    void SimulationModel::setHeading(f32 hdg)
    {
         heading = hdg;
    }

    const irr::f32 SimulationModel::getHeading()
    {
        return(heading);
    }

    void SimulationModel::updateModel()
    {

        //get delta time
        currentTime = device->getTimer()->getTime();
        deltaTime = (currentTime - previousTime)/1000.f; //Time in seconds
        previousTime = currentTime;

        //move, according to heading and speed
        xPos = xPos + sin(heading*core::DEGTORAD)*speed*deltaTime;
        zPos = zPos + cos(heading*core::DEGTORAD)*speed*deltaTime;

        //Set position & speed by calling own ship methods
        ownShip.setPosition(core::vector3df(xPos,yPos,zPos));
        ownShip.setRotation(core::vector3df(0, heading, 0)); //Global vectors

        camera.updateCamera();

        //send data to gui
        guiMain->updateGuiData(heading, speed); //Set GUI heading in degrees and speed (in m/s)
    }

