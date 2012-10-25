#!/bin/bash
bN=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "$INFOPLIST_FILE")
bN=$((0x$bN))
bN=$(($bN + 1))
bN=$(printf "%X" $bN)
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $bN" "$INFOPLIST_FILE"