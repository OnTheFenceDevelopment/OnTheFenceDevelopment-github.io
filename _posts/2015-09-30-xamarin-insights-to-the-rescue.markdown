---
layout: post
title:  'Xamarin Insights to the Rescue'
date:   2015-09-30 00:00:00
tags:   xamarin webservices fill-lpg
---
So, calling webservices from mobile applications is a solved problem yes? Well, not quite. I’ve been developing desktop and web-based applications for many years now and when it comes to accessing the Internet there are normally only a couple of scenarios to consider, you either have access or you don’t – simple.

However, in the world of mobile it’s not that simple. Mobile devices are just that, mobile, and can move in and out of coverage and between data connections numerous times during an application lifecycle. As mobile developers we know that this happens and we guard against it but checking that we have a valid connection and maybe even that we can ‘ping’ the target resource somewhere out there in the cloud.
<!--more-->
Well, I thought I’d done all that within the FillLPG application. I knew, absolutely knew, the format of the content that the webservice would return, which is currently XML, and had suitable methods in place to parse that data. So imagine my confusion when I start receiving error reports like this:

![xml exception](/assets/images/xml-exception.png)

The above is from the <a href='https://xamarin.com/insights' target='_blank'>Xamarin Insights</a> dashboard which provides me with near real-time crash and issue reporting. There was dozens of records like this in the logs and it was really confusing because I know that the webservice should be returning the following XML:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<colours>
  <green>53.9</green>
  <yellow>59</yellow>
</colours>
```
So, why on earth was the app complaining about a DTD reference?

Well, with a quick configuration tweak I was able to find out. I added the response to the exception data before sending the report to Insights so that I could see what the method was actually returning:
```csharp
catch (Exception ex)
{
    ex.Data.Add("Thresholds XML", xmlResponse);
    Insights.Report(ex);
    throw;
}
```
And this was the result.....

![xamarin insights in action](/assets/images/xamarin-insights.png)

This was not the XML is was expecting and explains why the parsing method were choking. But where was this HTML page coming from? I was sure it was nothing to do with the FillLPG website.

Reading through the markup it was clear that this was a login page for a Wifi Hotspot! The device had connected to it but it was not authenticated so the calls to the FillLPG webservice were just being redirected to the login page.

I was able to replicate this scenario by configuring my router to block all traffic to the FillLPG site and then hitting refresh (or any operation that invoked a webservice call). The router then redirected to the ‘This Site Is Blocked’ page and the app crashed!

The fix for this was fairly straightforward and I’ll put another post together for that, but I was already checking the Status Code of the Response and assumed, wrongly as it happens, the a value of 200 indicated a successful operation.

I was also using the <a href='https://github.com/jamesmontemagno/Xamarin.Plugins/tree/master/Connectivity' target='_blank'>ConnectivityPlugin</a> and checking for an active connection AND that the site was reachable – but for some reason these tests were passing even though the router was actively blocking connection to the webservice.

So Xamarin Insights has saved the day for me again. There is no way I would have located this issue without it and while it is still ‘In Preview’ it is proving to be an invaluable tool for tracking down even the most elusive of bugs.