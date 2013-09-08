#!/bin/bash

./gradlew --daemon :BuildSpeed:assembleDebug
adb install -r BuildSpeed/build/apk/buildspeed-debug-unaligned.apk
adb shell 'am start -a android.intent.action.MAIN -n com.micromobs.buildspeed/com.micromobs.buildspeed.MainActivity'
