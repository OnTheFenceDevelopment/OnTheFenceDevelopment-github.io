---
layout: post
title:  'Online Tool of the Month – unixtimestamp.com'
date:   2018-02-25 00:00:00
tags:   online-tool-of-the-month utilities
---
As developers we know that one of the biggest problems when working with data is handling dates. It’s such a simple thing surely yet many of us fall foul of formatting issues and time zone offsets – and that’s when the date is actually human readable!

I remember when I first encountered a Unix Timestamp in the ‘LastUpdated’ column of a database table and thinking, ‘what the hell is that?!’.

Bear in mind that this was back in the days before the internet and before I had any real experience with Unix/Linux systems – every Windows application I had seen prior to this had it’s dates stored in the `DD/MM/YYYY hh:mm:ss` format.

Being faced with something like `1519571567` was a bit confusing to say the least – unless you know that this represents ‘*the number of seconds since midnight (UTC) 1st January 1970*‘ where would you even start to know what this meant?
<!--more-->
Even now that I now what this is, it is always a bit of a pain point to me when I’m developing or debugging something with a date in this format;

* What time does the timestamp in that database field represent?
* What time is it now expressed as a unix timestamp?
* etc

Over the years I’ve come to fall back on <a href='https://www.unixtimestamp.com/' target='_blank'>Dan’s Tools Epoch Unix Time Stamp Converter</a>.

The fairly simple interface is great as it doesn’t get in you way and lets you don what you came to do.

To the left of the screen is the current timestamp (or at least the timestamp from when the page was loaded) and how this would be displayed if translated to a number of other standards.

To the right is where you can either enter a date (using clearly marked fields to prevent ambiguity) or a unit timestamp.

Entering the timestamp from a few lines above and clicking ‘Convert’ generated the following:

![timestamp](/assets/images/unixtimestamp.png)

While entering the date I’m currently writing this blog post returns the following:

![current timestamp](/assets/images/unixtimestamp2.png)

This is essentially a copy of the output of the left hand panel but displaying the output for the entered value. The value is also converted into a number of different formats, e.g. ISO 8601 & RFC2822.

I’ve found this to be a helpful little tool when working with Unix Timestamps and be sure to checkout the other date related utilities in the top menu bar, e.g. Timezone Converter and Week of the Year.