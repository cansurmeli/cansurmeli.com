#!/bin/bash
buildNumber=`cat buildNumber.txt`
buildNumber="$((buildNumber+1))"
echo "$buildNumber" | tee buildNumber.txt
