---
layout: post
title:  'The future of my Development Setup'
date:   2022-12-21 00:00:00
tags:   development hardware
---
In a [previous post]({% post_url 2022-10-30-the-future-of-my-dotnet-development %}) I presented a rather rambling review of my plans to keep my skills up to date as I look forward to major project updates at work and within my own pet/portfolio projects.

In this post I'm going to need to take a look at my existing, somewhat aging hardware with a view to not only making sure that I can run all the required tooling but also take into account that I'm in the process of moving house, downsizing now that the kids have all left, and will have a much smaller office so won't have enough space for all my current equipment - which also needs to be downsized.
<!--more-->
Like most developers, I have accumulated quite a lot of 'kit' over the years and I'm never keen to just get rid of it - but I simply don't have the room for it all.

Currently I have:

- A 12 year old, custom built workstation running Windows 10 but (inexplicably) won't run Windows 11. 
- A 2018 Microsoft Surface Pro which is also running Windows 10 but (even more inexplicably?) won't run Windows 11.
- A mid 2015 Macbook Pro running Monterey but won't run Ventura.
- An old iMac which is currently [running Ubuntu Linux]({% post_url 2021-12-15-running-linux-on-a-mac-why %}).

Currently the iMac is the only device I seldom use on a regular basis - I may well restore the latest version of macOS that will run on it (Maverick I think) and either sell it on or give it away. One down.

### The Workstation
The workstation is essentially my daily driver and has been for over a decade. Running an i7 3770, 32GB RAM, SSDs and until recently a GeForce 350 GPU (long story). Running Windows 10 Pro and connected to a 32" curved Samsung primary display and a 24" Asus secondary it has served me well (and frankly still does). I'll be loathed to get rid of it.

But, it won't run Windows 11 and while I personally don't really care about that there is the issue of Visual Studio compatibility. Currently Visual Studio 2022 requires Windows 10 as a minimum, i.e. it will not run on Windows 8 anything earlier.

So, what about Visual Studio vNext? What operating system requirements will that have - will it support Windows 10 or will it require Windows 11? If it's the former, then there isn't an issue but if it's the latter then I have a problem - but ultimately Visual Studio will, undoubtedly adopt a requirement for Windows 11. The clock is ticking.

### The Surface Pro
This ultra portable device is a great piece of kit and surprisingly capable - running Windows 10 and all the current dev tools I need, e.g. Visual Studio 2022, SQL Server + Management Studio, MySQL + Workbench etc.

The problem is that, despite being a much newer device, Windows 11 is not compatible with the Surface Pro - so I have the same problem as I have with the workstation, ultimately I won't be able to run Visual Studio.

I am aware that I can 'force' install Windows 11 on the Surface Pro, and maybe the workstation, but am I just storing up trouble for later?

### The Macbook Pro
This replaced the iMac when it stopped receiving operating system updates - and hence stopped receiving XCode updates (XCode being required to build iOS applications - even if they are written with Xamarin or MAUI).

Well, the MacBook Pro is now in the same position as the iMac it replaced - it's no longer receiving macOS updates so it stuck on Monterey. What I don't know is how long Xcode will support this version.

As soon as XCode drops support for Monterey then the MacBook Pro will no longer be able to be used to build iOS apps that the App Store will accept (apps need to be built using at least a specified version of XCode and iOS).

At the time of writing the current version of XCode is 14 while the current version of iOS is 16. <a href='https://developer.apple.com/support/xcode/' target='_blank'> 
Apple state</a> that apps must be built with at least iOS 15 using at least XCode 13.

Looking at <a href='https://learn.microsoft.com/en-us/visualstudio/releases/2022/mac-system-requirements' target='_blank'>Visual Studio 2022 for Mac</a> the miniumun macOS version is actually Catalina (that's two Operating Systems back from Monterey to save you looking) so it doesn't look like that will be a problem - for now and assuming the same cadance.

Taking the above into account, even if XCode 15 doesn't support Monterey it looks like the MacBook Pro currently has some life left in it even if it's 'only' for general web development.

### Options
The high level options are Windows or Mac - if I opt for the Mac then there is are only really a couple of options, both MacBook Pro models varying by screen size and CPU (and of course price).

If I go for Windows then the choice is must wider but I'd probably look at the Dell XPS 15, HP Spectre or Lenovo Thinkbook.

But there's a problem; if I go for Windows then ultimately I'll be unable to build iOS apps when the MacBook Pro becomes unsupported by XCode. The question is, does that matter? If it does then are there viable alternatives I can use to perform my builds, e.g. AppCenter or MacInTheCloud.

On the other hand if I go for the Mac then, as a developer using Windows for some time, I'll need to get up to speed with the Mac way of doing things and make sure that I can do everything on a Mac that I can do on Windows. I know I can run SQL Server on a Mac using Docker but I don't know what I don't know ;-).

So that's what I intend to do for the next month or two - in conjunction with the development plans from my previous post I will try to work on the Mac as much as I can and see where I get to (attempting to blog my findings of course).