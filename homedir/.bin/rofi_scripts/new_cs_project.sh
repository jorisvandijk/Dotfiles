#!/usr/bin/env bash

echo "Lets create a new C# project!"
read -p "What would you like to name this project? : " -e PROJECT

if [ ! -d $HOME/Fontys/CS/$PROJECT ]; 
  then
    cd $HOME/Fontys/CS/
    mkdir $PROJECT
    cd $PROJECT

    dotnet new console

    echo "Project" $PROJECT  "created!"
  else
    echo "Project" $PROJECT "already exists!"
fi


