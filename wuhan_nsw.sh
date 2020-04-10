#!/bin/bash

postcode=$1

curl -s https://data.nsw.gov.au/data/dataset/aefcde60-3b0c-4bc0-9af1-6fe652944ec2/resource/21304414-1ff1-4243-a5d2-f52778048b29/download/covid-19-cases-by-notification-date-and-postcode-local-health-district-and-local-government-area.csv > nsw_location_cases.csv

curl -s https://data.nsw.gov.au/data/dataset/c647a815-5eb7-4df6-8c88-f9c537a4f21e/resource/2f1ba0f3-8c21-4a86-acaf-444be4401a6d/download/covid-19-cases-by-notification-date-and-likely-source-of-infection.csv > nsw_source_linked.csv


today=`date +%d-%m`
new_case=`grep -inr $today nsw_source_linked.csv | wc -l`
new_postcode_case=`grep -inr $today nsw_location_cases.csv | wc -l`
case_num=`grep -inr $postcode nsw_location_cases.csv | wc -l`

echo "New NSW cases: $new_case"
echo "New $postcode Cases : $new_postcode_case"
echo "Cases in $postcode: $case_num"

