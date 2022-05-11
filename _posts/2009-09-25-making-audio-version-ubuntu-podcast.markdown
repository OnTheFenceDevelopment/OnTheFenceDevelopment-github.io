---
layout: post
title:  'Making an Audio version of the Ubuntu Podcast'
date:   2009-09-25 00:00:00
tags:   python ffmpeg
---
I listen to a number of podcasts on a regular basis, mainly programming related, during my 45 minute commute to and from work every day. Now almost all of them are downloaded in audio format but recently the Ubuntu Podcast as stopped posting these formats. In a recent episode (#32) Joel and Nick explained they reasoning behind this and I fully support them in their decision – I mean, it’s an overhead for them in terms of time and storage/bandwidth. Add to that the fact that I can still subscribe via iTunes and some would wonder why I’m making a fuss (which I’m not btw!).

Well the fact of the matter is that it both illegal and dangerous to watch a video podcast on an iPod Nano while driving at 70mph down the motorway. Add to that the fact that each of the main episodes is 500MB and my Nano has ‘only’ 8GB to play with and i have a few reasons for wanting an less-heavyweight version.

So what exactly do I need to do to get the podcast down to my iPod in audio format (let’s face it, I’m gonna use MP3 for initial development).

**Server Side:**
- Check Ubuntu Podcast feed for new episode(s)
- Download Episode(s)
- Convert from .ogv to .mp3
- Copy to appropriate location to download from
- Generate/Update internal RSS feed

**Client Side:**
- Subscribe iTunes to internal RSS feed
- Sync iPod
- Enjoy

I’ve decided that this is as good a time as any to dive into Python to do something useful so I’ve written a single script to perform the top four steps in the above Server Side list.

**Step One – Check RSS Feed for new Episode(s)**

There are probably a number of ways of doing this and i except that this is probably not the best one – but it works and that’s good enough at the moment.

Basically for each episode in the feed the script will scan a file containing all previously downloaded files. Now I know that this performs a full scan of the file for every episode and that this is inefficient. I did try to insert a break command but this threw an exception relating to the fileinput.input() process already being opened. If I can find a work around for this then I’ll implement it to make the code a little neater. At the end of the day, the script will run once a day in the early hours of the morning so if it takes a few extra seconds then so be it.

**Step Two – Download the Episode(s)**

Initially I looked as curl but this proved problematic due to the content being moved from the location specified in the feed. The alternative was wget which is capable of following the redirection to the content and worked well in the instance. The only issue was that the filename of the downloaded episodes was appended with a handful of query string characters. A little bit of string manipulation sorted this and i was good to go.

Part of this process updates a history file that contains the file names of all of the previous episodes into the feed. This is how the script determines whether or not to download each episode. I initially created the file to contain all of the shows I’ve previously listened to so that the script didn’t download everything again. When an episode is downloaded it’s name is added to the end of the list.

**Step Three – Convert from .ogv to .mp3**

Conversion was acheived with ffmpeg through a perversly simple command:
```
ffmpeg -i input_file.ogv output_file.mp3
```
I know  that there are probably 100’s of tweeks that I could have made to the conversion but bearing in mind I’m listening to this in my car I don’t really need concert hall sound quality here. Joel and Nick mentioned using baseline filters etc to clean up the levels etc but for my purposes it’s not really worth the effort.

Note that the conversion to .mp3 requires the installation of the stripped codecs (on Jaunty its libavcodec-unstripped-52).

**Step Four – Copy to a Suitable Location**

The ultimate aim of this process is to make the episode available via iTunes, but for the time being I’m happy to copy this to a Samba share on my server so that I can manually copy the converted file across to my iPod.

Finally (now that I have Emailing configured) the script sends me a nice email telling me that a new episode is available. I can then access the Samba share and copy the file over.

This script is now configured in cron to run at 1:00am every night and I’m just waiting for a new episode to be released.

While I’m waiting for a new episode I will be looking into sorting out an iTunes compatible RSS feed on my Ubuntu server. I’ll post the trials and tribulations of this process once I have it all up and running.

The [current script]({{'/assets/downloads/upc_downloader.txt' | relative_url }}) is available and requires the <a href="http://www.feedparser.org" target="_blank">feedparser</a> module to be accessible.

Usage: 
```
python upc_downloader.py [path_to_history.txt]
```