---
layout: post
title:  'Getting Started with Xamarin – a Pet Project'
date:   2014-02-24 00:00:00
tags:   mobile-development xamarin android ios tutorial
---
In previous posts I have mentioned that 2014 will be my [‘Year of the Mobile‘]({% post_url 2014-01-02-2014-the-year-of-the-mobile %}) and that <a href='http://www.xamarin.com/' target='_blank'>Xamarin</a> (which will allow me to develop for Android, iOS and Windows Phone using C#) will be my weapon of choice.

As with all undertakings such as this I needed a few pet projects to work on, something that more closely resembles a real world application than some contrived examples that you find in some books and web tutorials (that’s not to say that all book and web tutorials are created equally).
<!--more-->
I already have my <a href='https://play.google.com/store/apps/details?id=com.onthefencedevelopment.fill_lpg' target='_blank'>FillLPG application</a>, written in Java, which I am moving to C# via Xamarin but I wanted something that integrated with the standard phone functionality, e.g. phone calls, SMS. I also wanted it to be something that I could make use of myself – scratching my own itch if you will.

I’ve had a number of ideas but you need to walk before you can run so I’ve opted for an SMS Scheduler app. Yes, I know that this has already been done both as an integrated feature in full blown messaging applications and standalone utility apps (which is what mine will be) but that’s no reason not to use it as an learning exercise. The requirements are such that it will provide a number of opportunities for investigation into operations such as:

- Contact Selection (taking into account some contacts may have multiple phone numbers)
- Date/Time Pickers
- Data storage (probably file based – SQLite is a bit heavy weight for this in my opinion)
- Scheduling of the SMS ‘jobs’
- Sending of the SMS itself
- Logging and Notifications

<br>
As with previous ‘tutorials’ I’ll provide full source code at each step and the final project will also be on <a href='https://github.com/OnTheFenceDevelopement/SMSScheduler' target='_blank'>GitHub</a>.

As I am predominantly an Android user I will be developing for that platform first but with a mind to sharing as much code as is practical.