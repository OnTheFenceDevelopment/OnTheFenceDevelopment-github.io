---
layout: post
title:  'Syncing my iPod with Ubuntu'
date:   2010-01-10 00:00:00
tags:   linux ubuntu
---
In a [previous post]({% post_url 2009-12-31-new-year-resolutions-2010 %}) I listed some of the things that I still do in Windows that I needed to be able to do in Ubuntu before I could truly consider it to be my Operating System of choice – one of these was to be able to sync my music and podcasts onto my iPod Nano. Now as every iPod owner knows, these things are simple brilliant – but Apple do not provide a version of iTunes for Linux so what are we to do?

Well as ever the Open Source community has a number of answers and there are some fine iTunes alternatives out there. We all use our iPods differently and mine it mainly used for listening to Podcasts during my daily commute (about 40 minutes each way). I do have some music on the device but this is normally pretty static – when I get bored of what is on there I normally blitz the lot and start again.
<!--more-->
iTunes is a good application for managing Podcasts because it will not only download new episodes as they become available and automatically sync them to the iPod when I plug it on, it will detect which ones I have listened to and remove them – freeing up space for new content. To consider another application to be a genuine replacement it needs to do the same.

I started off with Rhythmbox (the default music player in Ubuntu) and was initially impressed with the Podcast functionality. However, I could not see how to remove watched episodes or how to sync the content to my iPod. While the help indicated that it was possible it provided little in the way of detail on how to do it. I tried looking though all of the menu items and even resorted to simple drag/drop. While that latter method works fine for normal music, podcasts just did no want to know. Oh well, half a solution there – creating a Playlist called iPodSync and assigning tracks to it (not possible to select a single album to add to the playlist which is a shame) is pretty similar to what I did in iTunes – although it would also sync them for me (adding and removing as appropriate) instead of me having to drag/drop but that’s no big hardship, after all my music is pretty static on the device.

So with the music side of things sorted, I started looking for Podcast solutions and came up with <a href="https://gpodder.github.io" target="_blank">gPodder</a> (which is in the Ubuntu repositories). The GUI is slick but uncluttered and easy to use without wading through masses of screenshots and help manuals.

![gpodder user interface]({{ '/assets/images/gpodder.png' | relative_url }})

After adding a new Podcast subscription it is created with the default setting and the latest episode is downloaded (any other episodes in the feed can be added to the queue to download).

Right-clicking on a feed in the left pane and selecting ‘Edit’ from the context menu will allow you to tweak some basic settings including whether the content should be skipped when syncing (useful if the episodes are in a format incompatible with the iPod, ogg files for example, that you want to listen to via the desktop).

The ‘killer’ feature for me is found in the Podcasts > Preferences menu; the ability to remove played episodes from the HDD after a specified number of days, sync unplayed episodes and remove played episode from a connected iPod. Clicking on the Advanced button displays huge a list of options which can be tweaked to your hearts content – I didn’t need/want to.

So I’ve added a few of my favorite Podcasts and set my ‘basic’ options (including my iPods mountpoint) – now what?

Well, using the Device menu it is possible to perform a full Sync or to copy just selected episodes. I normally just opt for the Full Sync option as this removes played episodes etc.

I have experienced problems with the Full Sync where sometimes new episodes are not copied over. While I’m not 100% sure about the conditions that cause this it is normally resolved by restarting gPodder and re-syncing. I noticed that by selecting Additional Components from the Podcasts menu there was a ‘Plugin’ called iPod Synchronisation which had Missing Dependencies. These turned out to be a couple of Python Extensions; eyeD3 and mad. I’ve installed these but the problem persists. I think its when new feeds are added and its initial episodes are downloaded – they don’t get copied over and none of the outstanding sync operations are completed. I’ll see if I can replicate this on a consistent basis and then raise a bug if there isn’t one already.

The only thing that I’m concerned about now is that by default I cannot rip any of my CDs to an iPod compatible format (if only the iPod supported .ogg). I’m going to have to investigate this a little further before I can say that I have a working alternative to that on Windows.