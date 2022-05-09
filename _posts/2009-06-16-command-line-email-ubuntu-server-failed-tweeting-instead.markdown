---
layout: post
title:  'Command Line EMail on Ubuntu Server Failed – Tweeting Instead'
date:   2009-06-10 00:00:00
tags:   linux ubuntu
---
Now that my Ubuntu Server is up and running and configured for the network I want to be able to remotely access it via SSH. Now that’s easy, even for me. I have OpenSSH installed and my router configured and it works like a charm. The problem is that I don’t have a static IP address from my ISP so periodically I will be assigned with a new one – so how do i know what it is at any point in time? Answer, I don’t. So after browsing around I found a script that would resolve my external IP address and email it to me. Brilliant! Everything was working up to the point where it needed to send the email.
Well I didn’t think it would be that difficult – I just wanted to be able to configure the system so that it could send me an email via the script. I found a few tutorials on the web and decided to follow one which boasted to be able to complete the setup in just 5 steps. There was even a comment from someone saying ‘Thanks, it worked where others didn’t’ – well it didn’t for me. Why is it so difficult?
 <!--more-->
Once I had tweaked the script to include details for the appropriate SMTP server etc I could not get past an annoying '**Invalid HELO message**' error. Using the same settings in my email client proved that they were valid.
 
At one point I thought I had it working, i.e. the command didn’t result in a nasty error and an email duly appeared in my Inbox – success? Not quite, it appeared to come from ‘Unknown Sender’ even though I had configured a From address. I tweaked the script and was promptly returned to the '**Invalid HELO message**' error that had been greeting me for the previous couple of hours.
 
I trawled the Web for answers but the results were far to cryptic for my frame of mind and in the end I decided that it was too close to midnight to be banging my head on the wall and called it a night.
 
This morning on the way into work I was thinking about alternative approaches, knowing that I would have to revisit the whole email server setup process in the future, but for now I just wanted a working solution. Then it hit me – Twitter!
 
I know that Twitter has a RESTful API and with that in mind I knew it could not be that difficult – at least compared to my efforts last night with mailx. As it turns out typing “command line twitter ubuntu” into Google gave me the answer – use Curl!
```
curl --basic --user "USERNAME:PASSWORD" --data-ascii
      "status=`echo $@|tr ' ' '+'`"
           "http://twitter.com/statuses/update.json" -o /dev/null
```
This should all be on one line and insert your Twitter username and password – I’ve split it to prevent it scrolling off the page.
 
Now I just have to create an account for my Ubuntu Server (protecting the updates of course), install curl, create the script and I’m away. Once this is sorted I’ll be able to update the script to resolve the External IP address and configure it as an hourly cron job.
 

>I know I will have to revisit the configuration of the email system – afterall it’s not as if it’s a totally new technology. I knew that this process would not be straightforward and that I would hit obstacles like this along the way so I’m not that surprised, although I am still frustrated.

>If anyone has any input, help or advise then please leave a comment.

>Update: I’ve resolved this issue now – see next post.
