---
layout: post
title:  'Flicking the switch on Github Pages'
date:   2022-07-18 00:00:00
tags:   github-pages
---
Well, after a couple of months of investigations, configuration and migration the move from Wordpress to Github pages is all but done - just a few DNS configurations and you'll be reading this post.

My previous half a dozen posts describe the journey from Wordpress to Github Pages, my motivation for the move, the mechanics and the hurdles I faced. 

In general the process of hand migrating each and every post, reviewing the progress in technology since 2009, fixing typos & broken links was quite enlightening. Things have moved on a lot in that time and I have tried to keep up as best I can - knowing that I will never know it all.

With this mini-project all but complete I can now start to think about what's next on my TODO list - and it looks like it's moving my other, personal, blog from Wordpress before it's subscription expires.
It's much smaller than this blog and knowing what I know now it would be quite simple to migrate it to Github Pages - but I'm not going to..!
<!--more-->
The person who suggested moving to a static website has a personal Blazor project, <a href='https://github.com/GeorgeLeithead/BlazorBlog' target='_blank'>hosted on Github</a>, that can generate a website suitable for hosting, for free, on <a href='https://azure.microsoft.com/en-gb/services/app-service/static/' target='_blank'>Azure Static Web Apps</a>.

So, in the spirit of 'On The Fence' I'm going to solve the same problem in a different way. I'm going to take what I've learnt from the migration to Github Pages via Jekyll, incorporate it into an existing project to get some hands on experience with a technology I've not used in anger and write about it as I go. Simple ... isn't it?

As a bit of a teaser, but not a spoiler because I don't know how I'm going to do any of it, the main areas I want to look at are:

 - The base project uses encoded HTML in a single JSON file as it's datasource (no database remember, this is a static website) but I would prefer to use straight HTML markup in separate files for each post.
 - The base project has a number of hardcoded parameters, e.g. base url for the site, and I'd like to be able to pull these into a configuration file so that I can build the project in different configuration, e.g. debug, staging and release so that I can run the output locally and on remote servers with all the links working as expected.
 - The base project uses the out of the box styling contained in the Visual Studio Blazor project - using my rudamentary CSS skills I want to create a simple but effective layout.

<br>
The first thing I need to do is brush up on Blazor - when I say 'brush up' I mean take rewatch the Pluralsight courses I've already watched without a practical application in mind. This means that I've probably forgotten it all as I didn't reinforce the lessons.

When I can get started on the development of the work outlined above - I have until 14th November to get it done, that's when the current Wordpress subscription expires.