---
layout: post
title:  "gnash not Flash enough"
date:   2009-01-18 00:00:00
tags:   linux ubuntu
---
I’m a comparative newbie to Ubuntu (and Linux in general) but one of the plus points is that it’s Free. You can install Ubuntu on an old PC without putting your hand in your pocket and you get not only a fully functional operating system but all the tools that most users require, i.e. an Office Suite, Web Browser and Email/Calendar client.
I recently found that I could not view some pages properly, e.g. Google Analytics, and traced the problem to the playback of Flash components. I had installed gnash as my Flash plugin for Firefox and frankly it just doesn’t cut it. The only option was to remove gnash and install Flash itself. But how? As it turns out is is pretty simple, with just two commands in the Terminal I had Google Analytics as a number of other Flash enabled sites running perfectly.
<!--more-->
First you will need to remove gnash so open a Terminal window and type:

`sudo apt-get remove purge gnash gnash-common mozilla-plugin-gnash libgnash0`

Now you can install Flash by entering:

`sudo apt-get install flashplugin-nonfree`

Don’t worry about the nonfree suffix here, Adobe are not going to come knocking on your door for payment. Basically it means that the package is not provided under GPL so while you can use it freely you can’t modify it. As one of the guys on the #ubuntu IRC channel described it ‘Free as in Speech not as in Beer’.

Close and reopen any browser windows you may have open and you should now be able to view Flash enabled site without any problems.
