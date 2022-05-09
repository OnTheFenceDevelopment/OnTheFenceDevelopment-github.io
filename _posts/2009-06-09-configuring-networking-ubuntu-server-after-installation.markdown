---
layout: post
title:  'Configuring Networking on Ubuntu Server After Installation'
date:   2009-05-06 00:00:00
tags:   linux ubuntu networking
---
I recently bought an ‘old’ PC to use as a test system, running XP for my .NET development and Ubuntu Server (Jaunty 9.04) for my investigations into Linux. I have a few spare drives kicking around so having a totally separate installation of XP and Ubuntu would be a doddle.
I fitted an additional 20GB drive and for now I’m content to open the side and swap the cables until I get around to sorting out a suitable boot loader.
 
The installation progressed without any problems until I reached the network configuration. As the router is in the hall and my usual  connects via the wireless I didn’t have a network socket nearby – we only have one wired PC in the house. I opted for ‘Setup Networking Later’ option and the process completed without any further problems. Now, as a Windows ludite how do I configure the network without a GUI..?
<!--more--> 
Well the first step was to get the box connected to the router – which acts at the DHCP server for my network, i.e. move it into the hall.
 
After logging in the first thing to do is to configure the network card – this is done by running the following command:
```
sudo vi /etc/network/interfaces
```
which will open the file in the ‘vi’ editor.
 
Navigate to the end of the file and then press ‘i’ (which will put vi into Insert mode) and add the following lines:
```
auto eth0
iface eth0 inet dhcp
```
Now press the escape key to take vi out of Insert mode. So far so good but now we need to write the changes to disk and exit the editor. To write the updated file back to disk simply enter :w and press enter. Now to exit the vi editor enter :q and press enter.
 
So what have we just done? Well the file contains details of all network devices connected to the system and specifies how they are configured.
 
The first line we added `auto eth0` tells the system to start this adapter, eth0, when it boots up. The next line `iface eth0 inet dhcp` tells the system to query DHCP for an IP address for this adapter.
 
Now we just need to restart the networking service to apply the new settings. To do that run the following command:
```
sudo /etc/init.d/networking restart
```
To check that all is well enter
```
ifconfig
```
and review the resulting output for details of the eth0 adapter which should include an IP address as assigned by the router, in my case 192.168.1.4.
 
Once I had completed this I was able to ping the router and <a href="http://www.google.com" target="_blank">http://www.google.com</a>, thus confirming that I had Internet access.