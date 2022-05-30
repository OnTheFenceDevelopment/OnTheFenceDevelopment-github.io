---
layout: post
title:  'First Xamarin.Forms app goes live in both App Stores'
date:   2018-06-18 00:00:00
tags:   xamarin mobile-development motorhome-stopover
---
A while ago I eluded to the fact that I was revisiting Xamarin.Forms for cross platform mobile development – previous projects had used the ‘native’ Xamarin.Android and Xamarin.IOS toolkit.

I was interested to see how far Xamarin.Forms had come since my last encounter where I found it lacking in some critical functionality that was required for the project at hand – primarily when dealing with Maps.

When I was approached by a user of my FillLPG application to write something along a very similar line, i.e. a number of points of interest displayed on a map with clickable markers to display more details, for both Android and iOS I wondered whether Xamarin.Forms had matured enough to do the job.

The application is a companion to the <a href='http://motorhomestopover.co.uk/' target='_blank'>Motorhome Stopover website</a> which provides it’s members with access to over 600 locations around the UK where they can park overnight for free. While these are not campsites, facilities vary from location to location, they do provide a useful service when drivers are travelling across the country to their ultimate location (not everyone wants to drive from Edinburgh to Penzance in one day and being able to break the journey is a godsend).

The app requirements were very simple, for the minimum viable product (MVP) anyway.

> Authenticated Motorhome Stopover members should be able to view all currently active locations on a map, view contact details of any location and the facilities it provides and, using the device’s built-in navigation capability, navigate a route from the users current location.

Essentially, with the addition of an FAQ and About page, the app boiled down to a map showing stopover locations and a page listing contact and facility details for a location when the user tapped on its marker. If Xamarin.Forms couldn’t deal with this then I was going to be surprised.

The client was an Android user so much of the initial development was undertaken with that in mind and I focused on getting that version to a level where it was functional and he was happy – then I would take a run at the iOS version.

Initial development was undertaken prior to the release of Xamarin.Forms 3.0 but later upgraded without any problems – nothing appeared to be broken and everything just worked.

Looking back at my previous forays into Xamarin.Forms I think that the biggest hurdle was Custom Renderers. The problem being that documentation was very sparse and with the base toolkit not providing the level of customisation I wanted I didn’t have the confidence to plough on and develop Map Renderers only to have to revert to native development.

This time around the documentation was there in abundance, along with GitHub samples and a Xamarin University course. How times have changed 😉

That said, it wasn’t plain sailing and there were still a few speedbumps along the way – although many of these can be attributed to climbing the learning curve of Xamarin.Forms rather than problems with the toolkit itself.

The best thing was, when I turned my attention to the iOS version of the app there was very little to do once the Custom Renderer for the map was completed and wired up. Everything else pretty much worked as expected with the only additional development being that of addressing minor styling and layout differences as can be seen in the screenshots below.

![stopover map](/assets/images/stopover_map.png) ![stopover details](/assets/images/stopover_details.png)	

Not withstanding the need for additional features such as searching and filtering there is still some work to do. This mainly centres around testing and everything that facilitates it, e.g. dependency injection in Xamarin.Forms and how to do this within a Unit Test.

The ease with which I was able to develop these applications and the level of code reuse has certainly confirmed to me that Xamarin.Forms is more than just a tool to create very simple applications, quick mock-ups or proof of concept apps.

Overall I’m pretty happy with the initial release of the applications. Yes they are a bit feature-light at the moment and need a bit of polish here and there, but I’ve learned the hard way that at some point you just you need to ship something otherwise it will never see the light of day!

By defining a clear Minimum Viable Product I was able to focus on the core functionality and not get bogged down in the minutiae.

<a href="https://play.google.com/store/apps/details?id=com.onthefencedevelopment.mhs" target="_blank" style="float: left;">
    <img alt="Get it on Google Play" style="height: 100px" src="{{ '/assets/images/get-it-on-google-play.png' | relative_url }}"/>
</a>

<a href="https://apps.apple.com/us/app/motorhome-stopover/id1389793428" target="_blank" style="float: right;">
    <img alt="Get it on the App Store" style="height: 100px" src="{{ '/assets/images/get-it-on-app-store.svg' | relative_url }}"/>
</a>

<div style="clear: both;"></div>