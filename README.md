adb-wrapper
===========

Run adb commands on many devices. For example you may want `adb install` to install package on
both emulator and device. Can be overriden with -e, -d and -s options.

Installation
-------------

The following command will set the PATH variable to this folder, so that `adb` is redirected
to the adb_wrapper.sh file here. It does not modify any files in your SDK directory.

```
./install.sh ~/apps/android-sdk-linux
```

NOTE: The above command will only export the PATH variable for the currently running shell.
To make the installation permanent, copy the "export" commands into your ~/.bashrc file.

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
