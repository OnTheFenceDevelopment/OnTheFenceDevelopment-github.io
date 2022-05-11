---
layout: post
title:  'Now, how do I upgrade to Ubuntu Server 10.04 using the Command Line?'
date:   2010-05-16 00:00:00
tags:   linux ubuntu
---
Like most Ubuntu ‘geeks’ I have a box running the Server edition, just to play around on – mine is in the garage and performs some of the mundane tasks I’ve blogged about in the past, e.g. updating my OpenDNS and DynDNS settings when my external IP address changes and pinging the kids computers so I know when time the ‘really’ shut down last night.
However, I’m a worlds away from a sysadmin who works in the command shell all the time – I like my GUIs and tend to tread around the command line like its a bad tempered dog. So without the good old Update Manager and not wanting to blow the whole installation away and start again, how do I upgrade my system to the recently released 10.04 Lucid Lynx?
 
Now a lot of us already play around with apt-get on the command line instead of using the Synaptic Package Manager in the desktop. Not sure why I flip between the two – maybe just when I know the name of the package I need I find it more straightforward (and maybe quicker) to enter it into the command line.
 
The question is – how do I perform a distribution upgrade?
 
Well it would appear that I’m not the only one who is confused by the different apt-get options, <a href='http://goinglinux.com/2009shownotes.html#glp086' target='_blank'>in episode 86 of the ‘Going Linux Podcast’</a> Larry and Tom responded to a listener question along the same lines, and got it wrong! The error was pointed out by fellow podcaster <a href='https://popey.com/' target='_blank'>Alan Pope</a> (of the <a href='https://ubuntupodcast.org/' target='_blank'>Ubuntu UK Podcast</a>) who not only clarified which command should be used but also providing a detailed explanation of what each option does and when it should be used. Alan also <a href='http://popey.com/blog/2010/01/11/feedback-for-going-linux-podcast' target='_blank'>posted on his blog</a>, reproducing the letter in full so I’ll not regurgitate it here, but reading it I found that I was already using the wrong command to update my installed packages.
 
The confusion, I think, is that many users would assume that `sudo apt-get dist-upgrade` would upgrade the distribution – but it doesn’t, far far from it (as you will see if you read Alan’s post). In fact I should have been using this command instead of `sudo apt-get upgrade` which does not pull down and install any dependancies required by the upgraded packages, whereas `dist-upgrade` does.
 
In fact the correct command to upgrade to the next release is `sudo do-release-upgrade` – nothing to do with `apt-get` at all which apparently has problems working around certain ‘quirks’ in the upgrade process.
 
So for more details on the different `apt-get` options head over to Popey’s blog and enhance your Ubuntu/Command Line kung fu!