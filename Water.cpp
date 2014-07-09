#include "irrlicht.h"

#include <vector>

#include "Water.hpp"

using namespace irr;

Water::Water()
{

}

Water::~Water()
{
    //dtor
}

void Water::load(irr::scene::ISceneManager* smgr)
{
    irr::video::IVideoDriver* driver = smgr->getVideoDriver();

    //Set tile width
    tileWidth = 1000; //Width in metres
    irr::u32 segments = 10; //How many tiles per segment
    irr::f32 segmentSize = tileWidth / segments;

    //some water (from demo 8)
    scene::IAnimatedMesh* waterMesh = smgr->addHillPlaneMesh( "myHill",
                       core::dimension2d<f32>(segmentSize,segmentSize),
                       core::dimension2d<u32>(segments,segments),
                       0,
                       0.0f,
                       core::dimension2d<f32>(0,0),
                       core::dimension2d<f32>(10,10));

    waterNode = smgr->addWaterSurfaceSceneNode(waterMesh->getMesh(0), 0.25f, 300.0f, 10.0f);
    //add secondary meshes around the central water mesh: FIXME: Get the waves to match at edges somehow
    std::vector<irr::scene::ISceneNode*> secondaryWaterNodes;
    secondaryWaterNodes.push_back(smgr->addWaterSurfaceSceneNode(waterMesh->getMesh(0), 0.25f, 300.0f, 10.0f,waterNode,-1,core::vector3df(-1*tileWidth,0,-1*tileWidth)));
    secondaryWaterNodes.push_back(smgr->addWaterSurfaceSceneNode(waterMesh->getMesh(0), 0.25f, 300.0f, 10.0f,waterNode,-1,core::vector3df(-1*tileWidth,0, 0*tileWidth)));
    secondaryWaterNodes.push_back(smgr->addWaterSurfaceSceneNode(waterMesh->getMesh(0), 0.25f, 300.0f, 10.0f,waterNode,-1,core::vector3df(-1*tileWidth,0, 1*tileWidth)));
    secondaryWaterNodes.push_back(smgr->addWaterSurfaceSceneNode(waterMesh->getMesh(0), 0.25f, 300.0f, 10.0f,waterNode,-1,core::vector3df( 0*tileWidth,0,-1*tileWidth)));
    secondaryWaterNodes.push_back(smgr->addWaterSurfaceSceneNode(waterMesh->getMesh(0), 0.25f, 300.0f, 10.0f,waterNode,-1,core::vector3df( 0*tileWidth,0, 1*tileWidth)));
    secondaryWaterNodes.push_back(smgr->addWaterSurfaceSceneNode(waterMesh->getMesh(0), 0.25f, 300.0f, 10.0f,waterNode,-1,core::vector3df( 1*tileWidth,0,-1*tileWidth)));
    secondaryWaterNodes.push_back(smgr->addWaterSurfaceSceneNode(waterMesh->getMesh(0), 0.25f, 300.0f, 10.0f,waterNode,-1,core::vector3df( 1*tileWidth,0, 0*tileWidth)));
    secondaryWaterNodes.push_back(smgr->addWaterSurfaceSceneNode(waterMesh->getMesh(0), 0.25f, 300.0f, 10.0f,waterNode,-1,core::vector3df( 1*tileWidth,0, 1*tileWidth)));
    for(std::vector<irr::scene::ISceneNode*>::iterator it = secondaryWaterNodes.begin(); it != secondaryWaterNodes.end(); ++it) {
        (*it)->setMaterialTexture(0, driver->getTexture("media/water.bmp"));
        (*it)->setMaterialFlag(video::EMF_FOG_ENABLE, true);
    }

    waterNode->setPosition(core::vector3df(0,-0.25f,0));

    waterNode->setMaterialTexture(0, driver->getTexture("media/water.bmp"));
    waterNode->setMaterialFlag(video::EMF_FOG_ENABLE, true);
}

void Water::update(irr::core::vector3df viewPosition)
{
    //Update water so it's always seen from our position
    core::vector3df localOriginPosition = viewPosition;

    //Round these to nearest segmentWidth
    f32 xPos = tileWidth * round(viewPosition.X/tileWidth);
    f32 yPos = 0.0;
    f32 zPos = tileWidth * round(viewPosition.Z/tileWidth);

    waterNode->setPosition(core::vector3df(xPos,yPos,zPos)); //Initially just move with the camera

    //FIXME: To do:
    //Make 9 meshes, which will only move by one width at a time, so we're always on the central mesh


}

irr::s32 Water::round(irr::f32 numberIn) //Fixme: define this in one place
//Implements round away from zero
{
    irr::s32 result;
    if (numberIn > 0) {
        result = numberIn + 0.5;
    } else {
        result = numberIn - 0.5;
    }
    return result;
}
