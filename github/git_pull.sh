#!/bin/bash


git checkout master
BRANCH=master
if [ ! -z "$1" ]
then
    echo "pull branch: $1"
    BRANCH=$1
fi

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

echo "---------------------------------------------------------------------------------------------------"
echo "---------------------------------------pull duckieboat_ros------------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in duckieboat_ros. Aborting"
   return 1
fi

BRANCH=master
echo "---------------------------------------------------------------------------------------------------"
echo "-------------------------------------pull nmea_msgs------------------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd $PROJECT/sensors/gps/nmea_msgs
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in nmea_msgs. Aborting"
   return 1
fi

BRANCH=master
echo "---------------------------------------------------------------------------------------------------"
echo "-------------------------------------pull nmea_navsat_driver---------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd $PROJECT/sensors/gps/nmea_navsat_driver
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in nmea_navsat_driver. Aborting"
   return 1
fi



cd $PROJECT
return 0