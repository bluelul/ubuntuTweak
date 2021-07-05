#!/bin/bash

echo 
echo Topthermal v2 - show and log temperature values \(oC\) of device
echo Author: bluelul.com - lttung1197
echo Reading...

myOrgPath='/sys/class/thermal';

myFiles=`ls $myOrgPath | grep thermal_zone`;

echo -n "second," > thermal.csv;

myDirs=();
myNames=();
for eachDir in $myFiles
do
	if `cat ${myOrgPath}/$eachDir/type &> /dev/null`; then
		if `cat ${myOrgPath}/$eachDir/temp &> /dev/null`; then
			myDirs+=($eachDir);
			myNames+=(`cat ${myOrgPath}/$eachDir/type`);

			echo -n `cat ${myOrgPath}/$eachDir/type` >> thermal.csv;
			echo -n "," >> thermal.csv;
		else
			echo -n `cat ${myOrgPath}/$eachDir/type`;
			echo -n " | ";
			echo `cat ${myOrgPath}/$eachDir/temp`;
		fi	
	else
		cat ${myOrgPath}/$eachDir/type
	fi
done

echo "" >> thermal.csv;

sleep 1

start=`date +%s`;

while true
do
	clear;
	
	now=`date +%s`;
	echo -n $((now - start)) >> thermal.csv;
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
	
	echo;
	echo -n "Up time: ";
	echo `date -d@$((now - start)) -u +%H:%M:%S`;
        sleep 1;
done
