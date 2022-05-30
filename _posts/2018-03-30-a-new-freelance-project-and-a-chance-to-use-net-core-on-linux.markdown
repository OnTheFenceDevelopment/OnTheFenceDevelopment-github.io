---
layout: post
title:  'A New Freelance Project – and a Chance to Use .Net Core on Linux'
date:   2018-03-30 00:00:00
tags:   web-development freelance motorhome-stopover
---
I was recently approached by a website owner, who had seen the FillLPG for Android application and wanted a similar mobile application, i.e. an app which displayed a number of points of interest on a map and allowed it’s users to select a location and have further details displayed.

With my experience with FillLPG I was happy enough that I would be able to create applications to render the map with the points displayed in the appropriate location. The big question is – where is the data coming from?
<!--more-->
## The current situation

The website in question is fairly dated, in the order of 10 years old, written from scratch in PHP (not something like Drupal or Joomla) and backed up by a MySQL database.

The existing database is somewhat badly structured (in terms of todays programming practices) with no foreign keys, endless bit fields for HasThis and HasThat properties and a disjointed table structure (properties which you would think would reside in one table are in fact in another – manually linked by an id value).

There is no API that I can access from the mobile application – it’s just not there and there is no resource to create one.

## The way forward

So, how do I access the data return it in a sensible format?

After a bit of thought I decided that the best option would be for me to create a WebApi project for the mobile apps to access. This project will access a separate MySQL database (with a structure more in line with what I need) which will be populated & updated by a utility program that I will also develop and execute on a regular basis (this is not highly volatile information that changes frequently).

## So why .NET Core? You don’t need that to develop a WebApi project!

Glad you asked and my initial reply would probably be – ‘Why not?’. As a contractor I feel it is vital to keep your axe sharp and your skills up to date. I’m starting to see a few contracts now for .NET Core so it makes sense to keep my skills relevant.

After come careful analysis I decided that the most cost effective hosting for this solution was on a Linux based server. Yes, I know I can do that on Microsoft Azure but there are far cheaper services out there offering Linux hosting, so I’m going to use one of those.

Now, the only reason I can even consider using a Linux host is because of .NET Core. This allows me to develop using .NET technologies and C# – my development stack of choice.

But would it allow me to do what I intended to do? Could I create a WebAPI application to allow the mobile applications to access the data? What about the ‘Data Shuttle’ utility that will populate and maintain the data between the website database and the new WebAPI one?

Well, I’m happy to say that the answer to that question is yes, it will – and it did.

I’m writing this post after developing the initial, server side components, i.e. the Data Shuttle and WebAPI, and everything it working well – you would not know from the outside that the endpoints are not hanging off an Azure instance.

There were some pain points along the way and I’ve not answered all of my questions quite yet, things like logging and error notification, but everything I need for a Minimum Viable Project (MVP) are now in place from a server side perspective.

I have a handful of posts drafted at the moment which will dive deeper into the development for this project but here are a handful of links that you may find helpful in getting started:

- <a href='https://www.microsoft.com/net/download/linux-package-manager/ubuntu16-04/sdk-current' target='_blank'>Installing .NET Core SDK on Linux Ubuntu 16.04</a>
- <a href='https://www.microsoft.com/net/learn/get-started/linux/ubuntu16-04' target='_blank'>Get Started with .NET Core in 10 minutes</a>
- <a href='https://docs.microsoft.com/en-us/aspnet/core/host-and-deploy/linux-nginx?tabs=aspnetcore2x' target='_blank'>Host ASP.NET Core on Linux with Nginx</a>
