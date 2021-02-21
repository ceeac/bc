cmake_minimum_required(VERSION 3.8)

if (CMAKE_BINARY_DIR STREQUAL CMAKE_SOURCE_DIR)
    message(FATAL_ERROR "Building in-source is not supported! Create a build dir and remove ${CMAKE_SOURCE_DIR}/CMakeCache.txt")
endif(CMAKE_BINARY_DIR STREQUAL CMAKE_SOURCE_DIR)

if (DEFINED ENV{VCPKG_ROOT} AND NOT DEFINED CMAKE_TOOLCHAIN_FILE)
    set(CMAKE_TOOLCHAIN_FILE "$ENV{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake" CACHE STRING "")
endif (DEFINED ENV{VCPKG_ROOT} AND NOT DEFINED CMAKE_TOOLCHAIN_FILE)

if (CMAKE_TOOLCHAIN_FILE)
    include("${CMAKE_TOOLCHAIN_FILE}")
endif (CMAKE_TOOLCHAIN_FILE)


set(CMAKE_WARN_DEPRECATED ON)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
find_package(CCache)

if (CCache_FOUND)
    option(BOOMERANG_ENABLE_CCACHE "Enable CCache build cache" ON)
    if (BOOMERANG_ENABLE_CCACHE)
        set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE "${CCache_EXECUTABLE}")
        set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK    "${CCache_EXECUTABLE}")
    endif (BOOMERANG_ENABLE_CCACHE)
endif (CCache_FOUND)

project(bridgecommand)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

add_subdirectory(libs/asio)
add_subdirectory(libs/enet-1.3.14)
add_subdirectory(libs/Irrlicht)
add_subdirectory(libs/serial)

include_directories("libs/enet-1.3.14/include")
add_definitions(-DWITH_SOUND)
# add_definitions(-DFOR_DEB)

if (APPLE)
    SET(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -std=c++11 -stdlib=libc++ -mmacosx-version-min=10.7")
endif (APPLE)

# optional tools
add_subdirectory(controller)
add_subdirectory(editor)
add_subdirectory(iniEditor)
add_subdirectory(launcher)
add_subdirectory(multiplayerHub)
add_subdirectory(repeater)

set(CMAKE_THREAD_PREFER_PTHREAD ON)
find_package(Threads REQUIRED)

set(BC_SOURCES
    iprof.cpp
    main.cpp
    Angles.cpp
    Buoy.cpp
    Buoys.cpp
    Camera.cpp
    DefaultEventReceiver.cpp
    FFTWave.cpp
    GUIMain.cpp
    GUIRectangle.cpp
    HeadingIndicator.cpp
    IniFile.cpp
    LandLights.cpp
    LandObject.cpp
    LandObjects.cpp
    Lang.cpp
    Light.cpp
    ManOverboard.cpp
    MovingWater.cpp
    MyEventReceiver.cpp
    NMEA.cpp
    NavLight.cpp
    Network.cpp
    NetworkPrimary.cpp
    NetworkSecondary.cpp
    NumberToImage.cpp
    OtherShip.cpp
    OtherShips.cpp
    OutlineScrollBar.cpp
    OwnShip.cpp
    RadarCalculation.cpp
    RadarScreen.cpp
    Rain.cpp
    ScenarioChoice.cpp
    ScenarioDataStructure.cpp
    ScrollDial.cpp
    Ship.cpp
    SimulationModel.cpp
    Sky.cpp
    Sound.cpp
    StartupEventReceiver.cpp
    Terrain.cpp
    Tide.cpp
    Utilities.cpp
	ExitMessage.cpp
    Water.cpp
)

add_executable(bridgecommand-bc
    ${BC_SOURCES}
)

if (APPLE)

    add_library(sndfile STATIC IMPORTED) # or STATIC instead of SHARED
    set_target_properties(sndfile PROPERTIES
      IMPORTED_LOCATION "${CMAKE_SOURCE_DIR}/libs/libsndfile/lib/libsndfile.a"
      INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_SOURCE_DIR}/libs/libsndfile/include"
    )
    add_library(portaudio STATIC IMPORTED) # or STATIC instead of SHARED
    set_target_properties(portaudio PROPERTIES
      IMPORTED_LOCATION "${CMAKE_SOURCE_DIR}/libs/portaudio/lib/libportaudio.a"
      INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_SOURCE_DIR}/libs/portaudio/include"
    )

    target_link_libraries(bridgecommand-bc PRIVATE
        bc-asio
        enet
        bc-serial
        bc-irrlicht
        Threads::Threads
        sndfile
        portaudio
        "-framework AudioUnit"
	    "-framework AudioToolbox"
	    "-framework CoreAudio"
    )
else (APPLE)
    target_link_libraries(bridgecommand-bc PRIVATE
        bc-asio
        enet
        bc-serial
        bc-irrlicht
        Threads::Threads
        sndfile
        portaudio
        asound
    )
endif (APPLE)
