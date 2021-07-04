#!/bin/bash

echo Topthermal v2 - show and log temperature values \(oC\) of device
echo Author: bluelul.com - lttung1197
echo Reading...
sleep 1

myOrgPath='/sys/class/thermal';

myFiles=`ls $myOrgPath | grep thermal_zone`;

echo -n "second," > thermal.csv;

myDirs=();
myNames=();
for eachDir in $myFiles
do
        if [[ -r ${myOrgPath}/$eachDir/type && -r ${myOrgPath}/$eachDir/temp ]]; then
		myDirs+=($eachDir);
		myNames+=(`cat ${myOrgPath}/$eachDir/type`);

		echo -n `cat ${myOrgPath}/$eachDir/type` >> thermal.csv;
		echo -n "," >> thermal.csv;
	fi
done

echo "" >> thermal.csv;

while true
do
	clear;
	
	echo -n `date +%s` >> thermal.csv;
        echo -n "," >> thermal.csv;

	for i in $(seq ${#myDirs[@]})
	do
                gotThermal=`cat ${myOrgPath}/${myDirs[i-1]}/temp`;
        	
		echo -n "$gotThermal," >> thermal.csv;

		echo -n $gotThermal;
		echo -n " | ";
		echo "${myNames[i-1]}";
	done

	echo "" >> thermal.csv;
	
        sleep 1;
	clear;
        echo "-----------------------------------------";
done
