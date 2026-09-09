---
layout: post
title:  'Stepping Away From Mobile Development'
date:   2026-09-09 00:00:00
tags:   mobile-development maui xamarin blazor webassembly
---
![ai generated image showing a fork in the road signposts to the left and right. the one to the left says .net maui, ios and android and points to what looks like a dark and forboding place while the one on the right says blazor and progressive web applications with the destination looking a much nicer place to be](/assets/images/a-step-away-from-mobile-development.png){:width="300px" style="float:left; margin-right: 10px;"}
I've been quite busy recently updating the two primary personal mobile applications I maintain, getting them built against the latest iOS and Android SDKs, using the latest .NET MAUI release along with the latest packages and libraries. While the Smite Scoreboard application was pretty straightforward this time around, the Motorhome Stopover app took a lot more effort to get it ready for distribution through the respective App Stores.

Most of this time was spent dealing with changes to the iOS and Android SDKs as I'd been using functionality that was now obsolete so I needed to rip that out and get up to speed with the 'new way of doing things'. A lot of time was spent while adding no real value in terms of features that users would notice and appreciate.

Now I see that Google are enforcing new policies which will come into force in early 2027 - including 'zero-tap sign-in' so that users can easily signin when they change phones and stricter limits on memory consumption. This will be in addition to the annual chore of updating the app to comply with the requirements and policies of the App Stores. Oh, and maybe I'll have some time to add a feature or two that my users have asked for.

I've not even mentioned that these apps are free in the stores so I get nothing out of doing this, in fact it costs me $99/year for the Apple Developer Program membership.

Add to this some rather negative feedback, and I got to thinking - why am I bothering with mobile development at all?

<!--more-->

Well, after almost 15 years since I wrote my first Android app using Java and the Eclipse IDE, I'm calling it a day.

Following another 1 star review on the Google Play Store for the Motorhome Stopover app, I took a step back and had a think about what I really wanted to do during the rest of my career.

> Do I want to spend my 'free time' working on mobile applications where I spend most of my time appeasing Apple and Google rather than developing features that users will notice and appreciate?
> 
> The answer was obviously no, no I don't. 

However, I also don't want to simply abandon the current users, so I have a plan.

The plan is based on massive improvements in internet browsers which will allow me to create a web application that will be able to run on almost any device, i.e. mobile, desktop or laptop running Android, iOS, Windows, Mac or even Linux, and (crucially) provide offline access if your device losses it's internet connection.

These are called 'Progressive Web Applications' and they can act very much like mobile applications in that data can be stored locally on the device and used while the device has no internet connectivity.

Most importantly for me, I won't be beholden to Apple or Googles ever moving policies, issues with the MAUI framework or any of the troublesome packages and libraries that make up many of todays mobile applications.

Nothing will happen overnight but I have been working both projects and making good progress.

## Motorhome Stopover
The aim here is to update the existing website to make it more suitable for use on a mobile device. 

The layouts will be updated to handle the smaller screen sizes and data synchronisation logic will be added to allow registered users to download stopover data and access the site even while offline.

## Smite Scoreboard
The aim here is to create a new Progressive Web Application that will bring the current mobile app to the browser. 

All the functionality of the app will be available including;
- Individual Player Game Mode
- Team Game Mode, including the new Team Builder
- Player Avatars
- Player Reordering
- Undo Score Entry

That's it for now - I'll be back with more updates soon.