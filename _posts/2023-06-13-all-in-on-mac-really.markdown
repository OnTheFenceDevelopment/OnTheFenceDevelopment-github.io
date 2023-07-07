---
layout: post
title:  'What was stopping me going to Mac - Visual Studio'
date:   2023-06-13 00:00:00
tags:   hardware development visual-studio-for-mac jetbrains-rider
---
Towards the end of last year, with my Windows and Mac system getting on in years, I was contemplating what hardware I would need to buy. I didn't really want to replace BOTH systems so I decided I would need to pick one or the other - but which one would it be?

Well, for a number of reasons that I may post about later it's going to be a Mac (yes, if you know me I know what I said but times change) but there was still a fly in the ointment - Visual Studio for Mac.
<!--more-->

Visual Studio for Mac <a href="https://en.wikipedia.org/wiki/MonoDevelop#Visual_Studio_for_Mac" target="_blank">started life as MonoDevelop</a> and despite what that link says about it, it most certainly does not employ "many of the same tools as its Windows counterpart". 

While it might be a step or three away from Notepad it is light years from Visual Studio 2022 for Windows. Although I've been using it for a while it's mainly been to spin up a Xamarin iOS application in the simulator with much of the development being carried out on the Windows systems.

During a recent contract I needed to be on site a couple of days a week and as the rest of the development team was using MacBook Pros so it made sense that I used my, somewhat aging, Macbook Pro. But this meant that I would be doing full blown ASP.NET Core development using Visual Studio for Mac - and it wasn't a great experience.

Not only did it show that my Mac is certainly beginning to struggle it also highlighted the gulf between Visual Studio for Mac and Visual Studio 2022 for Windows.

Now I know that there are extensions for Visual Studio for Mac and that I can probably get pretty close to the Windows version. But that's not the point is it? What happens when (and it will be when) one of these extensions stops being actively developed? What happens when something changes in .NET and the extensions don't support it or are slow to do so. I mean, we've all experienced that with nuget packages being abandoned haven't we.

Well I don't want to be left in a situation like that with the principle tool I use for work. So was this a show stopper for me going over to Mac?

Well, no - it isn't.

Enter <a href="https://www.jetbrains.com/rider/" target="_blank">Jetbrains Rider</a> - a full blown, cross platform IDE for .NET and it turned out to be a game changer.

Rider may seem like the new kid on the block but it's based on the <a href="https://www.jetbrains.com/rider/" target="_blank">Jetbrains IntelliJ IDE</a> which is a mature IDE for Java and Kotlin so it has some pedigree behind it. Now I had some reservations about an IDE with reSharper built into it as I've had issues with that particular tool in the past where it brought my system to a crawl when installed as an extension to Visual Studio.

But Rider is a different kettle of fish. It's not trying to integrate reSharper with a third party tool, i.e. Visual Studio, it's built into the heart of the system and performance is certainly not an issue, even on this old Macbook Pro.

When I opened the clients solution in Rider the code editor just lit up with refactorings and other potential issues (nothing dramatic but VS for Mac certainly didn't highlight three quarters of what Rider did).

From potential null references and unused variables to things like `Use 'nameof' expression to reference parameter 'password' name` and `Inline 'out' variable declaration` - things that the eye may gloss over when scanning the code. Small improvements that can be made to make the code more maintainable and/or easier to read.

It could be said that I, as an experienced developer, should see all these things anyway without them being pointed out - but if that was the case we'd all be writing bug free code using vim. We all need a helping hand from time to time. Mind you, it should also be remembered that I didn't write any of this code.

The refactorings in Rider are very powerful, being driven by reSharper, and most can be accessed quickly via keyboard shortcuts so you don't even have to take your hands off the keyboard which only increases your productivity.

I opted for the dotUltimate bundle which includes the additional dotTrace, dotCover and dotMemory tools. At a difference of just £15 it was an absolute no-brainer and I would have happily paid that for dotCover (a tool to view and assess unit test coverage) on it's own.

So, the move from Windows to Mac is a step closer - all I need to do now is work out what model and spec to go for. I've been looking at the Macbook Pro but recently on Mastodon someone mentioned that the Macbook Air would probably be more than capable so I need to check that out.