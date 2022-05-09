---
layout: post
title:  'Tweeting my External IP Address from Ubuntu Server'
date:   2009-06-17 00:00:00
tags:   linux ubuntu
---
In [my previous post]({% post_url 2009-06-16-command-line-email-ubuntu-server-failed-tweeting-instead %}) I described the problems I encountered while trying to configure my Ubuntu Server to be able to send emails via the command line (in my case it was actually via a script). The reason I wanted to do this was so that I could run the script on a scheduled basis to check my external IP address and notify me when it changed.

Why? Well my ISP has provided me with a dynamic IP address which changes on a periodic basis – not that I normally notice. Well if I want to be able to administrate my Ubuntu Server from outside my local network, i.e. over the Internet via SSH, then I need to know the outward facing IP address of my router.

I had already found a script to do this and tweaked it a little to run under a non-admin user but while it could detect the change I needed some mechanism for it to tell me. After a fruitless evening trying to set up email I gave up and decided to use the Twitter API instead.
<!--more-->
Now there are a few downsides to using Twitter:

- The data is on someone elses server – i.e. Twitters. This is not a major problem but what if Twitter decided that they were now going to charge for thier service, or if they were (for some reason) forced to take it down altogether (unlikely I know)
- Username/Passwords are sent over the wire in plain text (at least in my implementation they are
- I may not want to stick around on Twitter forever (the SPAM is driving me nuts and although I have protected my updates it does defeat the point a little bit IMHO)

Having said that – it is so damn simple it makes no sense not to have a go 🙂

The logic of the script is this:

1. Store the current IP Address in file
2. Resolve External IP Address using whatismyip.com
3. Compare value with that stored in IP address file
4. If the IP Addresses are different, send a Tweet

Simple eh?

Well first of all I had to get my Twitter script sorted. [My previous post]({% post_url 2009-06-16-command-line-email-ubuntu-server-failed-tweeting-instead %}) links to the site where I found this script but I’ll post it here for reference:
```
curl --basic -- user "username:password" --data-ascii 
      "status=`echo $@|tr ' ' '+'`" 
          "http://twitter.com/statuses/update.json" -o /dev/null
```
Note: This is all on one line and that you will obviously need to specify your own Twitter username/password. 

With that in place (saved as /usr/bin/twitter) I just needed my IP Checking script and here is the script I used:
```
#!/bin/bash
IPFILE=/home/dilbert/ipaddress
CURRENT_IP=$(wget -q -O - http://www.whatismyip.com/automation/n09230945.asp)
if [ -f $IPFILE ]; then
        KNOWN_IP=$(cat $IPFILE)
else
        KNOWN_IP=
fi

if [ "$CURRENT_IP" != "$KNOWN_IP" ]; then
        echo $CURRENT_IP &gt; $IPFILE
        twitter "External IP Address has changed to $CURRENT_IP"
fi
```
Running the following command will make the script (called checkipaddress) executable:
```
sudo chmod +x checkipaddress
```
I decided to create a new Twitter account for my Ubuntu Server and to protect it’s updates – no offence but I didn’t think that my External IP address was a good thing to be broadcasting to the world. As my updates are also protected (I was just getting too much annoying SPAM) I’m happy that my IP Address is as secure as it needs to be.

Running the checkipaddress script does what it says on the tin, it checks the IP address and Tweets me if it is different from the last time it checked, so I can now SSH intp my Ubuntu Server when I like. Simple!

>Now I didn’t come up with the checkipaddress script myself – although it’s not difficult – but I cannot remember where I copied it from. If I remember then I’ll post the link, if you know then post a comment and I’ll update the post
