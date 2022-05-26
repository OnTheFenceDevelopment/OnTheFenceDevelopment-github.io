---
layout: post
title:  'Online Tools of the Month – ASafaWeb.com & SecurityHeaders.io'
date:   2017-10-01 00:00:00
tags:   online-tool-of-the-month
---
>**It has come to my attention that ‘ASafaWeb’ has now reached ‘End of Life’ and is no longer accessible. The site developer, Troy Hunt, <a href='https://www.troyhunt.com/its-end-of-life-for-asafaweb/' target='_blank'>has posted on his blog</a> the reasoning behind his decision.**

We all know that we should be developing with security in mind right from the point of File > New, ensuring that our ASP.NET web applications are configured correctly. The problem is that there are so many configuration settings that can be tweaked and this can become overwhelming.

I heard <a href='https://www.troyhunt.com/' target='_blank'>Troy Hunt</a> speaking on a podcast a while ago talking about a site he had created which would probe a target URL and report back with anything it found, i.e. information that a hacker could potentially use to hack your site. The site is called, <a href='https://asafaweb.com/' target='_blank'>ASafaWeb</a> (it makes sense if you read it out loud) and is essentially a service which can determine ‘remotely detectable’ configuration issues with your website, i.e. what it maybe leaking to the world.
<!--more-->
By it’s very nature the service requires that the target site is remotely accessible, i.e. you cannot scan your development environment running on `http://localhost` but there are a number of way around this. Personally I push my web applications to Azure and then target the `https://project-name.azurewebsites.net` url.

Entering the target email and clicking ‘Scan’ will result in a comprehensive report being generated which covers, (among other things), Custom Errors, Elmah, Clickjacking and Secure Cookies. For each test there is a status indicating whether it Passed, Failed or (for whatever reason) Not Tested along with details of what was tested, why it is important, possible solutions and links to additional resources.

The screenshots show the results for Troys <a href='https://hackyourselffirst.troyhunt.com/' target='_blank'>‘Hack Yourself First‘</a> website which is uses as a test case for his <a href='https://app.pluralsight.com/library/courses/hack-yourself-first/table-of-contents' target='_blank'>Pluralsight course of the same name</a> – an excellent watch by the way!

![a safer web website](/assets/images/asafaweb-1.png)

As good as ASafaWeb is there are still potential issues that it doesn’t test for – a line has to be drawn somewhere.

This is where <a href='https://securityheaders.io/' target='_blank'>securityheaders.io</a> comes in. Many of us give little thought to the request headers that our browsers send out or the response headers it receives back – but to a potential hacker they can reveal a lot about the inner workings of your site.

![security.io site](/assets/images/securityheaders-io.png)

Again, the service just requires a target URL to scan and returns details about the headers it received, missing headers (and why they are important) and an overall site rating (from A+ to F).

While there is no guarantee that your site won’t get hacked, these services will help you identify a number of key attack vectors and help minimise your risk – hopefully the hackers will move along to someone less well protected.