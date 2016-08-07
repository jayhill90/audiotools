#!/bin/bash
###################################
# Wav to MP3 Bash Script v1.0     #
# By: Jordan Hill                 #
# August 2016                     #
###################################
clear # Clear the Screen
#Setup ANSI Color Codes
RED='\033[0;31m'
DEFAULT='\e[0m'
 # Get Directory To Convert
echo -e "${RED}		Please input the directory that you wish to convert: $DEFAULT" 
read convert
# If filenames contain whitespace, replace with _ 
for f in $convert/* ; do mv "$f" "${f// /_}" 2>/dev/null ; done
      # Get Directory to Put Converted Files In 
echo -e "${RED}	Please input the directory that you wish to place the converted files: $DEFAULT"
read converted
mkdir -p $converted
      # Begin Conversion
echo "		Please wait..."
echo "		Converting $convert"
#Convert direcotry of wavs into mp3s
for i in $convert/*.wav 
	do ffmpeg -loglevel 0 -i "$i" -c:a libmp3lame -b:a 320k "$i.mp3" #encode files with no ffmpeg output
	mv $convert/*.mp3 $converted #Move files into converted folder
done
#File names end up becoming .wav.mp3 so we need to strip the .wav part.
for file in $converted/*.wav.mp3
	 do mv "$file" "${file//.wav}" #Strip .wav from filename
done
sleep 2
echo "		All files have been converted!"  # All Files Converted
echo "		Files have been placed in $converted"
#Show all files in $converted directory
ls -lah $converted 
sleep 5
echo "Goodbye.
