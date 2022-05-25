---
layout: post
title:  'Moving to new Virtual (really) Private Server provider'
date:   2015-08-26 00:00:00
tags:   linux hosting rant privacy
---
![big brother is watching](/assets/images/internet-spy.png)

With all the post-Snowden privacy concerns I recently started to consider how much of my data was being stored on US servers, and hence fell under US legislation. It didn’t really surprise me that the answer was ‘quite a lot’, when you consider GMail, Drive, Dropbox, GitHub, Squarespace etc, but what was the alternative?
<!--more-->
I’ve hosted my own systems, such as Joomla, Drupal, Subversion and Redmine, on Virtual Private Servers (VPS) running Linux for years but some time ago I scaled this back in favour of the above services. This was not a cost issue, the two servers I had cost less than £10 a month, but I’m not really an Infrastructure guy and configuring/patching servers and applications is not really what I do. But with all this mass snooping going on I thought that maybe I should at least take a look at moving my data back under my control.

I’d previously watched a <a href='https://www/pluralsight.com' target='_blank'>Pluralsight</a>Pluralsight course called <a href='http://www.pluralsight.com/courses/master-domain' target='_blank'>Mastering Your Own Domain</a> which presented a couple of interesting applications:

- <a href='https://owncloud.org/' target='_blank'>OwnCloud</a> – a Dropbox alternative
- <a href='https://about.gitlab.com/features/' target='_blank'>GitLab</a> – as the name suggests, a self-hosted source control system similar to Github

There were a number of other very interesting points made during the course so if you have access to Pluralsight then I highly recommend watching it.

Having all but stopped using the two VPS that I had it was quite simple for me to re-image one of them and have a play with the above applications – and I must say I was very impressed (still am). But then came the bombshell – my VPS provider emailed out of the blue to say that they were merging with a US company with immediate effect (immediate meaning just that!). Now, the servers were still hosted in the UK but did they come under US legislation? If the NSA requested all of my data (or all of the data on the same appliance that my VPS was running on) would it simply be handed over? If so, what was the point in effectively moving from one US service to another?

I raised a support ticket and received a reply saying:

>“.. buying a service from a non-US company gives you very little protection in any case..” 

>“.. Remember GCHQ in the UK were collecting lots of data on behalf of the NSA, and vice versa”

Not very reassuring I think you will agree, so I pressed the point and asked them straight out:

>“If you received a request for my data (or all data from an appliance) from the US authorities, would it be handed over?”

I received no response and the ticket remained open until I ultimately closed my account a few months later.

With my investigations into OwnCloud and GitLab now well underway and being happy with how they were panning out I decided to investigate an alternative provider. Taking everything into account I knew that the new service would have to be provided by a company that was neither in the US or the UK.

After quite a bit of searching around I finally decided on <a href='https://www.bahnhof.net/' target='_blank'>Bahnhof</a> – a company based in Sweden and who also hosted WikiLeaks. Their <a href='http://bahnhof.se/filestorage/userfiles/bahnhof_free_speech_policy.pdf' target='_blank'>Privacy Policy</a> says it all really. Yes they cost a little more than my previous provider but not excessively so.

I have been running with my new server now for a couple of months and have had zero issues. OwnCloud and GitLab are running fine – although there are a few configuration niggles to iron out (which reminded my why I started using hosted services in the first place) but on they whole I’m happy.

I’ve also configured both services to run under SSL and used <a href='https://www.ssllabs.com/' target='_blank'>SSL Labs</a> to help me configure the systems to gain an A+ rating. Not bad for a Developer 🙂

The whole process, and the ongoing commitment to maintain these servers has reinforced to me that privacy is something that needs work. It’s all too easy to do nothing and to say “I’ve got nothing to hide” – but as Edward Snowden says;

>“Arguing that you don’t care about the right to privacy because you have nothing to hide is no different than saying you don’t care about free speech because you have nothing to say“.