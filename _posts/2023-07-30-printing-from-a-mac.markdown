---
layout: post
title:  'Printing from a Mac over Wifi'
date:   2023-07-30 00:00:00
tags:   hardware
---
People say that there are only two certainties in life, death and taxes, but they always forget about the third one - printing. 

Love it, hate it or deny it we all need to print something at some time. Whether it's a boarding pass, a Click & Collect receipt or a form that has to have an ink signature before being scanned and emailed back.

Before you start shouting about 'you can store all this on your phone old man' just remember that we don't always have a signal or infinite battery charge - just saying!

Well, if you are running Windows this doesn't seem to be much of a problem. Printer manufacturers create drivers and installation packages and utilities to grease the wheels for Windows users. But what about Mac users - it's that same for them right? Right?
<!--more-->

Well, no ... no it's not the same, not by a long shot.

I recently tried to go without a printer after my Canon printer/scanner gave up the ghost, but it was no good - the need to print boarding passes and holiday/travel details forced me to replace it.

I opted for another Canon device, a TS3450 multi-function printer/scanner/copier which states that it is compatible with Mac via AirPrint .... no drivers required.

Well, that's good and all but what about connecting the damn thing to your Wifi in the first place? If you're running Windows this isn't a problem - as long as your system has Wifi that is because if you are using a desktop that only has a wired connection then you are out of luck regardless of the operating system.

But Wifi or not, if you're using a Mac then there is no way to perform the installation so I had to install the Canon app on my Android phone to get the printer connected to my network. (yes, that's right - I'm using a Mac but an iPhone? No, that's just going too far)

With the printer hooked up to the Wifi I should just be able to print at will right ... right? Well, not so much. While my MacBook Pro (MBP) detected the printer without any problems I simply couldn't get it to print anything - I just ended up with a timeout error.

The same thing happened when I tried to scan a document. Opening the Printers & Scanners application and selecting the Scan tab I just ended up with another error.

![Scan error on Mac](/assets/images/canon-scan-error.png)

At this point my Windows Workstation and Surface Pro could print without any problems as could my Wife's Chromebook so there was clearly something particular about the Mac that was causing the problem.

To throw more confusion into the mix, if I connected the MBP to the wired network using a USB ethernet adapter I found I was able to print (but was still unable to scan) - it looked like it was an issue with the Wifi configuration on the MBP.

I run an always on VPN on all of my devices and am aware that sometimes these can get in the way when accessing resources on the local network. Unfortunately disabling the VPN connecting (even uninstalling the software altogether) didn't resolve the problem though.

For a while I resigned myself to the fact that I would need to print and scan from Windows (or a Chromebook - pffft!) but it was always a little splinter in my mind. This should be possible - it's just printing surely.

To cut a long story short - after periodic internet searches I found a clue in an Apple forum post ... and it centered around IPv6. Basically a Mac user said that he had resolved the issue by disabling IPv6 on the printer (I don't think his was a Canon).

Armed with this information I found that I needed to connect to the printers administration interface, over the network, and login. Simple huh!?

As a techie finding the IPv4 address of the printer was pretty straightforward but it makes me wonder how 'normal people' manage this. 

Typing this into a browser opens up some basic information about the printer status and the option to login.

![Conon admin landing page](/assets/images/canon-admin-page.png)

Clicking on the Login button opens a page requesting the appropriate password - so .... what's that then? 

A quick internet search, revealed that this was simply the serial number of the printer itself (which certainly beats a default password of 0000000).

Now the admin portal isn't the quickest website I've ever used that's for sure but when the page did load I was able to find the option to turn off IPv6 (but the path to it was a full 9 clicks).

![Canon Admin Options](/assets/images/canon-admin-menu.png)

(in case you are interested the path to the page was: `System info and LAN settings => LAN settings => Advanced Setup => Confirm Advanced Setup => TCP/IP settings => IPv6 => Enable/disable IPv6 => Disable => OK`)

With this setting in place covered the bases and rebooted my MBP and lined up a print job - and to my complete shock, the printer sprang into life and my document was printed.

After opening up the Printers and Scanners app on the MBP I was also able to scan the document back in - SUCCESS!

I've been printing and scanning quite happily for a few weeks now but there was another need to access the printers admin portal. By default the printer will go into standby after two hours of being idle but regardless of what system I was printing from, i.e. Windows or Mac, I needed to manually wake up the printer before trying to print anything.
Now this is fine when I'm in the home office but if I am working elsewhere in the house I would need to walk up and press the power button, walk back down again and send the print job .... yeah, yeah, I know .... a major hardship!

Surely there's an option for 'Wake up on LAN' in the admin portal ... well, yes ... sort of.

Logging in and navigating to `Printer settings => Energy saving settings`, selecting 'Auto power on' and clicking OK was all it took.

So, that's that - all sorted and my migration to the world of Mac is still on the cards.
