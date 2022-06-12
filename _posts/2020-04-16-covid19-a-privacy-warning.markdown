---
layout: post
title:  'Covid19 – A Privacy Warning'
date:   2020-04-16 00:00:00
tags:   covid-19 privacy
---
![internet privacy](/assets/images/internet-privacy.png){:style="width: 100%;"}
In these weeks of lockdown in the UK due to Covid-19 there have been a number of incidents of the police overstepping their powers;

- <a href='https://metro.co.uk/2020/04/09/police-threaten-search-shopping-trolleys-check-buying-essentials-12532339/' target='_blank'>Police Chief ‘threatens’ to search shopping trolleys to ensure only essential items are being purchased</a>
- <a href='https://www.mirror.co.uk/news/uk-news/police-forced-apologise-man-dropping-21851418' target='_blank'>Police officer arrests man after threatening to pepper-spray him – apologies after man explains he is delivering food/medicine to vulnerable relatives</a>
- <a href='https://metro.co.uk/2020/04/10/police-officer-tells-man-cannot-sit-front-garden-12537093/' target='_blank'>Police officer tells man he cannot sit or play with his kids in his own front garden</a>

<br>
The police chief was forced to u-turn in his threat while the forces involved with the other two incidents say that the officers were ‘well intentioned but over zealous’ – but to my mind, that’s not the point.
<!--more-->
The point is that there will always be people in a position of authority or power who overstep their remit – and when it come to our privacy that’s not a good thing.

The UK Government, along with many others, are trying to force technology companies such as WhatsApp to provide backdoor access to encrypted, private conversations of their customers.

Now, the Government will say that this is for the safety of us all and that they are only targeting bad people – you know terrorists and pedophiles – and access to the private data will be strictly controlled.

But [as I’ve previously posted]({% post_url 2018-02-10-whatsapp-a-haven-for-paedophiles-and-terrorists %}), if the likes of WhatsApp were to provide such access then the bad people will just use something else, leaving us with a hobbled and insecure messaging platform.

We would not only be at the mercy of hackers but also the sort of ‘over-zealous’ agencies who would now be able to trawl over our private conversations. Bearing in mind that most (if not all) of the bad people will have moved away and that the Government will be keen to show some justification for having applied pressure for access to the data, I think it will be inevitable that innocent people will come under unwarranted scrutiny.

Towards the end of the above post I mention the development of a Command Line application which will allow the encryption and decryption of data which has now been completed and <a href='https://github.com/OnTheFenceDevelopment/PersonalEncryptorCLI' target='_blank'>released as Open Source on Github</a>.

I also proposed the development of a Secure Chat application, “SecureXamChat”, to prove the point that it was trivial for any competent developer to write such a thing.

The one sticking point that I kept thinking about was the transport layer – the mechanism of actually sending and receiving messages (the actual encryption/decryption etc is pretty straightforward).

I didn’t want to use the systems provided by the big tech companies as this would place a barrier in front of users with a non-technical background. I wanted something that didn’t need any advanced configuration.

One day it just came to me – why don’t I just use the transport mechanism built into just about every phone out there, that is the Short Message Service – or SMS as we all know it.

Well, the Covid-19 lockdown has given me a lot of time and I’m currently finishing off an early proof of concept (that means functional but ugly) Android application which will allow users to send and receive encrypted SMS messages.

The application, written in Xamarin, will;

- Generate a Key Pair based on a password/passphrase
- Allow users to share their PUBLIC keys via QRCode scanning
- Encrypt text messages and send them via SMS
- Decrypt received secure messages

I should reiterate, that the aim of this development is NOT to help the bad guys. It’s to prove to the UK Government that;

- Forcing companies to weaken the encryption of their products will not achieve their goal (unless the goal is the ability to snoop on the public at large of course)
- Encryption is out there – it’s just Maths. You cannot but the genie back in the bottle.

I should finish the development of the application in the next few days, maybe a week as I’m not solely working on this. Once I have it in a workable state I’ll Open Source it by pushing the code to Github.

I may well polish the code and the User Interface but this is not intended to be a production ready application. I’m not intending to release this to the Play Store and I’m certainly not looking to make any money from this.

I’ll post again once development of the Proof of Concept is ‘complete’. In the meantime remember;

>When privacy is criminalized, only the criminals will have it
>
> -- Daniel Suarez

Stay safe out there people.