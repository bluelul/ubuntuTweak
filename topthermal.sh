#!/bin/bash

echo Author: bluelul.com
echo Reading...
sleep 1

myOrgPath='/sys/class/thermal';

myFiles=`ls $myOrgPath | grep thermal_zone`;

echo -n "time," > thermal.csv;

myDirs=();
myNames=();
for eachDir in $myFiles
do
        myDirs+=($eachDir);
	myNames+=(`cat ${myOrgPath}/$eachDir/type`);

	echo -n `cat ${myOrgPath}/$eachDir/type` >> thermal.csv;
	echo -n "," >> thermal.csv;
done

echo "" >> thermal.csv;

for i in $(seq 1 1 100)
do
	clear;
        
	echo -n `date` >> thermal.csv;
        echo -n "," >> thermal.csv;

	for i in $(seq ${#myDirs[@]})
	do
		gotThermal="00000";
                gotThermal=`cat ${myOrgPath}/${myDirs[i-1]}/temp`;
        	
		echo -n "$gotThermal," >> thermal.csv;

		echo -n $gotThermal;
		echo -n " | ";
		echo "${myNames[i-1]}";
	done

	echo "" >> thermal.csv;

        sleep 1;
done

