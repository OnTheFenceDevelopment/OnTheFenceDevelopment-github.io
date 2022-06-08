---
layout: post
title:  'FillLPG for Android is dead .. long live FillLPG for Android'
date:   2018-12-21 00:00:00
tags:   fill-lpg
---
>Please note that I have now removed FillLPG for Android from the Google Play Store. You can read more about this here.
> -- August 2020

>TLDR; The FillLPG for Android app has reached end of life and no further development or maintenance will be undertaken. It will remain in the Play Store for as long as the third-party FillLPG website remains online but I have no control over that.

The FillLPG for Android app was initially developed to scratch an itch – I had an LPG powered vehicle (I don’t anymore) and had stumbled on to the FillLPG website. I responded to a request from the website owner for someone to write a mobile and thought it would be a good little project to get started in this arena.

It has proved itself to be just that, initially written in Java and then migrated to C# using Xamarin this little app has helped me keep my skill levels up – or at least it did.
<!--more-->
## Background

First, a little background on how the app actually works (don’t panic, nothing too technical).

One thing to bear in mind here is that the **FillLPG website is nothing to do with me or my company, On The Fence Development**. I have **no access to the source code, database or server** it is running on. I only have access to a specified data feed from the site.

The Android app contacts the FillLPG website for all its data and also sends updates back to the main website. The website database is what we call ‘the single source of truth’ and does not, in any way belong to me or On The Fence Development Ltd.

The app **cannot** display data that may exist on the website but which the website does not expose via the data feed, e.g. opening hours. This feature has been requested many, many times and I have passed these requests to the FillLPG website developer but the data has never been included in the payload sent to the app. If it’s not in the payload, the app can’t display it – simple as that.

So, basically the app is just a portal into selected data from the main website – that’s it. It fetches data from it and posts data back to it.

Now, the FillLPG website also has an <a href='https://filllpg.ideascale.com' target='_blank'>‘Ideas’ board</a> where users can send feature requests etc and this was quite active with some useful ideas coming in, including the ability to indicate stations that were Disabled Friendly or had ‘Safefill’ facilities. Great ideas but unfortunately they were never implemented by the website so the app cannot display this information.

## Previously Planned Development

In a previous post I mentioned [starting development a new version of the app]({% post_url 2017-11-01-starting-development-of-filllpg-v3-x %}) and even an iOS version being in the pipeline. Well I’m sorry to say that the investigations into this have partly led me to the decision to cease development altogether.

The problem is that I do not control the data or the service that provides it. On top of that there have been numerous unsuccessful attempts to contact the FillLPG website developer over the past year or two. How can I commit time to the development of apps which is heavily reliant on a system I have no control over and could shut down at any time?

I was considering the creation of an ‘intermediate’ webservice that would pull data from the FillLPG website in the same way that the app currently does. This would be stored in a new database under my control. I could then add new data fields for the features requested on the Ideas board. The app would then connect to this new webservice for it’s data.

The problem here is that this is not my data to do as I please with – that’s not the agreement I have with the developer of the FillLPG website. I also would not have user data so if the FillLPG website went away then I’d still have problems.

## The straw the broke the camels back

My decision to cease any further development and maintenance was reinforced last night when I received an email from a disgruntled user:

>Hi, now 6 weeks or so since I last contacted you regarding FillLpg app, and nothing seems to have changed, still “unable to connect to FillLpg Web Servers” whenever you try to update. Seems that the app is getting useless as it now quite out-of-date given the number of lpg stations closing down, shame really, it WAS pretty good and useful.

>Update [22/12/2018]: I think it is only fair to point out that this user subsequently contacted me to let me know that he had located the problem and that it was nothing to do with the app. It turns out it was <a href='https://adguard.com/en/welcome.html' target='_blank'>AdGuard</a> which was blocking the apps access to the internet. A quick configuration update and he was back up and running.

This is typical of the emails I receive regarding the app and reviews submitted to the Play Store – although some of the 8500+ active users do take the time to leave a positive review (but not many).

Receiving 1 star reviews for problems that I have no control over is very frustrating but then I suppose the app is out there and the Play Store has a mechanism for review/feedback so it takes the hit, not the website that is feeding it or the FillLPG community that is maintaining the data.

## Going forward

Consider what would happen if the FillLPG site was taken offline – permanently or temporarily. The app would have no access to the database to fetch or update station details.

As it stands the domain registration only runs until mid-June next year so if the current owner doesn’t renew it then the site will essentially fall off the internet. If that comes to pass then I will pull the app from the store as there would clearly be no point in its existence.

For now there are over 1700 stations reaching from the UK into Europe and beyond and over 500 prices have been updated in the last 30 days. People are clearly finding the app useful. So the app will remain in the Play Store and any future reviews will just get a link to this post. Whether they read it or not is down to them.