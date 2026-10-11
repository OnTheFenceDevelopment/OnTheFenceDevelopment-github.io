---
layout: post
title:  'Moving from MAUI to PWA with a Little Help'
date:   2026-10-09 00:00:00
tags:   maui progressive-web-application pwa
---
![the new smite scoreboard web application](/assets/images/smite-scoreboard-pwa-beta.jpg){:width="220px" style="float:left; margin-right: 10px;"}
In my previous post I announced that I was stepping away from mobile development in favour of Progressive Web Applications (PWA). These look like regular websites and while they can be used as such they have a few tricks up their sleeves - and these lend themselves well to taking the place of mobile applications in many situations.

I've had time to look into the viability of the migrations for the two mobile applications I currently maintain, i.e. Smite Scoreboard and The Motorhome Stopover, and can report that it's full steam ahead.

While I've confirmed that the existing Motorhome Stopover website, which I also maintain, can be extended to provide offline access to the services, this post will focus on the changes that I've made to the Smite Scoreboard app and the journey that I've taken to get to a point where I have a brand new PWA that has feature parity of the existing iOS and Android apps.
<!--more-->
The mobile apps were initially written using Xamarin but were migrated to MAUI a few years ago - not trivial task I can tell you, but a necessary one.

I'd structured the code in three main projects; one for the MAUI related classes and views, one for the unit tests and one for the shared classes and business logic. This was to enable me to develop unit tests etc over the game logic and rules without having to pull MAUI related packages into the Unit Test project. This turned out to be quite forward thinking of me because I would be able to utilise the existing, battle-tested logic that applied the rules of the game and drove the UI.

Now, I've been developing web applications for a couple of decades now and I won't bore you with the technologies that I've seen come and go - but while I knew what PWAs were and what they could offer, I'd never actually built one.

So, I followed the current trend and asked the AI Assistant built into Jetbrains Rider, Junie, to perform and initial evaluation and determine the feasibility of the migration away from MAUI. After a positive response indicating that not only was is possible but given the information I'd provided, very sensible I pulled the trigger. By which I mean I said 'OK Junie, make it so' (yeah - the prompt was more involved than that but I just wanted the Picard reference).

![jean-luc picard make it so meme](/assets/images/make-it-so.jpg)

What happened over the next couple of hours was quite astonishing to me. Not only did Junie orchestrate the creation of a new project within my solution, It created views and layouts based on those in the MAUI project, hooking them to the View Models based on the MVVM versions that previously existed, backed by the existing business logic.

The result of a couple of hours of prompting, re-prompting and manual tweaking was a web application that not only matched the current mobile apps in terms of appearance and UX, but it had enhanced the UI to include elements that hadn't been requested but were valuable additions.

<table>
  <thead>
    <tr>
      <th>Current Mobile App</th>
      <th>New Progressive Web App</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="width: 50%"><img src="/assets/images/smite-scoreboard-app.jpg" alt=""></td>
      <td><img src="/assets/images/smite-scoreboard-pwa-beta.jpg" alt=""></td>
    </tr>
  </tbody>
</table>

Over the next few evenings I spent some time prompting and tweaking the generated code until I got to a point of feature parity with the existing mobile application. This meant that a user could navigate to the website, configure individual or team players, start the game and record the scores just as they currently do in the mobile app. 

But that's not all - the game data is stored locally on the users device and will persist the game state even after the user closes the browser, navigates away from the website or even restarts the device.

> 'But all websites can do that, they can store data in a browser cookie and read it back when the user returns to the website. Where does the PWA come in?'

Well, first of all cookies can only hold a relatively small amount of data and the game state is quite large - especially when you take player photos into account. PWAs can use the browsers Local Storage or IndexedDB to store much larger amounts of data and I've used Local Storage for the game state. 

Not only that, but what good is a cookie if the corresponding website is inaccessible? Maybe it's offline, maybe the domain wasn't renewed or maybe the user doesn't have a data connection. In these scenarios the game data may be present in a browser but if the user can't access the website to load it, then it pretty useless.

PWAs get around this downloading the required elements of the website and caching them locally on the users device. If a user attempted to navigate to the website and the browser finds that it is inaccessible it will use this cached version instead and load the game state from Local Storage just as the actual website would have done.

Another key advantage of Progressive Web Applications is their ability to be installed on the users device, just like any other app. Opening the installed app will display it without browser element such as the address bar, menu and bookmarks bar. It just looks like a regular app.

Personally I don't see any downsides to moving the Smite Scoreboard app to a PWA - only upsides. No more will I need to bow to the will of Apple and Google for the dubious honour my app being accepted for inclusion in their stores.

So that's it - the start of a new era.