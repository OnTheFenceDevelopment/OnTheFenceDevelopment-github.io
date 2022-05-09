---
layout: post
title:  'Upgrading to Windows 7 (Dual Boot with Ubuntu)'
date:   2009-08-09 00:00:00
tags:   linux ubuntu windows-vista windows-7
---
I’ve run with Vista for about a year now and on the whole have had no problems with it. Now I’m one of those people that hasn’t really had any problems with Vista – and frankly I’m not sure what all the fuss was about. Yeah, I was happy with XP and only upgraded to Vista because my new employer was using it.

So why was I looking to upgrade to Windows 7 now..? Well there were a number of reasons but the most pressing was that Vista was starting to get on my nerves. So some reason it started to run painfully slow. This was mainly due to the fact that the hard drive would be chattering away for a good 20 minutes after I had logged in – now that’s infuriating! What the hell was it doing.? Well I didn’t really have the drive to spend hours looking for the source so had just lived with it. 

When Windows 7 hit Release Candidate I thought – “What the Hell”. If it all went to hell in a wheel barrow then I could either restore my XP system with the CD that came with the laptop or install Vista from the CD I had bought for the upgrade (OEM version purchased with a new HDD).
<!--more-->
[In a previous post]({% post_url 2009-01-05-dual-booting-vista-and-ubuntu %}) I explained that how I configured the laptop to dual-boot with Vista/Ubuntu and when I took the decision to upgrade the Vista part of this configurations I had a few alarm bells going off in my head. Would it adversly affect my Ubuntu installation (apart from overwritting the grub bootloader), would it lose all my documents, music and photos.? 

Well, it was as good a time as any to do some housekeeping on my systems to delete old stuff and backup the rest. So after my little spring clean I downloaded the latest Release Candidate (7100), burnt the iso to a CD and kicked off the setup process.

The first part of the process was to perform a compatibility check which advised me that Skype, SQL Server 2005 and my Sony Ericsson PC Suite may have problems running on the new operating system. No big deal, I knew that Skype had a fix for this and was pretty sure that Microsoft would sort out SQL Server. As for the mobile phone software – well I don’t ue it that much and if a new version was not available then it was no big deal. 

The rest of the installation took about 4 hours and restarted the system a number of times – no interaction needed from me so that was good.

When the installation was complete I booted into Windows 7 and had a nose about – and although it’s early days I’m quite impressed. Impressed enough to buy it when it’s released..? Well let’s no get ahead of ourselves here :-).

Ok, so know I had a system running Windows 7 and a Ubuntu installation that I could not access – the grub bootloader had been overwritten (which I knew would happen before I started). 

So, how do I reinstall grub so that I could get me dual boot back? 

Well the Ubuntu Documentation has <a href="https://help.ubuntu.com/community/RecoveringUbuntuAfterInstallingWindows" target="_blank">this article</a> on just this process which worked like a charm for me. I used the first method (with the Live CD) and within 5 minutes I was booting into Ubuntu (which to my relief was still there).
 