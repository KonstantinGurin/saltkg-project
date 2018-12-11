#!/bin/bash
STRING="Hello "$USER". Here is a list of new updates:"
echo $STRING

file="updates.txt"
IFS=$'\n'
for var in $(cat $file)
do
echo " $var"
done
