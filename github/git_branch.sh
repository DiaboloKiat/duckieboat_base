#!/bin/bash

if [ "$1" = "base" ]
then
    PROJECT=~/duckieboat_ros
elif [ "$1" = "project_seadrone" ]
then
    PROJECT=~/project_seadrone/catkin_ws/src/duckieboat_ros
else
    echo "Please enter your project"
    return 0
fi


cd $PROJECT
git checkout master

############################## submodules ####################################
cd $PROJECT/sensors/gps/nmea_msgs
git checkout master

cd $PROJECT/sensors/gps/nmea_navsat_driver
git checkout master

##############################################################################

cd $PROJECT