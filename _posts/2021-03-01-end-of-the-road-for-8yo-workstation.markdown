---
layout: post
title:  'End of the road for 8yo Workstation?'
date:   2021-03-01 00:00:00
tags:   development hardware utilities
---
![my development workstation](/assets/images/old-workstation.png){:width="200px" style="float:left; margin-right: 20px;"}
Back in 2013 I bought myself a shiny new, custom built workstation from <a href='https://www.scan.co.uk/' target='_blank'>Scan Computers</a>. Costing me around £1300 I had opted for a pretty decent spec for the time:

- Intel i7-3770 3.4GHz CPU
- 32 GB RAM
- Nvidia GeForce GTX 650Ti
- 250 GB SSD + 500GB spinning rust HDD

<br>
By todays standards this is probably pretty lame but it certainly kicked my old PC into a cocked hat! Able to run three monitors and all the speed I needed with a good amount of headroom.

That said, it still runs pretty well today (some 8 years later) and has served me very well throughout my contracting/freelance work. Today it’s my daily driver while I’m working from home.

Booting from cold to logged in and ready to work takes around 25 seconds (pretty slow in these days of instant gratification but it take me that long to pour a coffee so it’s not a problem) and I’ve never really had any major speed issues with anything I’ve thrown at it …. until recently that is.
<!--more-->
Over the past few weeks I’ve experienced numerous reboots without any warning whatsoever. Fortunately I’m working via a Remote Desktop Connection to my work PC so all that happened was my connection dropped and I lost nothing. Still frustrating nonetheless.

After trawling through the event logs etc and finding nothing I wondered if this was the end of the road for my trusty workstation – was the hardware starting to show it’s age and let me down?

If so then could I use the MacBook Pro or Surface Pro instead or was I looking down the barrel of specing up a new system and seeing if I could justify the cost considering I’m not working for myself anymore.

![core temp utility](/assets/images/core-temp.png){:style="float:right; margin-left:10px;"}

For some reason the first thing I thought about was the CPU – maybe it was showing it’s age and I was over-revving it (even though my work PC would be doing all the hard work when I’ve experienced the reboots!). So after looking around for some recommended utilities I installed ‘<a href='https://www.alcpu.com/CoreTemp/' target='_blank'>Core Temp</a>‘ and fired it up – the aim being to monitor the CPU temperature to see if it was increasing to critical levels and causing it to ‘panic’!

Now, the screenshot to the right isn’t from the initial monitoring but what it looks like now and if you know anything about CPU temperatures (I didn’t until I looked it up) you’ll know that this is running within the normal range. This wasn’t the case a day or so ago!

When I initially opened Core Temp the Workstations 4 cores were running in the low 80’s – a quick Goggle told me this wasn’t good and while it may not be my problem it was certainly something that needed attention.

Now, I’ve hoovered out my case a number of times over the years, it’s sitting on the floor under my desk after all, but I was certainly surprised to find that I couldn’t actually see the fins in my CPU heatsink from above.

After removing the heatsink and fan assembly and separating the two this is what I found..!

![workstation heatsink](/assets/images/workstation-heatsink.png)

Now that’s pretty disgusting, but in my defence that’s not just my skin cells – my home office is in the loft room and recently we’ve been in and out of the attic spaces to update the insulation and board it out for storage – this all creates a certain amout of dust which my workstation has been doing a good job of collecting (on the CPU and as it happens the GPU heatsinks).

After a good clean and a fresh layer of thermal paste my teperatures are now back in the normal range (as shown in the above screenshot from Core Temp) and I’ve not suffered a reboot since.

So while I can breathe easy now this has been a warning shot across my bow – this thing isn’t going to last forever afterall.

The experience has prompted me to review the content of this system to see how badly impacted I would be if (when?) it goes bang for good – and the results were encouraging.

There isn’t really anything on here that I couldn’t access from the Mac or Surface. Pretty much everything is either in the cloud or on my Synology NAS (which is also backed up on AWS S3).

All in all I’m happy that I don’t have to put my hand in my pocket for a new system and that the current one is not a single point of failure – I would still be able to call on one of my other systems and get back up and running in pretty much no time.

Happy Days 🙂 