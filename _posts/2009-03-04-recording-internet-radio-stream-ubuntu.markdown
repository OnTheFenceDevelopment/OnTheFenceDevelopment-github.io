---
layout: post
title:  "Recording Internet Radio Stream with Ubuntu"
date:   2009-03-04 00:00:00
tags:   ubuntu
---
A friend of mine recently started co-presenting a show on a local radio station but due to the timings I was unable to listen to it live. I thought about trying to record it off the radio but this was not going to be straightforward as I would not be in when the show started or finished – and this is the 21st century for heavens sake, why was I thinking about going back to cassettes and ‘pressing play and record as the same time’? Surely there had to be another way, preferably one that meant I could get the show in MP3 format so that I could listen in the car, at the gym or at work.
A podcast was what I needed but unfortunately the radio station in question did not produce one. However, they did provide an live stream – great, now what is the equivalent to pressing play and record at the same time on a computer?
 <!--more-->
There are probably ways of doing it in Windows using Media Player or iTunes (I don’t know because I haven’t checked) but where was the fun in that? I wanted to see if Ubuntu could do it – for free and maybe learn something in the process!
 
I had a quick Google around and sure enough there were a number of posts on recording internet streams (see Related Links below). The first link will take you to an ‘Instructables.com’ page which will guide you through a 5 step process and forms the basis of my configuration. However, in it’s published form their method did not work on my setup (Ubuntu 8.10) and I needed to tweak the configuration of one of the applications just a little bit. The process also utilised KCron which is a KDE application and as I am running Gnome I needed/wanted an alternative. So while the bulk of the process is taken from the Instructables site this post details the tweaks I needed to make to get it working for me and a bit more explanation of some of the components used.
 
The first thing to do is to install all the bits and pieces required so open a terminal window and enter

`sudo apt-get install lame mplayer gnome-schedule`

This will install mplayer (the application that will actually connect to the stream and output a .wav file), <a href="https://lame.sourceforge.io/" target="_blank">lame</a> (an Open Source utility that will convert the .wav to an MP3) and gnome-schedule (which will schedule the starting and stopping of the recording).
 
The creation and configuration of the folders as well as the creation of the scripts that control mplayer are detailed on the Instructables site but I’ll just give a bit of extra detail on the options and switches applied to the commands:
The line in the streamrecord script that actually records the stream is:

`mplayer -playlist "http://icecast.commedia.org.uk:8000/phonic.mp3.m3u" -ao pcm:file=/tmp/mystream.wav -vc dummy -vo null;`

So what does that all mean?

1. playlist simply tells mplayer what file to play – I inserted the path to the radio stream here.
2. ao sets the audio driver. Here I’m using the pcm driver for RAW PCM/WAVE file writer audio output This is followed by the output path, i.e. where the temporary audio file will be saved.
3. -vo sets the video driver which is not needed here so I just passed in null
4. -vc sets the video codec to use which is set to dummy as we are not needing video here

The next line performs the conversion from .wav to .mp3:

`lame -m s /tmp/mystream.wav -o "/home/dave/Music/PhonicFM/Show - $NOW.mp3";`

The ‘m’ switch sets the mode to simple, that’s what the ‘s’ is for and good enough for our needs.
 
The ‘o’ flags the file as non-original (for some reason).
 
At this point it should have been possible to test the setup by running the scripts in a terminal session. Whan I tried however when I ran the streamrecord script I got an error when it executed the mplayer command.
 
**Couldn’t resolve name for AF_INET6: icecast.commedia.org.uk**
 
So what was all that about? Well, believing that I would not be the first person to have experienced this problem I turned to Google and sure enough a solution presented itself (see the link at the end of this post). Basically I needed to tweak the mplayer config file to prevent it from trying to use the IPv6 protocol first and just use the plain old IPv4 version.
 
Adding **prefer-ipv4=yes** to the mplayer.config file (on my system it was located in /etc/mplayer) sorted this problem for me.
 
Now i could test the configuration by entering ./scripts/streamrecord in a terminal window to start the recording, waiting a few minutes and (in another terminal window) entering ./scripts/pkill to stop it.
 
While the recording is taking place a .wav file is created in /tmp and will grow as the recording continues. For the 2 hour show that I recorded this file grew to around 1.3GB so make sure you have enough room on the drive that you stream this file to. When you run the pkill command the mplayer process will stop and the next command in the streamrecord script will run and start the lame utility which will convert the .wav file into an MP3, storing it on the location you specified. This conversion took about 10 minutes for my 1.3GB wav and resulted in a more manageable 110MB MP3 file. When the conversion completes the .wav file will be deleted and you are left with the radio show in MP3 format. Simple eh?
 
All that remained to do was to configure the Gnome Scheduler to start and stop the recording.
 
The Gnome Scheduler can be found in the System Tools menu (within the Applications menu) and you will need to create two jobs, one to start the recording and one to stop it.
The process is pretty straightforward and detailed nicely in a post on Make Tech Easier (see Related Links below).
 
I created a task called ‘Start Recording’ which ran the following command at 10 o’clock:

`/scripts/streamrecord`

and one called ‘Stop Recording’ which ran the following command at Midday:

`/scripts/pkill`

And that’s it, as long as your system is running and can access the Internet at the specifed time your show will be recorded and will be waiting for you in MP3 format.
 
**Related Links:**

<a href="https://www.instructables.com/Schedule-Streaming-Audio-Recordings-in-Ubuntu/" target="_blank">The Instructables Article</a>\
<a href="https://www.maketecheasier.com/easy-way-to-schedule-and-automate-tasks-in-ubuntu/" target="_blank">Make Tech Easier Article on Gnome Scheduler</a>\
<a href="https://lame.sourceforge.io/" target="_blank">Lame on Sourceforge</a>\
<a href="https://computerperson.wordpress.com/2008/04/06/linux-sol-2-mplayer-af_inet6-error/" target="_blank">Andy’s Blog Article on the IPv6 Error</a>
