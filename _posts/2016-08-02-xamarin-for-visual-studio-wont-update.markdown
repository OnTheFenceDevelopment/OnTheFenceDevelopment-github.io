---
layout: post
title:  'Xamarin for Visual Studio won’t Update?'
date:   2016-08-02 00:00:00
tags:   visual-studio xamarin
---
I’ve been developing with Xamarin for a few years now and most of the time I do so using Visual Studio. Now, as with most technologies, Xamarin is constantly evolving and therefore updates are pushed out fairly frequently – that’s all good, we all like new stuff don’t we?

Well, I’ve always had a problem whereby Visual Studio would prompt me to say that there was an update available and that I should ‘Click Here to Update’ – the only problem being that this doesn’t actually do anything!
<!--more-->
In the past I’ve simply opened up Xamarin Studio, checked for and installed updates and then reopened Visual Studio – simple it’s a bit irritating.

![yyyy](/assets/images/visual-studio-options-xamarin-updates.png)

Well with Xamarin now being part of Microsoft and after rebuilding my development workstation I find that Xamarin Studio is no longer installed with the rest of the Xamarin components when Visual Studio is installed. So how do I install the updates now?

Well, after <a href='https://forums.xamarin.com/discussion/comment/213310' target='_blank'>posting that very question in the Xamarin Forums</a> I was guided to the answer which seems so obvious now (that’s sarcasm by the way). I simply needed to navigate to: Tools > Options > Xamarin > Other > Check Now

Don’t know how I missed that 😉

Anyway – <a href='https://bugzilla.xamarin.com/show_bug.cgi?id=38753' target='_blank'>the bug with the notification looks like it’s fixed now</a> but just in case I thought I’d post this here for the unwary.