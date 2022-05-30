---
layout: post
title:  'Unable to deploy Xamarin Android app to GenyMotion emulator'
date:   2016-09-19 00:00:00
tags:   mobile-development visual-studio xamarin
---
We all know that when you are developing mobile apps there is nothing better than running on an actual device. This is especially useful when wanting to access the device sensors such as GPS and the accelerometer. But we also all know that we have to test against a wider variety of devices than we have in our drawer. That’s where emulators come in – and where the trouble starts in some cases, but I won’t go into Hyper-V here!
<!--more-->
Well I’ve been using GenyMotion for a little while and am very happy with it – to the point that I was about to put my hand in my pocket to buy a licence (which I may well still do). However, today I ran into a problem where Visual Studio would refuse to deploy to the emulator.

With the emulator running I selected it as the deployment target in Visual Studio and pressed F5, the build completed successfully and then, just before deployment the emulator disappeared from the list of targets and the deployment failed. I made sure I had the latest version of Genymotion installed (which I did) and that everything else was up to date (which it was).

While I was badgering Xamarin in the forums and via the support email I thought to fire up the Android Debug Bridge (adb) command prompt from within Visual Studio to check what devices the Debug Bridge was actually connected to:

![android debug bridge devices output](/assets/images/android-debug-bridge-devices-output.png)

Well, there you have it – it’s a problem with the adb versions ….. wait a minute, how many do I have?

My understanding was that I should only have one – the one that Visual Studio connects to so that it can access the Android devices & emulators. And (I think) I was right on that score – I should only have on running. So what’s with the version clash?

As it happens, Genymotion also ships with a version of the Android Debug Bridge and as it turns out, right now that one and the one shipped with the Xamarin toolset are not the same version.

Comparing versions of adb.exe (from Genymotion and the Android SDK) I found that Genymotion was currently at version 1.0.32 while the Android SDK has 1.0.36.

So what to do?

I suppose I could copy the adb files from the Android SDK into the Genymotion installation – but that frankly smells a bit to me and as it turns out it’s unnecessary.

It is possible, within Genymotion, to set which ADB instance to use for each individual emulator. Simply select the emulator instance and click Settings. Select the ADB tab, click ‘Use Custom Android SDK Tools’ and browse to the SDK location on your system.

![genymotion debug bridge settings](/assets/images/genymotion-adb-settings.png)

Note that the SDK will be in a folder called ‘Android’ within `C:\Program Files (x86)` or `C:\Users<user>AppDataLocal`

Setting this resolved my issues and I am once again enjoying the flexibility of Genymotion and will be buying a licence very shortly.