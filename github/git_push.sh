#!/bin/bash

git config --global user.name "DiaboloKiat"
git config --global user.email "DiaboloKiat@gmail.com"

git status
git checkout master
echo "Enter your message:"
read message

BRANCH=master
if [ ! -z "$1" ]
then
    echo "operator on branch: $1"
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
source $PROJECT/github/git_pull.sh $BRANCH

PULLSTAT=$?
if [ "$PULLSTAT" -gt 0 ] ; then
    echo "There is conflict. Aborting"
    cd $PROJECT
    return
fi
echo "---------------------------------------------------------------------------------------------------"
echo "-------------------------------------------pull success--------------------------------------------"
echo "---------------------------------------------------------------------------------------------------"


# push master

echo "---------------------------------------------------------------------------------------------------"
echo "------------------------------------------push duckieboat_ros--------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd $PROJECT
git add -A
git commit -m "${message} on duckieboat_ros"
git push
