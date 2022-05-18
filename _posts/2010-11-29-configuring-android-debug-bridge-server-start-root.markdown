---
layout: post
title:  'Configuring Android Debug Bridge Server to start as root'
date:   2010-11-29 00:00:00
tags:   android-debug-bridge
---
In [my previous post]({% post_url 2010-11-25-android-development-moving-emulator-device %}) my previous post I mentioned that one of the problems I faced when trying to install and debug my first Android application was that the Android Debug Bridge (adb) was not running as root. Now shutting the service down and restarting it with sudo was all that was required but that’s a bit of a faff, there had to be a way to configure adb to be started with root privileges – and there is.
<!--more-->
>Disclaimer: Before I continue I have to say that I claim no credit for this configuration, I just found it buried in a forum and merely replicating it here for my own reference and just in case the post is deleted.
>I should also point out that my configurations were done on a system running Ubuntu 10.04.
>**01/07/2012**: I’ve just upgraded to Mint 13 and tweaked the script to take account of the movement of adb from the tools folder into platform-tools.

**Step 1**: Using your text editor of choice create

```
/etc/init.d/adbd
```

and enter the following:

```bash
#!/bin/sh
#
# For ADB deamon (Android Device Bridge)
#
case "$1" in
  start)
        # Replace the path below with your path to adb
        /opt/android-sdk-linux_x86/platform-tools/adb start-server
        ;;
  stop)
        # Replace the path below with your path to adb
        /opt/android-sdk-linux_x86/platform-tools/adb kill-server
        ;;
*)
echo "Usage: $0 start|stop" >&2
exit 3
;;
esac
```
   
>When I’m working with system files I normally use nano as my editor and fire it off with sudo so that I have the correct permissions to save the file when I’m done.

**Step 2**: Make the file executable with the following command:
```bash
sudo chmod a+x /etc/init.d/adbd
```

**Step 3**: Create a link between the boot process and the above file
```
sudo ln -s /etc/init.d/adbd /etc/rc2.d/S10adbd
```

**Step 4**: Reboot your system

When the system restarts you can confirm that the service is running as root with the following command:

```
ps -afe | grep adb
```

On my system this returns two results:

```
root 1083     1  0 19:59 ?      00:00:00 adb fork-server server
dave 2417  1931  0 20:20 pts/0  00:00:00 grep --color=auto adb
```

as you can see the server (the first result) is running with as root.