---
layout: post
title:  'Roll my own DDNS? Why Not.!'
date:   2019-08-28 00:00:00
tags:   development web-development
---
>Update: Well, there’s certainly more to Dynamic DNS than meets the eye – who knew.
>
>Investigations led to the decision that I should put my hand in my pocket and spend my time better elsewhere.
>
>Not that I opted for the overpriced offering from Oracle, signing up with <a href='https://www.noip.com/' target='_blank'>NoIp</a> instead.

Like many devs I have been known to host websites and services behind my home broadband router and therefore needed a Dynamic DNS resolver service of some description. But in my recent moves to limit my reliance on third-party services – including those provided by Google – I wanted to see what would be involved in creating my own service.
<!--more-->
### Why would I want to roll by own?

Over the last few years I’ve moved my hosted websites outside of my home network and onto services offered by <a href='https://www.digitalocean.com/' target='_blank'>Digital Ocean</a> so I was only really using my DDNS provider for a single resource – my Synology NAS.

Now, in the past I’ve used <a href='https://dyn.com/' target='_blank'>DynDNS</a> (an Oracle product) and while I’ve had no issues with the service it’s not what you could call cheap – currently starting at $55 a year. When a previous renewal came through, and after reviewing what I was using it for, I decided to let it expire and do without the access to the NAS from outside my network.

Recently though I’ve been using OwnCloud (a Dropbox-like system), hosted on Digital Ocean to replace some of the functions I used to use the Synology for. I don’t really want to use Dropbox or Google Drive or similar offering as I want to keep my data under my control. With the desktop application running I was able to access and edit files from my multiple systems while only actually having a single source of those files, i.e. OwnCloud.

The only downside I’ve encountered was with the Mobile app – which I wanted to use to backup the photos taken on my phone in the same way that the Google Photos app does (because I want to store my own data remember!). Well, the app just refuses to do this without manual intervention (and even then it’s buggy) which is kind of defeating the object.

Then, while listening to the <a href='https://twit.tv/shows/security-now' target='_blank'>Security Now podcast</a> I heard Steve Gibson talking about his quest to find a suitable file syncing setup. He discussed the pros and cons of different systems and finally opted for Dropbox – which I don’t want to use. Then – out of the blue – the podcast host, Leo Laporte, mentioned ‘Synology Drive’ and his initial description seemed to tick all my boxes … plus I already have a Synology NAS.

I’ve had a look at the capabilities of the system and it seems to do what I want it to do but of course I now have the problem of accessing this from outside my network – I need a Dynamic DNS resolver service of some description. Sure, I could just put my hand in my pocket and pay for one but where is the fun in that?

### OK, what’s the plan?

Right, what does a Dynamic DNS resolver do (or what do I think it does anyway)?

Well, in my experience when I was configuring the DNS for my domain I simply pointed the resource, e.g. a website, at the DynDNS service and it would redirect requests to my home broadband IP address. Simple huh?

But how does the DynDNS service know my home IP address and what happens when it changes?

Well, my router has the capability to integrate with these services and notify them when the IP address changes.

So I need to deploy something which will redirect requests for my Synology based services to my home IP address and a mechanism to keep the IP address up to date. How hard can it be?

I plan to create and deploy a simple ASP.NET Core MVC application with a GET and a POST endpoint. The GET will accept incoming requests and perform the redirection while the POST will be used to keep the IP address updated.

### Proof of Concept

So, step one is a proof of concept – a super simple MVC application, deployed to my .NET Core enabled Digital Ocean Droplet, which will perform basic redirection to a hard-coded IP address.

I’m not expecting too many problems with this but the one thing that springs to mind is how will it handle HTTPS requests?

If all goes will with step one, the next step will be to set the IP address and keep it up to date. For this I plan to use the Synology’s ability to run Python scripts on a schedule (say every 30 minutes) which will call the POST endpoint. The plan being for the endpoint to be able to resolve the source IP address from the request, rather than the Synology having to resolve it first.

Clearly this will not be as polished a service as the one offered by Oracle but it will use existing resources, so there is no additional cost to be incurred.

Watch this space 🙂