#!/bin/bash

clear

#declaring variables
NAME="David_Lindberg"
DIR="${NAME}_labb"

echo "${NAME}'s program"

echo ""
sleep 1

#decided to create an array of dots and then animate a countdown
#to make the script look a little more fun

dots=("" "." ".." "...")

for d in "${dots[@]}"
do
  echo -ne "Creating folder$d\r"
  sleep 0.5
  echo -ne "\r                       \r"
done

#made an if statement for making the dir and copying the files
#incase they already exist 
if [ ! -d "$DIR" ]
then
  mkdir "$DIR"
  echo "Created folder: $DIR"
else
  echo "Folder already exists, continuing"
fi

echo ""
sleep 1

for d in "${dots[@]}"
do
  echo -ne "Copying files$d\r"
  sleep 0.5
  echo -ne "\r                       \r"
done

#added so that the package declaration gets removed by not reading the first line
#then copying the read file into a new file and then changing it name to its original name
if [ ! -f "$DIR/GuessingGame.java" ] && [ ! -f "$DIR/Guesser.java" ]
then
  cp "se/yrgo/game/GuessingGame.java" "se/yrgo/game/Guesser.java" "$DIR"
  for file in "$DIR"/*.java
  do
    tail -n +2 "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
  done
  echo "Copied files to $DIR"
else
  echo "Files already exist, continuing"
fi

echo ""
sleep 1

cd "$DIR"

echo "Running game from $(pwd)"
echo ""

javac GuessingGame.java

for d in "${dots[@]}"
  do
    echo -ne "Compiling script$d\r"
    sleep 0.5
    echo -ne "\r                   \r"
done

echo "Done compiling!"

sleep 1
clear

for d in "${dots[@]}"
  do
    echo -ne "Starting game$d\r"
    sleep 0.5
    echo -ne "\r                   \r"
done

java GuessingGame

echo "Done!"
echo ""
read -p "Press Enter to continue..."

sleep 0.5
clear

for d in "${dots[@]}"
do
  echo -ne "Removing class files$d\r"
  sleep 0.5
  echo -ne "\r                       \r"
done

for file in *.class
do
  rm -f "$file"
done

echo "Listing files in ${DIR}:"

ls
