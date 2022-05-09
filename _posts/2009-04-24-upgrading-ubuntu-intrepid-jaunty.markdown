---
layout: post
title:  'Upgrading Ubuntu Intrepid to Jaunty'
date:   2009-04-24 00:00:00
tags:   linux ubuntu
---
When it comes to upgrading Operating Systems I’m not known as an early adopter, I normally wait a while for others to have the headache of encountering and resolving problems. However, in a moment of madness I decided to upgrade my fully functional Ubuntu 8.10 (Intrepid Ibex) installation to 9.04 (Jaunty Jackalope).
I’ve read a few blog posts where users have upgraded and then found that thier sound no longer works or that thier display crashes or won’t hit the previous resolution so I made sure that I had a backup of my /home directory and exported a list of my installed applications.
<!--more-->
The backup was performed using rsync and the following command:
```
rsync -av /home/dave "/media/FREECOM HDD/ubuntu"
```
Note that the quotes were required because when my external HDD connects it is given a name with a space in it!
 
I pinched a tip from the LifeHacker site to use a CLI command to generate a text file containing a list of my installed applications. This file could be used, again via the CLI, to reinstall the applications should the worst happen.
 
The command was:
```
sudo dpkg --get-selections "*" > current-installations.txt
```
This file was then copied to the USB drive containing the backup. Apparently, to reinstall from this file I would just need to run the following commands:
```
sudo apt-get update
dpkg --set-selections < current-installations.txt
apt-get -u dselect-upgrade
```
I say apparently because my upgrade went without a hitch 🙂
 
I opened the Update Manager and sure enough was prompted that a Distribution Upgrade was available. Before progressing with the upgrade I thought it prudent to install the handful of Updates that were listed as well.
 
Once the updates were installed I took a deep breath and went for it.
 
After downloading the Upgrade Installer I was prompted that the download would take in excess of 3 hours – not totally unexpected but this would tie up my laptop all night, so i went to the gym instead (i’ve got a holiday coming up and I don’t want GreenPeace trying to roll me back into the sea!).
 
The process still has about an hour to go when I went to bed so I expected it to be finished when I came down this morning – which it sort of was… It was waiting for me to respond to a prompt! It also indicated that there was another hour to go … great.
 
The prompt was to determine what I wanted to do with the grub menu.lst file. I run the laptop as a Dual-Boot with Vista on the other partition (yeah, yeah, I need it for my day job!) so as I didn’t really know what it would do to my settings I opted for the ‘leave it alone’ option.
 
I was prompted twice more for the same thing which was frustrating as I was getting ready for work and started to think that when I got home I would be faced with a prompt saying ‘Are you sure?’ or similar. As it happened the installation completed within about 5 minutes (not the hour it originally indicated).
 
Once the reboot had completed I logged in (via the new swishy login screen) and gave it a quick once over. Everything was there (despite the installation removing numerous, obsolete, packages) and appeared to be working normally.
 
The only thing I noticed was the my Eclipse IDE failed to load my PyDev perspective when I opened if for the first time after the upgrade. I loaded it manually and it seems to be fine now.
 
So for me, the upgrade process was a piece of cake, if a bit lengthy.