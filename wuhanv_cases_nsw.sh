#!/bin/bash

postcode=$1
todaymd=$2

filetoday=`date -v -1d +%m-%d`

localtion_file="nsw_location_cases-$filetoday.csv"
source_linked_file="nsw_location_cases-$filetoday.csv"

if [ ! -f "nsw_location_cases-$filetoday.csv" ];
then
    # remove old files
    rm -f nsw_location_cases* nsw_source_linked*

    curl -s https://data.nsw.gov.au/data/dataset/aefcde60-3b0c-4bc0-9af1-6fe652944ec2/resource/21304414-1ff1-4243-a5d2-f52778048b29/download/covid-19-cases-by-notification-date-and-postcode-local-health-district-and-local-government-area.csv > $localtion_file

    curl -s https://data.nsw.gov.au/data/dataset/c647a815-5eb7-4df6-8c88-f9c537a4f21e/resource/2f1ba0f3-8c21-4a86-acaf-444be4401a6d/download/covid-19-cases-by-notification-date-and-likely-source-of-infection.csv > $source_linked_file
fi


if [ -z "$2" ];then
    # the update should be delayed one day.
    todaydm=`date -v -1d +%d-%m`
    todaymd=`date -v -1d +%m-%d`
else
    mm=`echo $todaymd | awk -F "-" '{print $1}'`
    dd=`echo $todaymd | awk -F "-" '{print $2}'`
    todaydm="$dd-$mm"
fi

echo $todaymd
new_case=`grep -inr $todaydm $source_linked_file | wc -l`  # format dd-mm
new_postcode_case=`grep -inr $todaymd $localtion_file | grep $postcode | wc -l` # format mm-dd
case_num=`grep -inr $postcode $localtion_file | wc -l`

echo "New NSW cases: $new_case"
echo "New $postcode Cases : $new_postcode_case"
echo "Cases in $postcode: $case_num"

