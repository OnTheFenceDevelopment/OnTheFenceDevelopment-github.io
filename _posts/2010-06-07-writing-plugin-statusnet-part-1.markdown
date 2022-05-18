---
layout: post
title:  'Writing a plugin for Statusnet : Part 1'
date:   2010-06-07 00:00:00
tags:   statusnet microblogging
---
>While migrating this blog to a statically generated site I found that many of the links in this post were broken or the domains have been resold. I decided to leave the content as is though.

My work is getting into microblogging – both internally and to the outside world. We had previously considered using Twitter and even tried using Yammer for purely internal posting but there were concerns about privacy – the data is stored ‘out there’ on somebody else’s server and we were at the mercy of any future changes in service terms and conditions.
In the end we opted for the <a href='http://status.net' target='_blank'>StatusNet</a> engine which also powers the <a href='http://www.indenti.ca' target='_blank'>Identi.ca microblogging service</a>. Its Open Source, can be installed locally and has a Twitter-like API which meant that we could integrate it with our internal systems like our CruiseControl.NET build server.
 <!--more-->
But that’s not the end of it – StatusNet is extendible as well. With a little knowledge of PHP and knowing which ‘hooks’ to use (or how to find them) it is possible to intercept most (if not all) of the important events in the world of statusnet, like posting a notice, and injecting your own logic.
 
Well it has come to pass that the company decided not only to implement an internal microblogging platform but to create a presence ‘out there’ as well. But the question is “how to do it in the most effective way?”, I mean there are loads of social networks out there and we don’t want to have to repost manually on multiple sites. Well the good thing is we don’t need to!
 
Using a service called <a href='https://www.ping.fm/' target='_blank'>PingFm</a> it is possible to post to a vast number of services including microbloggers like <a href='https://www.twitter.com' target='_blank'>Twitter</a> and Identica as well as <a href='https://www.linkedin.com/' target='_blank'>LinkedIn</a> and even blogs like <a href='https://www.wordpress.com' target='_blank'>Wordpress</a>, all from a single application.
 
Now the crunch, getting users to post when they are up to is one thing, asking them to do it through two services (StatusNet and PingFm) is another thing altogether. But hope is at hand, StatusNet has a plugin architecture which allows new functionality to be added quite easily.
 
The specifications for the plugin were pretty straightforward:

- Only certain users will have PingFM accounts and therefore they should be the only ones posting to the service
- Only posts with a specific group tag, e.g. !pingfm, should be forwarded to PingFM
- As much configuration as possible should be held in config files to allow it to be updated by users with no PHP knowledge
- The core StatusNet files should not be modified in any way, shape or form.

StatusNet uses an Inversion of Control architecture which is a bit different from the normal Event Driven Model I’m used to. Basically when an event is triggered the system will ‘say’: “Ok, this ‘hook’ has triggered – do any of you [modules/plugins] want to do anything while I’m at it?”. So that first thing to find out is “is there a suitable hook for what I’m trying to do, i.e. respond to the new post being added?”.
 
Now I had a bit of a problem finding the list of hooks because I was looking under the API documentation which is something else altogether! As soon as I looked at ‘Plugin Development’ I found <a href='https://status.net/wiki/Plugin_development' target='_blank'>this page on the StatusNet site</a>. From there I went to the Hooks Reference page and quickly found the <a href='https://status.net/wiki/Plugin_hooks_reference#EndNoticeSave' target='_blank'>EndNoticeSave</a> hook details. Excellent, not what?
 
What I really wanted was a sample plugin that I could use as a starting point, you know, something with all the correct signatures and basic metadata. Well there is a link from the Plugin Development page on the StatusNet site that takes you to details of just that, a <a href='https://blog.kylehasegawa.com/statusnet-plugin-developer-helper-plugin-pdhelper' target='_blank'>Helper Plugin</a> that I used as the basis for my own.
 
So next I really need to configure the system so that it sees my plugin. This is a simple matter of saving the file into a specific location,the local folder under the StatusNet installation, with a filename in a standard format, basically suffixed with the word Plugin. A single line in the config.php file will alert the system to your plugins presence and away you go.
 
In my case I called the file PingFMPlugin.php and saved it into the appropriate folder. The following line was added to config.php and I was ready to go:
```
addPlugin('PingFm');
```
(note that this is the name of the file without the Plugin suffix (I ran into problems because I thought it was from the definition of the plugin with the file itself!).
 
By adding a simple bit of test code into the EndNoticeSave hook which saved the text into a file in my /tmp folder I was able to verify that my plugin was indeed running when a new post was added.
 
So there we are, I now have a development environment configured and I can start work on the plugin itself – which will be in Part 2 of this post which I’ll post in a couple of weeks or so.