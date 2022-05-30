---
layout: post
title:  'Xamain.iOS – Mapping & My Location'
date:   2015-08-16 00:00:00
tags:   xamarin ios mapping
---
So, you’ve created your `MKMapView` in your view controller and instantiated a `CLLocationManager` which you’ve called `RequestWhenInUseAuthorization()` on. Everything tells you that this should be enough so that when the Map loads and requests the current location iOS will prompt the user whether they want to allow the device to share it’s location – but the prompt is never displayed and neither is the location.

I watched a <a href='http://xamarin.com/university' target='_blank'>Xamarin University</a> course on iOS Mapping (IOS 230) and when I followed along with the exercise using a new project (not the one provided in the course materials) the location was still not displayed. But, when I ran the Completed project in the course materials I was prompted to allow location sharing and when I clicked ‘Allow’ the location was displayed. Looking at the code it did not seem to be any different from mine (but of course it had to be).
<!--more-->
I finally found the missing element – it was a missing property in the `Info.plist` file. The Xamarin course materials had it but it was not mentioned during the course itself.

The good news is that it is super simple to fix this:

- Open Xamarin Studio
- Open Info.plist
- Using the tabs at the bottom of the window – select ‘Source’
- Click the ‘Add new entry’ text at the bottom of the table and add a new String property as follows:
    - Property: NSLocationWhenInUseUsageDescription
    - Value: Show map location
- Save the file

<br>
![fixing location setting in info plist](/assets/images/fixing_location_in_info-plist.png)

That’s it – run the app again and (as if my magic) you will be prompted to allow access to your location and (if you click Allow) your location will be displayed.

![ios location permission request and map showing location](/assets/images/ios-map-location.png)