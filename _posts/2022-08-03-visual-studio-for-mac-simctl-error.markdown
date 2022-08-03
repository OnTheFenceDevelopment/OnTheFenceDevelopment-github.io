---
layout: post
title:  'Visual Studio for Mac simctl error'
date:   2022-08-03 00:00:00
tags:   visual-studio-for-mac xcode
---
My investigations into Blazor have caused me to install a few preview apps, Visual Studio for Mac 2022 being one of them, and as with many preview apps it has problems.

Most recently I needed to make some changes to the <a href='{{ "/smite-scoreboard-for-android-ios" | relative_url }}'>Smite Scoreboard app</a> so duly flashed up the Mac and, even though I had installed it for Blazor investigations, Visual Studio for Mac 2022 Preview. After a few minutes reviewing the code a dialog was displayed advising that an update was available so I clicked to install it .... and that's when the fun started.
<!--more-->

After the upgrade was complete I restarted Visual Studio, loaded my Xamarin solution and carried on with the updates to the app. All was going well until I tried to run the app in the iPhone simulator. The simulator started but after a minute or so the app wasn't loaded and the solution clearly wasn't running anymore.
No problem, I think we all get this the first time we start an app without the simulator running so I just clicked to run the app again ..... and nothing.

Well, not quite nothing, there was a couple of lines in the 'Application Output' window 

![simctl error message](/assets/images/vs-mac-simctl-error.png)

Well, that's a new one on me - what is `simctl`? An educated guess would be a Simulator Controller - but why is that acting up? Has the Visual Studio update thrown something out?

A quick internet search and I didn't really find anything related to Visual Studio for Mac or Xamarin, all indications were that it was something to do with Xcode - but I hadn't updated that recently.

As any Xamarin developer will know, versions of Visual Studio and Xcode need to be kept in sync otherwise things get quite messy with seemingly random, but definitely unhelpful, error messages.

Some quick checks on the App Store revealed that I was already running the latest version of Xcode so that wasn't my problem - let's go back to those search results again.

They all point to a configuration within Xcode, setting the location of Command Line Tools - which simctl could very well be classed as.

Sure enough, opening Preferences within Xcode adn selecting the Locations tab showed that the Command Line Tools location was blank.

![locations tab within Xcode preferences](/assets/images/Xcode-preferences-location.png)

Clicking the dropdown revealed a single item for selection `Xcode 13.4.1 (13F100)` and clicking it brought up a request for my system password which I duly entered.

Closing down and restarting Visual Studio (maybe not needed but why not) and running the solution finally had the desired effect - the simulator opened, the app was successfully deployed and started.
