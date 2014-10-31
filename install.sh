#!/bin/bash

if [ "$#" != 1 ]; then
    echo "Usage: $0 android-sdk-path"
    exit 1
fi

echo "Setting up adb-wrapper for this terminal..."
echo ""

SET_PATH="export PATH=\"$PWD:\$PATH/\""
echo $SET_PATH
$SET_PATH

SET_ANDROID_HOME="export ANDROID_HOME=$1"
echo $SET_ANDROID_HOME
$SET_ANDROID_HOME

echo ""
echo "Done."
echo ""

echo "To make this installation permanent, put the \"export\" commands printed above into your ~/.bashrc file."
