#!/bin/bash
if [ "$#" != 1 ]; then
    echo "Usage: $0 android-sdk-path"
    exit 1
fi

if [ -e $1/platform-tools/adb-orig ]; then
    echo "Already installed? Aborting."
    exit 1
fi

mv $1/platform-tools/adb $1/platform-tools/adb-orig || exit 1
ln -s $PWD/adb_wrapper.sh $1/platform-tools/adb
