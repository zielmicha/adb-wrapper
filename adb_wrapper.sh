#!/bin/bash
orig=$ANDROID_HOME/platform-tools/adb

if [ $# = 0 ]; then
    skip=true
fi

if [ "${1:0:1}" = "-" ]; then
    skip=true
fi

if [ "$1" = set-target ]; then
    shift
    if [ "$1" = "" ]; then
        echo "No targets given. (Use 'adb set-target all' for all devices)"
        exit 1
    fi
    echo "$@" > ~/.adb_wrapper_targets
    echo "OK"
    exit 0
fi

if [ "$1" = set-parallel ]; then
    if [ "$2" = true -o "$2" = false ]; then
        echo $2 > ~/.adb_wrapper_parallel
        echo "OK"
        exit 0
    else
        echo "illegal argument - $2"
        exit 1
    fi
fi

if [ "$1" = "shell" -a "$#" = 1 -o "$1" = 'devices' -o "$1" = "" ]; then
    skip=true
fi

if [ "$skip" = true ]; then
    $orig "$@"
    exit $?
fi

if [ ! -e ~/.adb_wrapper_targets ]; then
    echo "adb_wrapper: execute 'adb set-target' first"
    exit 1
fi

targets="$(cat ~/.adb_wrapper_targets)"
parallel="$(cat ~/.adb_wrapper_parallel 2>/dev/null)"

if [ "$targets" = all ]; then
    targets=$($orig devices | grep -v 'List of devices' | cut -f1 | grep '.')
fi

for target in $targets; do
    echo $orig -s $target "$@"
done | (if [ "$parallel" = true ]; then
    parallel
    else
    sh
    fi)
