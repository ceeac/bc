#include "irrlicht.h"

#include "RadarScreen.hpp"
#include <iostream>

using namespace irr;

RadarScreen::RadarScreen()
{

}

RadarScreen::~RadarScreen()
{
    //dtor
}


void RadarScreen::load(irr::scene::ISceneManager* smgr, irr::scene::ISceneNode* parent, irr::core::vector3df offset)
{
    driver = smgr->getVideoDriver(); //store video driver so we can work with textures
    radarScreen = smgr->addBillboardSceneNode();
    radarScreen->setMaterialFlag(video::EMF_LIGHTING, false);
    radarScreen->setSize(core::dimension2d<f32>(0.5f, 0.5f)); //FIXME: Hardcoded size
    this->parent = parent;
    this->offset = offset;
}

void RadarScreen::update(video::IImage* radarImage)
{
     //link camera rotation to shipNode
    // get transformation matrix of node
    core::matrix4 m;
    m.setRotationDegrees(parent->getRotation());

    // transform offset('offset' is relative to the local ship coordinates, and stays the same.)
    //'offsetTransformed' is transformed into the global coordinates
    core::vector3df offsetTransformed;
    m.transformVect(offsetTransformed,offset);

    //move screen
    radarScreen->setPosition(parent->getPosition() + offsetTransformed);

    //make texture from image and apply to the screen
    radarScreen->setMaterialTexture(0,driver->addTexture("RadarImage",radarImage)); //FIXME: Check we're not creating more and more textures. I think they get dropped automatically by reference counting

}

