---
layout: post
title:  'Updating an end of life application'
date:   2019-03-08 00:00:00
tags:   mobile-development xamarin fill-lpg development
---
![fill lpg logo](/assets/images/filllpg_logo.png){:width="200px" style="float:left; margin-right: 10px;"}
A while ago <a href='https://www.onthefencedevelopment.com/filllpg-for-android-is-dead-long-live-filllpg-for-android/' target='_blank'>I posted that the FillLPG for Android application was, in a word, Dead!</a> But in few days time users will notice a new version, 2.0.28.5, hitting the Play Store as well as in-app notifications to update – so what gives?

Have I changed my mind about withdrawing support for this app – no, I haven’t. Essentially my hand has been forced by Google’s recent decision to deprecate some of the functionality I was using to fetch nearby places as part of the ‘Add New Station’ wizard as well as requiring 64 bit support – the latter being little more than a checkbox and nothing that most users will ever notice.
<!--more-->
## Removal of the Places Picker

Prior to the update, when adding a new station a user could specify the location in one of two ways;

- Select from a list of locations provided by the Google Places API and flagged as ‘Gas Stations’
- Open a ‘Place Picker’ in the form of a map and drop a pin on the desired location

<br>
It is the second option which is now going away – and there is nothing I can do about it. Google are pulling it and that’s that.

The Place Picker was added as I noticed that a nearby ‘Flogas’ centre, where you could buy cylinders of LPG and also refill your vehicles tank, was not on the list returned by Google Places. Using the Picker it was possible to zoom and pan in order to locate the desired location. It was also useful if you weren’t actually present at the station you wanted to add, i.e. it wasn’t nearby!

So where does that leave users (apart from heading to the Play Store to complain and leave a 1 star review!) – well, if the desired location is not displayed in the list then they will need to head over to the website and add the station there. Not as convenient as using the app maybe but not rocket science either.

## But why bother if the app is ‘Dead’?

Well, after viewing some in app analytics I found that on average around 25 new stations were added, via the app, each month so there is a chance that users would bump up against this problem when trying to open the Place Picker – chances are that the app could simply crash out.

If the ‘Add New Station’ feature wasn’t being used I’d probably just have removed the menu option and have done with it.

But enough users were using it so I set aside a couple of hours to investigate and remove the Place Picker and it’s associated code while leaving the ‘Nearby List’ in place – even if it will only contain locations flagged by Google Places as being ‘Gas Stations’.

## In Summary

In this instance the required update was not too onerous – just a couple of hours of work really, however, this may not always be the case.

Android is always evolving and Google could well make changes to other areas of functionality that could adversely affect the application and require a lot more development effort, e.g. forcing a migration to the new version of the Maps API.

In that instance it would probably the end of the road for the app and it would either have to hobble along or be pulled from the Play Store altogether.

For now though, it’s business as usual 🙂