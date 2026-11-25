---
layout: post
title:  'End of the Road for Mobile Apps'
date:   2026-11-25 00:00:00
tags:   mobile-development progressive-web-application smite-scoreboard-app motorhome-stopover
---
![Illustration of a blocked road to a mobile phone and a sunlit path towards the web](/assets/images/end-of-the-road-for-mobile-apps.svg){:width="350px" style="float:left; margin-right: 10px;"}
As I mentioned in a [previous post]({% post_url 2026-09-09-stepping-away-from-mobile-development %}), I've been thinking about stepping away from mobile development for a while now. Well, I've decided it's time to call it a day on the two mobile applications I maintain: **Motorhome Stopover** and **Smite Scoreboard** (see links at the top of the page).

It's not that I don't enjoy developing software anymore - far from it. But keeping apps in the Google Play Store seems to involve jumping through an ever-increasing number of hoops, and I'm spending more time dealing with requirements than adding things users might actually notice.
<!--more-->

There's the [trader status declaration](https://support.google.com/googleplay/android-developer/answer/17594752?hl=en){:target='_blank' rel='noopener noreferrer'}, with details that may be displayed publicly, and the separate [identity verification](https://support.google.com/googleplay/android-developer/answer/10841920?hl=en){:target='_blank' rel='noopener noreferrer'} requirements. Then there's [Android developer verification](https://developer.android.com/developer-verification){:target='_blank' rel='noopener noreferrer'}, which is being rolled out beyond the Play Store too. Sideloading isn't going away, but even distributing an app outside the store is becoming more complicated.

And now Google has announced [new app quality requirements](https://developer.android.com/blog/posts/elevating-app-quality-reducing-memory-usage-and-improving-device-migration){:target='_blank' rel='noopener noreferrer'}, including limits around memory usage and, for apps with sign-in, a smoother sign-in experience when moving to a new device. These changes are due in 2027, not all in force today, but they'll mean yet more work to keep up.

I understand the intention: safer apps that work better for users. But for a couple of free apps maintained in my spare time, the balance has tipped. I don't want to spend that time continually satisfying store requirements instead of building useful features.

So I'm ending development of the mobile apps and focusing my efforts elsewhere, particularly on the web-based alternatives I mentioned in my [PWA update]({% post_url 2026-10-09-moving-from-maui-to-pwa-with-a-little-help %}). It's been a good journey, but it's time to move on.