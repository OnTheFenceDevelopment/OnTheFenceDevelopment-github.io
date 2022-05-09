---
layout: post
title:  "Dual Booting Vista and Ubuntu"
date:   2009-01-05 00:00:00
tags: linux ubuntu windows-vista
---
In a previous post I stated that have installed Ubuntu 8.10 (Intrepid Ibex) alongside Vista on my Toshiba laptop but this was not as straightforward as I had hoped.
I had upgraded the laptop with a 160GB hard drive and Vista was reporting that there was about 90GB free. Great, I only want about 20-30GB for Ubuntu so I should have no problems at all – should I?

The problem is that when i installed Vista I clicked on the ‘Use Entire Drive’ option – which is what I wanted at the time. Now Vista has the ability to shrink a volume so I thought this would come to my rescue – I was wrong! Even though I had 90GB free the shrink tool would only reclaim about 200MB of it!
<!--more-->
I initially suspected that the problem lay with Vista spreading itself across the available disk, i.e. there was some data at the far edge of the disk which was was acting as an outer marker. So surely a ‘quick’ defrag would sort that out – erm, no. Following the 3 hour defrag I ran the Shrink Tool again which now reported that I could reclaim …. absolutely nothing! Damn it!

So I would have to bite the bullet and repartition the drive. The problem was that I had experience of partitioning drives in the past and been burnt on a couple of occasions.

Well this time I had the Internet on my side and I was going to research the hell out of this before I put my system at risk of total destruction.

Well as it turned out I didn’t need to search too far before it became obvious that  <a href="https://gparted.org" target="_blank">GParted</a> was the tool of choice. I duly downloaded the .ISO and burnt it to a CD which I then booted my system from. I’ll not bore you with the details but the process was pretty straightforward you just had to make 100% certain that you are not about the destroy the main partition, i.e the one with Windows on it. I made absolutly certain and the partition was duly created.

So I had a new partition, separate from Vista, all I needed now was an operating system on it.

The Ubuntu installation was totally uneventful – a few simple selections and a few next buttons later and I was done. Again, make sure that you are installing on the right partition!

The end result is that when I boot up I get the GRUB bootloader where I can select whether I want to boot into Vista or Ubuntu. The default configuration is for the topmost item to be highlighted initially with a 10 second delay before it is automatically selected and the boot process commences. The problem (if you can call it that) is that the top item is Ubuntu – which may not be what you want, it certainly was not what I wanted at the time – mainly because my girlfriend uses the laptop and if it booted into something other than Vista while I was not around I would be in serious trouble!

Well there is a solution to this but it requires running a command at the Ubuntu command line.

If you want to set the default to be your Windows configuration just follow these steps:

- Boot into Ubuntu
- Open a Terminal session (which you’ll find in the Applications menu under Accessories)
- Enter the following `sudo gedit /boot/grub/menu.lst`
- Enter your password and press enter

gedit (which is a text editor similar to Notepad) will then open with the contents of the file displayed.

About a dozen lines down you will see a line that reads:

`default 0`

This is the value that needs to be changed but determining what number to enter is not obvious. The business end of the file is right at the bottom, this is where the options listed by grub are located. The two important things to remember are that the first option is numbered zero, not one and that the divider (which reads ‘Other Operating Systems’) should also be counted.
Basically you need to count, from zero, the lines that start with ‘title’ until you reach ‘Windows Vista/Longhorn (loader)’. This is the value you need to enter as the default.

Now while that works OK right now, when you install a new kernel (and you will) the list will increase in length and the next time you boot up you will see that the wrong option is selected. No big deal, just log into Ubuntu again, edit the file again and reboot. You can remove items from the list but I’d advise that leaving the new kernel and the previous one.
