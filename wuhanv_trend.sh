#!/bin/bash

dates=`awk -F ',' '{print $1}' nsw_location_cases*  | grep 2020 | uniq`

for day in $dates
do
    cases=`grep $day nsw_location_cases* | wc -l`
    echo "$day $cases"
done
