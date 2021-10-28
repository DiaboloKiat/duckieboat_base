#!/bin/bash

if [ "$1" = "base" ]
then
    PROJECT=duckieboat_ros
    REPO=duckieboat_ros
elif [ "$1" = "project_seadrone" ]
then
    PROJECT=project_seadrone/catkin_ws/src/duckieboat_ros
    REPO=project_seadrone
else
    echo "Please enter your project"
    return 0
fi

BRANCH=master
echo "---------------------------------------------------------------------------------------------------"
echo "---------------------------------------pull duckieboat_ros-----------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd ~/$PROJECT
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ]
then
   echo "There is conflict in duckieboat_ros. Aborting"
   return 1
fi

BRANCH=master
echo "---------------------------------------------------------------------------------------------------"
echo "-------------------------------------pull nmea_msgs------------------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd ~/$PROJECT/sensors/gps/nmea_msgs
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ]
then
   echo "There is conflict in nmea_msgs. Aborting"
   return 1
fi

BRANCH=master
echo "---------------------------------------------------------------------------------------------------"
echo "-------------------------------------pull nmea_navsat_driver---------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd ~/$PROJECT/sensors/gps/nmea_navsat_driver
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ]
then
   echo "There is conflict in nmea_navsat_driver. Aborting"
   return 1
fi



cd ~/$REPO
return 0