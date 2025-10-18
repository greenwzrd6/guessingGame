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

#added so that the package declaration gets removed by not reading the first line
#then copying the read file into a new file and then changing it name to its original name
if [ ! -f "$DIR/GuessingGame.java" ] && [ ! -f "$DIR/Guesser.java" ]
then
  cp "se/yrgo/game/GuessingGame.java" "se/yrgo/game/Guesser.java" "$DIR"
  for file in "$DIR/GuessingGame.java" "$DIR/Guesser.java"
  do
    tail -n +2 "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
  done
  echo "Copied files to $DIR"
else
  echo "Files already exist, continuing"
fi

cd "$DIR"

echo "Running game from $(pwd)"

javac GuessingGame.java

#decided to create an array of dots and then animate a countdown
#to make the script look a little more fun

dots=("" "." ".." "...")

for d in "${dots[@]}"
  do
    echo -ne "Compiling script$d\r"
    sleep 0.5
    echo -ne "\r                   \r"
  done

echo "Done compiling!"

echo "Running game"

java GuessingGame

echo "Done!"