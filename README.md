adb-wrapper
===========

Run adb commands on many devices. For example you may want `adb install` to install package on
both emulator and device. Can be overriden with -e, -d and -s options.

Installation
-------------

The following command will replace adb binary from SDK with wrapper.

```
./install.sh ~/apps/android-sdk-linux
```

Usage
--------------

```
# Execute adb commands on all connected devices.
adb set-target all
# Execute adb commands on given devices.
adb set-target emulator-5554 C59KGT14263422
# Use GNU parallel for parallel install.
adb set-parallel true
```
