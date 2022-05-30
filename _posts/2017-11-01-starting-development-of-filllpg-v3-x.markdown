---
layout: post
title:  'Starting Development of FillLPG v3.x'
date:   2017-11-01 00:00:00
tags:   mobile-development visual-studio
---
## Overview

![fill lpg app logo](/assets/images/filllpg_logo.png){:style="float:right; margin: 10px;"}
With the most recent update to the FillLPG application (v2.0.28.2) rolling out I will be ceasing all development of this version (unless some horrible bug raises it’s ugly head). But fear not loyal LPG users – that doesn’t mean the the app will be going away – far from it.

Technology moves on at pace and over time new skills are acquired and lessons are learned. The ‘problem’ is that to implement all of this it is easier to start over again – taking advantage of the new framework features, applying the new skills and remembering those sometimes painful lessons.
<!--more-->
## So, what’s on the horizon?

I suppose the ‘headline’ news is that an iOS version will soon be a reality! After years of focusing solely on the Android version our Apple-using LPG’ers will be getting some love too.

The aim will be to develop an iOS application with feature parity to the current Android version.

Now, don’t fret if you are an Android user – I’m not abandoning all of you who have helped make the app what it is today. The fact that I can essentially develop for two platforms at the same time is due to the advances made in the underlying framework used to develop the app. Previous versions didn’t really lend themselves to the type of mapping that is required for the FillLPG app – but that’s all changed now and mapping is now fairly straightforward to achieve on both platforms whilst sharing the maximum amount of code – which is good for maintainability (fix a bug in one place and it’s fixed for Android and iOS).

With the rest of the application mainly consisting of ‘Forms and Lists’ and these can easily be shared between the new platforms.

The result will be a more modern UI, lower impact on battery life and data usage.

Other planned features include:

>Offline price updates (updates will be pushed when your device next has internet access)
    “Route Planning” – display stations along a particular route allowing you to plan stops
    Enable/Disable update alerts for favorite stations

## But there’s more…

The webmaster of the FillLPG website is currently developing a new version with a new and improved webservice – which is how the app communicates with the site. This will expose a lot more data to the app, including:

- Station notes
- Opening Times
- Flags such as ‘Disabled Friendly’ and ‘SafeFill Capable’
- Ability to specify price currency
- and more

Obviously I have no control over the timescales for the new website functionality but as soon as it is available I will be including it into the application as quickly as I can.

>Please remember though that the FillLPG website and the mobile apps are ‘labours of love’ and that both myself and the site webmaster have other commitments. The website and apps are provided free of charge and with no ads.