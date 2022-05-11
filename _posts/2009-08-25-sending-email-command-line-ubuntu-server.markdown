---
layout: post
title:  'Sending EMail from the Command Line with Ubuntu Server'
date:   2009-08-25 00:00:00
tags:   linux ubuntu
---
In [a previous post]({% post_url 2009-06-16-command-line-email-ubuntu-server-failed-tweeting-instead %}) I wrote about the problems I had encountered while trying to configure my Ubuntu Server to send emails from the command line (actually from a script but it amounts to the same thing). I overcame the problem in the short term by using curl to send messages via Twitter but I really wanted to work out how to end emails instead. Well after a bit more research and some testing I have cracked it 🙂
<!--more-->
What I didn’t understand was that I needed two components to be able to send an email in this way, a Mail Transfer Agent (MTA) and an email client. For my solution I have used Nullmailer as my MTA and Mutt as my Client.

<a href="https://untroubled.org/nullmailer" target="_blank">Nullmailer</a> is not a full blown MTA like Postfix but then I didn’t really need something that heavyweight for my purposes. Nullmailer is a ‘minimal mail relay’ – it doesn’t handle local mail delivery or download message from other servers, it just passes email from the local machine to a mail server for delivery.

<a href="http://www.mutt.org" target="_blank">Mutt</a> is a small but powerful, text-based email client which can send email from the command line but also has a GUI (of sorts). I was only interested in the command line interface for this little project.

Both of these packages are available from the standard Ubuntu repositories so installation is just an apt-get away:
```
sudo apt-get install nullmailer mutt
```
During the installation of Nullmailer you will be prompted for a Host Name and a Remote Server.

The host name is just the domain part of your email address ; e.g. **onthefencedevelopment.com**

The remote server configuration is described on screen but consists of three sections (on one line); **address  protocol  option**

The configuration for my server looked like this (should be all on a single line):
```
mail.onthefencedevelopment.com smtp
           --auth-login --user=USERNAME --pass=PASSWORD
```
In contrast Mutt just installed itself without any help from me – which is how I like it.

Ok, so I have my MTA and my Client – how do I send an email.?

Well it’s actually as easy as this (entered on a single line):
```
echo "Hello World, This is a test" | mutt -s "Testing Testing 1 2 3" nobody@home.com
```
This will send an email to nobody@home.com with the subject “Testing Testing 1 2 3” and the message of “Hello World, This is a test”. It doesn’t get much easier than that does it?

So now I can replace my Tweets with EMails – which can (thanks to Mutt) contain more than 140 characters and file attachments, thus making it useful for sending logs and detailed diagnostic information.

>STOP THE PRESS…!!
>Well it looks like I’m not quite done here as looking at my OpenDNS logs I see tens of thousands of requests to my mail server – what is all that about, i only have a couple of emails from my server!
>Looks like something else is creating and queuing messages in addition to my call to Mutt./
>**[Update] Well it looks like it was either my twitter script or the call to logger that was causing this problem. Not needing the Twitter anymore and deciding that I didn’t need to log everything I pulled these lines out and the spurious emails were a thing of the past.**
