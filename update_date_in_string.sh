#!/bin/bash

date=`date | tr -d " "`
sed -i '' -e "s/built.*\</built $date</" BuildSpeed/src/main/res/values/strings.xml
