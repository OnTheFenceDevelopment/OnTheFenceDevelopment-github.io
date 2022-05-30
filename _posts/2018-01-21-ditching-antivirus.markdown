---
layout: post
title:  'Ditching AntiVirus'
date:   2018-01-21 00:00:00
tags:   anti-virus rant
---
Just like us, as computers get old they tend to slow down. It’s a fact of life pure and simple.

With computers it tends to be due to the hardware not keeping up with the new requirements of today’s applications (just try running later Windows or Office on a Pentium 4 and you’ll see what I mean). We tend to put up with the slow down until something finally gives out, a hard-drive or motherboard for instance, and then we buy a new one.

Well my Windows 10 development workstation was slowing down and while it’s a few years old now, it is still a pretty high spec – i7-3770 with 32GB RAM and SSDs – this thing used to fly.

But recently it was noticeable that it was taking longer to boot, applications like Visual Studio and SQL Management Studio seems to struggle to load and surfing the web was a bit of a grind.
<!--more-->
I decided to reinstall from the ground up and make sure that I didn’t install anything that didn’t really need for development (like Steam!). I also decided that I was not going to reinstall my AntiVirus!!!

“Oh My God!” – I hear you shout. Are you insane? Don’t you know how many viruses there are out there and how quickly your system could be compromised?

Well, no I’m not insane (or at least I don’t think so) and yes I do know that there are a lot of viruses out there but I’m not just doing this without due thought and advice. I also (probably) wouldn’t consider junking it unless it had crossed the line in the number of areas.


## Why do I think it’s a good idea to run without Anti-Virus?

I listen to a number of Podcasts and one of them is <a href='https://twit.tv/shows/security-now' target='_blank'>Security Now</a> from the <a href='https://twit.tv/' target='_blank'>Twit Network</a>. When someone with the knowledge, experience and understanding that <a href='https://en.wikipedia.org/wiki/Steve_Gibson_(computer_programmer)' target='_blank'>Steve Gibson</a> has says that he doesn’t use a third party Antivirus then there must be something in it.

What does Steve use? Well, as he is running Windows 7, Steve is using the built-in Security Essentials (it’s Defender in Windows 10). Yep – he’s using what comes in the box! And the reason for that is that third party Anti-Virus is incredibly invasive and has to inject code deep into the Operating System. This, perversely, <a href='https://arstechnica.co.uk/information-technology/2017/01/antivirus-is-bad/' target='_blank'>increases the attack surface for malicious code</a>. <a href='https://arstechnica.co.uk/information-technology/2016/06/severe-bugs-25-symantec-norton-products-details/' target='_blank'>Bugs in products like Symantec/Norton</a> have exposed users to a greater risk of infection while users believed themselves to be safe. I’m not even going to being talking about Kaspersky!

In the 10 years or so that I’ve been using my current Anti-Virus application, <a href='https://www.avast.com/index' target='_blank'>Avast</a>, I’ve only had about half a dozen warnings about suspect files – and there is no reason to believe that Defender would not have detected the same files or whether they were actually malicious (I get a number of false positive alerts when I’m compiling code in Visual Studio – and I don’t write viruses!). I tend not to surf around in the darker parts of the web and am pretty careful about what I install.

So, I’m not running without Anti-Virus – just without third party Anti-Virus.

## What lines did Avast do to push me down this road?

Well, there are a couple of reasons really:

Recently it has been getting in the way of my work.

Running a WebAPI application in IIS on the workstation and accessing it from the iPhone simulator on the iMac was never a problem. So when I started getting ‘Failed Connection’ errors I assumed it was a configuration issue or a coding error. After an hour or so of debugging I find that Avast is blocking requests to IIS – which it has never done before. Turning the firewall off confirmed the problem – I just had to remember to do it again when I was next accessing the WebAPI from another system.

Other applications failed to start with the Avast firewall engaged (when they had played well together in the past) and efforts to resolve the problem by Repair/Reinstall all failed.

But the big thing that did it for me? The real big step over that line we call privacy was when I logged onto my internet banking and Avast displayed this:

![avast vpn dialog](/assets/images/avast_vpn.png)

Now call me a member of the tin-helmet brigade if you like but when I access my online banking over a secure connection I find it a bit disconcerting when something says “I can see what you are doing!”.

It was a reminder to me that like most (all?) third-party AV products out there, Avast can intercept and analyse traffic being sent over a secure connection through my browser. To do so it has install a trusted root certificate on my computer which means it can act as a ‘man in the middle’ – intercepting my traffic, checking it and then passing it on.

And it’s the <a href='https://en.wikipedia.org/wiki/Man-in-the-middle_attack' target='_blank'>man in the middle</a> part combined with the <a href='https://www.express.co.uk/life-style/science-technology/782501/anti-virus-protection-hijacked-hack-computer-malware-doubleagent' target='_blank'>increased attack surface</a> and buggy applications part that worries me and that’s why I’ll be sticking with Defender for now.

>Why install racing harnesses in your car when the built-in seat belts will keep you just as safe in normal use?