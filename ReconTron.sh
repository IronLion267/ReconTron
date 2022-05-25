#!/bin/bash

echo -n "What is the target domain? (i.e. corebts.com): "

read -r domain

echo -n "Name your output file (i.e. clientdomains.txt): "

read -r outputfile

sublist3r -d "$domain" -o "$domain"-sublisteroutput.txt 
subfinder -d "$domain" -o "$domain"-subfinderoutput.txt 
amass enum -d "$domain" -o "$domain"-amassoutput.txt 
cat "$domain"-sublisteroutput.txt "$domain"-subfinderoutput.txt "$domain"-amassoutput.txt > alloutput.txt

# alphabetizes and removes duplicate variables
sort alloutput.txt | uniq > "$outputfile"

cat "$outputfile"
