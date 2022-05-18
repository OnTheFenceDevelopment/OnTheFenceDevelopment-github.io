---
layout: post
title:  'Moving from Shared Hosting to a Virtual Private Server'
date:   2011-06-07 00:00:00
tags:   hosting vps
---
Until recently I have been hosting this blog, and a few other sites and proof of concepts, using a reseller account provided by 5quidhosting costing, well £5. Now before I continue I should say that I have been very happy with the service they have provided me over the past two years or so and have no hesitation in recommending them for standard hosting services. The server performance was good and on the few times I needed to contact support their response was prompt and efficient. So, why have I moved this blog? Well, it’s all about access, or more accurately the lack of it.

I am of course talking about SSH access which was not provided on the <a href='
http://www.5quidhost.co.uk/' target='_blank'>5quidhosting</a> servers due to previous hack attempts. This is fair enough, most users will have no need for this level of access – indeed neither did I for two years.
<!--more--> 
In many of my previous blogs posts I have been using Ubuntu server to host my own source control server (Subversion), numerous Drupal test sites and a series of scripts monitoring the stability of my broadband connection to what time my girlfriends son turned his computer off on a school night. All this was done using an old grey tower PC in the garage – which I of course accessed via SSH. Now this has been a good workhorse but it’s an old PC and sooner or later it’s going to fail on me on the recommendation of a colleague at work I provisioned a virtual private server from <a href='http://www.bhost.net/' target='_blank'>BHost</a>.
 
Despite the rather uninspiring website – BHost provide a very good service at a very affordable price. I opted for the Bronze configuration (**20GB HDD and 1TB bandwidth**) for less than £5. The control panel is really easy to use and I was able to reinstall the server with Ubuntu 10.04 64-bit (replacing centOS) in just a few minutes.
 
I was also going to have to source an alternative email provider – 5quidhosting was providing that for me but BHost did not. Although I could have used the VPS as an email server (my work colleague has done so – but he’s an infrastructure guru so that’s only to be expected!) I decided to go down the Google Apps road. This was pretty simple to do and once I’d set up my MX records I was in business – more on this in a future post.
 
So now I had my VPS, what was I going to do with it?
 
Well, I made a list:

1. Relocate this Blog
    - The very fact you are reading this means I succeeded here but the above three words grew arms, legs and teeth (by which I mean ‘not as easy as I’d though/hoped’)
2. Relocate my proof of concept Drupal sites
3. Relocate my SVN server from the garage and implement SSL access
    - I want to be able to access my code securely from home or from customer sites without any bandwidth issues or failed access due to someone unplugging the server to plug the pressure washer in..!!
4. Install and configure CruiseControl
    - This is mainly for my Android development – I want to be able to perform continuous integration builds as well as publishing to the Android Market with minimum effort (or risk of forgetting one of the many steps along the way).
5. Configure Dropbox daemon and configure for backups for all the above
    - Using plugins etc that use the Dropbox API are ok but I’m getting a lot of failures at the moment, apparently due to the Web API

As ever, so that I don’t forget anything, I’ll be blogging my progress so if you are interested in any of the above (or have some advise or suggestions) then please leave a comment.
