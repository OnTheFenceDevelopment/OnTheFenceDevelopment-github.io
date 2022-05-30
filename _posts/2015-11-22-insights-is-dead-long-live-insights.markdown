---
layout: post
title:  'Insights is dead, long live Insights'
date:   2015-11-22 00:00:00
tags:   xamarin analytics
---
In my [previous post]({% post_url 2015-09-30-xamarin-insights-to-the-rescue %}) I sang the praises of <a href='https://xamarin.com/insights' target='_blank'>Xamarin Insights</a> and explained how it enabled me to locate a bug with the FillLPG for Android application.

At that time Insights as in Preview Release and all Xamarin subscribers has free access to the service, many like myself building it into production applications. We all knew that the time would come when Xamarin would decide that the product was mature enough and take it out of preview and start charging for it. At the recent Evolve conference (which I was not fortunate enough to attend) it was confirmed that existing users would still have access to the service but that plans were still being worked out.
<!--more-->
Well, the plans have been worked out and the pricing released – and the news is not great for users like myself. It was hoped that existing users would retain free access, albeit limited, to all aspects of the service – but this is not the case.

The free tier is ‘limited’ to the real-time issue/crash reporting area (as used in my previous post) with all other areas, what I will refer to as Analytics, only available to paid subscribers.

Now, here’s the crux of the issue – the entry level subscription is $199/month. When I received the email I actually had to read it a few times to make sure I was not mistaken – surely they meant $199/year didn’t they?

Well, no – they didn’t. Xamarin have put a price tag on this service is just shy of $2400/year. Now I, and others, see that as a bit of a slap in the face from Xamarin – after all, my usage during the Preview phase has surely been helping with their development of the service. That said, I do still have access to the Issue/Crash reporting part of the service and while there are some limitations being placed on that (log retention etc) this is the area I was making the most use of anyway – so frankly I’ve not really lost much, especially seeing as the Analytics have been offline for sometime now.

Now, FillLPG for Android was using some of the Analytics aspects of the service – I was able to tell how many users had actually logged in and how many had used certain functions such as updating or confirming a station price. That was interesting and has now been lost – in Insights anyway.

In the midst of this maelstrom a number of fellow Xamarin developers have mentioned the Mobile Analytics offerings from Google and Amazon and how they can be incorporated into Xamarin applications. These services are essentially free so I will be investigating them both shortly and intend to post the results in the coming weeks.