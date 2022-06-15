---
layout: post
title:  'Running Linux on a Mac! Why?'
date:   2021-12-15 00:00:00
tags:   development linux ubuntu
---
![ubuntu linux running on an old imac](/assets/images/linux-on-imac.png){:style="float:left; margin-right: 10px"}
I never like to throw anything away and when it comes to technology, you never know when you may need it.

So when my 2013 iMac stopped receiving OS updates from Apple I wondered what I could do with it.

Afterall, if it won’t run the latest OS then it won’t run the latest version of XCode and if it can’t run the latest version of XCode then I can’t use it to develop apps for iOS. More accurately, I can develop the apps but because I can’t compile against the latest SDK ultimately the App Store will reject them.

As my MacBook Pro had taken over the role of Xamarin development system the iMac had sat under my desk, unused for months.

So while Apple’s policy of, essentially, obsoleting my hardware is frustrating that doesn’t mean I have to throw the whole thing out – that’s not in my nature. So what could I do with it?
<!--more-->
Well, I’m aware that some people install Windows on obsolete Apple hardware I have no need for such a setup – I have a powerful, albeit ageing, workstation running Windows 10 as well as a Surface Pro which may (or may not) be compatible with Windows 11.

So, as a .NET developer knowing that .NET Core can be installed on Windows, Mac and Linux I thought I would give it a whirl. Install Linux on the Mac, followed by .NET Core and Visual Studio Code (which also has a Linux version).

Step one was to install Linux which was remarkably easy as it happens. After copying the .iso onto a USB key using Etcher, plugging in it and powering up the iMac with the option key pressed I entered the standard Linux setup process. I followed these instructions on the <a href='https://www.macworld.co.uk/how-to/how-install-linux-on-mac-3637265/' target='_blank'>MacWorld website</a> and soon had Ubuntu 20.04 up and running.

Next I headed over to the <a href='https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu#2004-' target='_blank'>Microsoft website</a> to get the .NET Core SDK and Runtimes I needed – I installed versions 3.1 and 6.0 with a few basic commands entered into the Terminal.

Finally I downloaded <a href='https://code.visualstudio.com/' target='_blank'>Visual Studio Code</a> from the Microsoft Website (<a href='https://linuxize.com/post/how-to-install-visual-studio-code-on-ubuntu-20-04/' target='_blank'>it is available as a Snap package</a> but I like to know what I’m installing). and my Git client of choice, <a href='https://www.gitkraken.com/git-client' target='_blank'>GitKraken</a>, so that I could pull down my source code.

After opening the solution Visual Studio Code prompted me to install a couple of extensions and boom – my code was building and running … on Linux … on a Mac.

Big deal, now what?

I can’t develop iOS application with this setup – but then I don’t really do a great deal of Xamarin development at the moment and I still have my MacBook Pro.

What I can do is develop web applications using a wealth of .NET technologies, e.g. MVC, Razor Pages and Blazor. I can connect to MySQL and (using a Docker container) SQL Server databases.

And that’s what I intend to do and see how far I can go with this setup – and maybe I’ll even write about it 😉