#!/bin/bash

git config --global user.name "DiaboloKiat"
git config --global user.email "DiaboloKiat@gmail.com"

git status
git checkout master
echo "Enter your message:"
read message

if [ "$1" = "base" ]
then
    PROJECT=duckieboat_ros
    BACK=duckieboat_ros
elif [ "$1" = "project_seadrone" ]
then
    PROJECT=project_seadrone/catkin_ws/src/duckieboat_ros
    BACK=project_seadrone
else
    echo "Please enter your project"
    return 0
fi

BRANCH=master
echo "---------------------------------------------------------------------------------------------------"
source ~/$PROJECT/github/git_branch.sh $1
echo "---------------------------------------------------------------------------------------------------"
source ~/$PROJECT/github/git_pull.sh $1

PULLSTAT=$?
if [ "$PULLSTAT" -gt 0 ]
then
    echo "There is conflict. Aborting"
    cd ~/$PROJECT
    return
fi
echo "---------------------------------------------------------------------------------------------------"
echo "-------------------------------------------pull success--------------------------------------------"
echo "---------------------------------------------------------------------------------------------------"


# push master

echo "---------------------------------------------------------------------------------------------------"
echo "------------------------------------------push duckieboat_ros--------------------------------------"
echo "---------------------------------------------------------------------------------------------------"
cd ~/$PROJECT
git add -A
git commit -m "${message} on duckieboat_ros"
git push

cd ~/$BACK
