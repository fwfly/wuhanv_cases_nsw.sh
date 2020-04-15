#!/bin/bash

if [ -z "$1" ];then
    dates=`awk -F ',' '{print $1}' nsw_location_cases*  | grep 2020 | uniq`
else
    dates=`grep $1 nsw_location_cases* | awk -F ',' '{print $1}' | grep 2020 | uniq`
fi


for day in $dates
do
    if [ -z "$1" ];then
        cases=`grep $day nsw_location_cases* | wc -l`
    else
        cases=`grep $1 nsw_location_cases* | grep $day | wc -l`
    fi
    echo "$day $cases"
done
