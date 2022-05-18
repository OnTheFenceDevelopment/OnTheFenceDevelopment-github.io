---
layout: post
title:  'Accessing my Netgear Stora from Ubuntu'
date:   2011-02-09 00:00:00
tags:   linux ubuntu fstab nas
---
Like many tech-savy people these days I’ve been thinking about buying a Network Attached Storage device (NAS) for some time but being more into software than hardware I’ve never really understood enough about them to lay down my hard earned cash. Well recently my hand was forced by my external hard drive starting to act up and my girlfriends son filling his 70GB HDD with downloaded Flight Simulator extensions (and god knows what else!). After quizzing the infrastructure guy at work about his thoughts I ended up buying the Netgear Stora enclosure along with a Western Digital Caviar Black 1TB drive (another drive to follow next month).
<!--more-->
One of the reasons I opted for the Netgear unit was that it stated that it was compatible with Linux (in addition to Windows and Mac). As I run Ubuntu as my current desktop (and server) of choice while the rest of the systems in the house are XP/Vista this seemed to fit the bill nicely. However, as with most products that claim to be Linux compatible, there was no software provided for use on Linux nor was there any documentation. After trawling the forums I find that Netgear back this claim up by stating (something like) “you can access the device and the files via a web interface”, i.e. its compatible with any device with a web browser. Well I’m sorry but that is not acceptable! How do I get my Ubuntu server in the garage to send it’s backups etc when it doesn’t have a GUI let alone a browser? I want to be able to mount the device as a drive just like the Windows systems do – surely that’s not too much to ask (especially since – apparently – the Stora is running a version of Linux itself).
 
Well, as it happens it is possible to mount and access the Stora as a drive and access it just like any other.
With the Stora connected and registered (which needs an internet connection by the way!) and while the Windows systems in the house started chewing up the disk space I started the hunt for informtion.
 
As is normal with these things, the information is seldom in one place. A clue here and a command line there and slowly but surely I homed in on a solution.
 
First of all I <a href='http://forum1.netgear.com/showthread.php?t=45388' target='_blank'>found a post on the Netgear forums</a> describing the process for connecting a Fedora system to a stora. Good start, if Fedora can do it then surely Ubuntu could too. The problem here was that the process not only used Fedora but KDE and as I use Gnome this was not really useful to me – but as always with forums there’s normally hidden gold in the comments and this was no exception. One of the forum moderators posted a <a href='hipservforums.axentra.com/viewtopic.php?f=23&t=426&p=1930&hilit=fstab#p1930' target='_blank'>link to a post</a> and explained that it would be simpler to configure fstab to mount the Stora instead – adding that he was more familar with doing this on Ubuntu. The downside is that (apart from the link being down as I type) the configuration didn’t appear to work – not for Ubuntu 10.10 anyway. But all was not lost, looking further down the comments of the original post (to #5) I found a command that did work.

```
sudo mount -t cifs -o uid=YOUR_UID,gid=YOUR_GID,file_mode=0777,
     dir_mode=0777,username=USERNAME,password=PASSWORD
        //IP_OF_STORA/FamilyLibrary /media/stora/FamilyLibrary
```
>Command should obviously be on a single line!

To find your UID and GID just run the id command in a terminal window (assuming you are logged in as the correct user!).
 
Also the `/media/stora/FamilyLibrary` folder needs to exist before executing this command or you can change the mount point as required.
 
So that’s it then – well not quite. This will mount the FamilyLibrary and Ubuntu will display a suitable shortcut on my desktop (or at least, does for me) but it’s not automatic, I’d have to run the command each time I log in – not major issue but then again not a slick solution either. So could I translate that command line into something that I could enter into fstab? Turned out it was easier than I thought 🙂
 
The format for a fstab entry is
```
<device><mountpoint><filesystemtype><options><dump><fsckorder>
```
Just about all of the information I needed was in the mount command above.
 
**device** is the path to the stora (in particular, to the root filesystem we want to mount)\
**mountpoint** is where we want to mount the device to the filesystem\
**filesystemtype** is just what it says!\
**options** this is the comma delimited list in the middle of our command\
**dump** is used by a backup utility called dump to decide if a filesystem should be backed up or not\
**fsckorder** is used by the filesystem check utility fsck to determine the order in which filesystems should be checked
 
So our fstab entry looks like this (should be on one line but split here to fit the screen):
```
IP_OF_STORA/FamilyLibrary /media/stora/FamilyLibrary cifs
     uid=YOUR_UID,gid=YOUR_GID,file_mode=0777,dir_mode=0777,
         username=USERNAME,password=PASSWORD 0 0
```

Add this (with the appropriate values) into fstab and run

```
sudo mount -a
```

from the command line and (all things being equal) the drive should mount, a shortcut should appear on your desktop and in the Places menu.
 
Job done, yes?
 
Well almost….
 
While this does work we have our username and password in plain text in file which can be opened by anyone (maybe not updated, but read none the less). If only there was a way to tell fstab to look somewhere else for the username and password …… well as luck would have it there is.
 
First of all we need to create a hidden file in our /home directory which will contain two lines (one for the username and one for the password).
 
Fire up your editor of choice (I like nano for this sort of thing) 
```
nano /home/dave/.storacredentials
```
and enter the following two lines:
```
username=your_username
password=your_password
```
Save it (CTRL+o then CTRL+x if you are using nano).
 
Now open up fstab and replace the username &amp; password options with the following:

```
credentials=/home/dave/.storacredentials
```

Run 

```
sudo mount -a
```

again and the drive should be remounted with the new configuration. If everything goes to plan then your should not really notice very much.
 
Finally, there is little point in moving your credentials from one file that everyone can access to another – so to ‘secure’ the .storacredentials file we need to configure it so that only root can read it.

```
chmod 400 .storacredentials
sudo chown root.root .storacredentials
```

I’ve added another fstab line for my MyLibrary area on the stora by changing FamilyLibrary for MyLibrary – works like a charm 🙂