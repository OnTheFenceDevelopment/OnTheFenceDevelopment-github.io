---
layout: post
title:  'Getting to grips with OzCode'
date:   2019-03-06 00:00:00
tags:   visual-studio development
---
When I was at NDC London in January I watched a demonstration of the <a href='https://www.oz-code.com/' target='_blank'>OzCode</a> extension for Visual Studio. Not only was it well presented but it highlighted some of the pinch points we all have to tolerate while debugging.

In return for a scan of my conference pass, i.e. my contact details, I received a whopping 35% discount off a licence and without completing the 30 day trial I was so impressed that I pulled out my wallet (actually the company wallet!).
<!--more-->
While I don’t use all of the features every day there are a few that I use all the time – the first one is called <a href='https://www.youtube.com/watch?v=7epjXcgBKmw' target='_blank'>Reveal</a>.

Consider the following situation:

![debug breakpoint dialog showing list of items](/assets/images/ozcode-1.png)

But I already knew this was a list of view models!

At this breakpoint I’m looking at collection of View Models – but I knew that already what value am I getting from this window? There are over 600 records here – do I have to expand each one to find what I’m looking for? What if one has a null value that is causing my problem – how will I find it?

Well, I could obviously write a new line after the breakpoint which will give me all of the items with a null value for say the name property. But to do that I need to stop the debugging session, write the new line, restart the application and perform whatever steps I need to perform to get back to the above scenario.

Ok, that’s not going to kill me but it’s wasted time and I have to remember to remove the debugging line once I’m done with it.

Using the OzCode Reveal feature I can specify which properties I was to be displayed instead of the actual, fully qualified, class name.

By expanding any of the records to view the actual property data it is possible to select which ones I want to see – which are important to me at this time – by clicking the star.

![selecting interested properties](/assets/images/ozcode-2.png)

Now when I expand the list I see this instead:

![breakpoint dialog with same list of items but with ozcode displaying the selected properties](/assets/images/ozcode-3.png)

Much more useful

These selections are persisted across sessions and can be changed whenever – maybe I want the email addresses, cities or countries next time – not a problem.

But what about nested properties? Well, that’s not a problem either – just drill in an star the properties you want to see and they will be displayed at the appropriate level in the tree as below:

![debug dialog with ozcode working on nested properties](/assets/images/ozcode-4.png)

Here the users first and last names are selected as well as the start date of their subscription

There’s a lot more to OzCode than this and as it becomes more embedded in the way I work I’ll post more about how it has helped me.