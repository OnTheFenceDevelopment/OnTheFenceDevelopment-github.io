---
layout: post
title:  'Online Tool: UnminifyCode'
date:   2020-04-30 00:00:00
tags:   online-tool web-development
---
![unminify site logo](/assets/images/unminify-logo.png){:style="float:left; margin-right: 10px;"}
If you’re a web developer, regardless of what programming language you are using, you’ll be familiar with minified CSS, Javascript and HTML files. For the uninitiated these are files which have had unnecessary whitespace, line breaks and formatting removed with variable/function names shortened where applicable.

While this results in files that are difficult for humans to read, browsers are still able to load and parse the data (unless the minification process has been a bit heavy-handed).

These files are normally used in preference over the unminified versions because of the reduced file size – making for quicker page load times.

That’s all well and good, but what happens when all you have is a minified file, from say a third party library, and you want to edit or, in the case of Javascript, add breakpoints to debug one of these files?
<!--more-->
Now, I’ve already reviewed an online [‘Unminifier’]({% post_url 2018-10-26-online-tool-of-the-month-unminify-com %}) but that doesn’t mean it’s your only choice – as we know, the Internet is full of choices.

Enter <a href='https://unminifycode.com/' target='_blank'>unminifycode.com</a> – a simple website which will take your minified file contents and present it in a more readable format, adding the whitespace and formatting back in. It obviously won’t try to rename any variables or functions that were shortened during the minification process.

Simply copy the file contents and paste it into the large text box and click ‘Unminify’ – I’ve used moment.min.js here for demo purposes (I know that the unminified version is easily downloaded)

![unminify code with minified moment.js code loaded](/assets/images/unminify-minified.png)

Here I've loaded the minified moment.min.js (yes, i know you can get the unminified file – this is just a demo)

After a short delay the nicely formatted code will be presented and you can just copy it and paste it as you see fit.

![unminified code](/assets/images/unminify-unminified.png)

Comparing the output of each tool the only differences appears to be a bit of whitespace – nothing that would affect the validity of the content itself.

So there you have it, you wait for an unminification tool and then two come along 😉 