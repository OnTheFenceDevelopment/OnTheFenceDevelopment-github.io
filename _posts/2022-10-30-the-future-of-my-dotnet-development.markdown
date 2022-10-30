---
layout: post
title:  'The future of MY dotnet development'
date:   2022-10-30 00:00:00
tags:   dotnet development configuration
---
It's been a few months since my last post, mainly due to the tedious process of moving house in the UK, but also due to work committments etc.

That doesn't mean that I've lost touch though - I'm keeping up to date with the development of MAUI (and whether it is actually ready for production use) and the constant evolution of dotnet (or is it .NET? - who knows these days).

During the previous decade I've been working as a contractor and an employee, in numerous sectors on a wide variety of projects built using various incarnations of the .NET Framework.

As the end of 2022 approaches I'm now looking forward, maybe not a full decade ahead but change is coming and I need to be ready for it.
<!--more-->
I've been developing software professionally for almost 25 years now, although I was writing programs back in the 1980's using my trusty ZX Spectrum (yes - I'm that old). During that time I've used numerous languages and seen the evolved over time - C# in particular.

While working as a contractor I found that I was expected to be up to date with the latest language features - normally because I was joining a team working on greenfield projects that had been created using the current versions of the framework. Sometimes I was brought in to work on established projects though so being able to work with 'older' codebases was also important.

Now that I'm working as an employee (for a previous client) I'm working on a project that was started when .NET Core 3.1 was the new kid on the block so for the past two years or so I've been kinda 'stuck' working on what will soon become an unsupported framework. While I've been watching the Pluralsight courses on the new shiny versions of .NET and C# it's very easy to forget it all when you are not actually using the new skills.

Well, we finally have the time to upgrade it to .NET 6.0 (is it Core or not now - who knows?) which has required a bit of reading to see what (if any) breaking changes exist between 3.1 and 6.0 as well as improvements in the C# language.

While going through the research and planning for the upgrade I started to think about my own personal (and semi-personal) projects and wondering whether I should be bringing them up to date.
Currently I have a handful of web applications ranging from .NET Framework 4.5 to NET Core 3.1 and a couple of Xamarin Forms 5.0 apps so what should I do to bring these up to date - indeed, should I even bother?

### First of all ... Framework 4.5! What the hell man!
The .NET Framework 4.5 web application is actually a fairly regular data entry & report system that I wrote for my local church. They use it to manage their parishioner data, record baptisms, generate letters and run reports.
I've taken a run at bringing this up to date for a few years now but never really got any traction on it - and the client isn't really pushing for any new features so is there really a need to do anything to it?

The options here are to do nothing, upgrade to Framework 4.8 (the latest .NET Framework) or create a new .NET 6.0 project and 'migrate' the code over.

Frankly, the jury is still out on this one.

### OK, what about the .NET 6.0 app
This was written for a client when I was contracting and I still maintain it for him - although again, there haven't been that many changes to or issues with the site over the past couple of years so I've not needed to touch it.

This is a prime candidate for an upgrade to NET 6.0 and refactoring through with C# 10 language updates, in particular records and updated pattern matching.

### So what about the mobile apps?
The apps, Smite Scoreboard and Motorhome Stopover, are currently in both Stores and while the former is effectively 'done', i.e. I'm not planning on making changes any time soon, I am thinking that the Motorhome Stopover app needs so attention over an above the platform update.

But there is a problem - and it's called MAUI.

MAUI is the replacement for Xamarin.Forms and was released fully in May this year - five months ago at the time of writing - but it is still quite immature and numerous issues have been reported.

So what do I do?

Do I invest time migrating the apps from XF 5 to MAUI or do I just upgrade all the packages to their latest versions and have done with it for now - Xamarin Forms is supported until May 2024 after all and MAUI will mature in that time.

Well, I'm not going to learn anything about MAUI by avoiding it but I could very well end up having to throw everything out and abandon it. Although if I fail fast I don't think I would class that as a failure.

So taking complexity into account I think I'm going to have a run at migrating the Smite Scoreboard app to MAUI while bringing the Motorhome Stopover app up to date in terms of packages but leaving it on Xamarin Forms 5.0.

### But that's only part of the puzzle
I'll post more about this later but I'm also thinking that I need to upgrade my aging development hardware - but what do I buy?

I have a custom built Windows workstation, a Microsoft Surface Pro, a MacBook Pro and an iMac.

- The workstation is running Windows 10 but (inexplicably) won't run Windows 11. 
- The Surface Pro is in the same position as the workstation.
- The Macbook Pro is running Monterey but won't run Ventura.
- Finally the iMac .... is actually [running Ubuntu Linux]({% post_url 2021-12-15-running-linux-on-a-mac-why %}).

So taking into account that I need to develop Web as well as Android & iOS apps what do I do?