#!/bin/bash

echo "project:"
read project

if [ "$project" = "base" ]
then
    PROJECT=~/duckieboat_ros
elif [ "$project" = "project_seadrone" ]
then
    PROJECT=~/project_seadrone/catkin_ws/src/duckieboat_ros
else
    echo "Input error"
    cd ~/duckieboat_ros
    return 0
fi


cd $PROJECT
git checkout master

cd $PROJECT/sensors/gps/nmea_msgs
git checkout master

cd $PROJECT/sensors/gps/nmea_navsat_driver
git checkout master



cd $PROJECT