#!/bin/bash

#declaring variables
NAME="David_Lindberg"
DIR="${NAME}_labb"

echo "${NAME}'s program"

#made an if statement for making the dir and copying the files
#incase they already exist 
if [ ! -d "$DIR" ]
then
  mkdir "$DIR"
  echo "Created folder: $DIR"
else
  echo "Folder already exists, continuing"
fi

if [ ! -f "$DIR/GuessingGame.java" ] && [ ! -f "$DIR/Guesser.java" ]
then
  cp "se/yrgo/game/GuessingGame.java" "se/yrgo/game/Guesser.java" "$DIR"
  echo "Copied files to $DIR"
else
  echo "Files already exist, continuing"
fi

cd "$DIR"

echo "Running game from $(pwd)"
