#!/bin/bash

if [ "$1" = "base" ]
then
    PROJECT=duckieboat_base
    REPO=duckieboat_base
elif [ "$1" = "project_seadrone" ]
then
    PROJECT=project_seadrone/catkin_ws/src/duckieboat_base
    REPO=project_seadrone
else
    echo "Please enter your project"
    return 0
fi


cd ~/$PROJECT
git checkout master

############################## submodules ####################################
cd ~/$PROJECT/msgs/nmea_msgs
git checkout master

cd ~/$PROJECT/sensors/gps/nmea_navsat_driver
git checkout master

cd ~/$PROJECT/msgs/rosserial
git checkout melodic-devel

##############################################################################

cd ~/$REPO
