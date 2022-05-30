---
layout: post
title:  'Xamarin Gotcha – Care needed when taking a photo with the Xam.Plugin.Media plugin'
date:   2018-06-22 00:00:00
tags:   xamarin mobile-development
---
I’m currently writing a Xamarin.Forms scoreboard application which, as part of the functionality, allowed each player to take a photo which would be displayed within their ‘player tile’. I made use of the <a href='https://www.nuget.org/packages/Xam.Plugin.Media' target='_blank'>Xam.Plugin.Media plugin</a> developed by <a href='https://montemagno.com/' target='_blank'>James Montemagno</a> to implement this feature and everything was working like a charm. I then parked the project for a couple of months while I attended to some paying development and training.

When I returned to the project I looked at the outstanding items on my backlog and decided to implement the saving of game state when the app is backgrounded. This was pretty straightforward and I had it nailed in a few hours by adding code to the OnStart, OnSleep and OnResume handlers in the shared class library (in this case, a PCL). After testing the functionality I then ran through a manual ‘smoke test’ to make sure everything was working as expected – and that’s when the trouble started 🙁
<!--more-->
I was initially working on the Android version and I quickly discovered that the photo taking functionality appeared to be broken. When I took a photo and then accepted it using the Android camera app I was taken back to a blank player list!

This didn’t used to happen – this was working code and I was certain I hadn’t change anything to do with the player photo code.

## Nuget?

I then decided to create a quick and dirty app to pull in just the packages I needed to take a photo and display it within a view – and that worked just fine using the same versions that I had in my project, so the “problem” was in my code.

Returning to my code, the first thing I tried was to update all the Nuget packages. Some time had passed since I’d last opened the project and there were a number of updates pending. I was testing on my Pixel 2 XL running Android P (I’m in the beta program) and maybe, just maybe there was a mismatch here. As it was, this made no difference but it was a good job done – I’d have needed to do this anyway so no time like the present.

## PCL v .NET Standard?

One major difference was that my app was using a Portable Class Library (PCL) while the sample app used .NET Standard (as you can’t create a PCL version now). Maybe that was my problem – maybe I needed to upgrade to please the plugin and/or Xamarin.Forms 3.0. Deciding it was another useful exercise anyway I decided to do just that – I created a new shared class library using .NET Standard and pulled my code over (a very simple process considering).

No joy – the problem persisted!

Then, in a moment of clarity, I wondered whether this was a problem was present in the iOS version of the app and to my surprise I found that it wasn’t. Running the smoke test on an iPhone 6s demonstrated the expected behaviour.

Going back to Android and diving into <a href='https://developer.android.com/studio/command-line/logcat' target='_blank'>logcat</a> I didn’t find anything obvious in terms of errors but then I saw a debug output message that I had added to the OnResume handler while developing the Save Game functionality. Why was that being called?

## Eureka!

Then the penny dropped and it’s a fundamental part of the way that Android works.

When I called into the plugin to take the photo it opened up the Android Camera app – temporarily backgrounding my app in the process. When the user takes and accepts the photo, the Camera app will return control to my app, passing it the image data, and thus bring it into the foreground.

Of course, when the app is backgrounded the OnSleep handler is called and when it is brought into the foreground OnResume is called. In my case the OnSleep handler wasn’t a problem, but the OnResume hander was a different matter.

When resuming the app will now attempt to locate any saved state and if found it will deserialise the data and initialise the state to continue the saved game. But, if no saved state was found it will assume that the app is being opened with no saved state so it would just create a new game – and this is what it was doing, creating a new game with an empty player list!

A quick update to handle this unexpected backgrounding/foregrounding behaviour and I was back to a fully working app on iOS and Android.

The fact that the camera app was temporarily backgrounding my app didn’t dawn on me at the time but when I thought about it it was obvious.

A frustrating few hours to be sure but at the end of the day the app is now working the way it was intended to work and it’s now running with .NET Standard with all Nuget packages updated.