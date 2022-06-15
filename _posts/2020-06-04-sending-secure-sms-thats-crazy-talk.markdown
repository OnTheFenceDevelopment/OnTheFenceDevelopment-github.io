---
layout: post
title:  'Sending Secure SMS – That’s Crazy Talk!'
date:   2020-06-04 00:00:00
tags:   development open-source privacy proof-of-concept shhh-sms
---
![yyyy](/assets/images/privacy-stamp.png){:style="float: left; margin-right: 10px;"}
Many of us know that when we send an SMS (aka text message) it is sent in plain text and can be read by anyone with sufficient access.

This is normally limited to your cell provider but there are hackers out there using readily available hardware to act as a cell tower and initiate a man-in-the-middle attack.

Now I don’t know about you but I seldom send a regular SMS message – I use WhatsApp most of the time. Not only does it allow group chats (very handy for communicating with the family – especially during Covid-19 Lockdown) but it also provides end-to-end encryption. This means that only the intended recipient(s) and myself can read the message content.

It’s not that I’m doing anything illegal of course, it’s all about privacy.
<!--more-->
Now, before you start down the ‘what about terrorists and paedophiles’ route I’ve already covered my thoughts about that argument, normally spouted by Government officials when trying to justify an erosion of our privacy and freedoms, [in a previous blog post]({% post_url 2018-02-10-whatsapp-a-haven-for-paedophiles-and-terrorists %}).

The UK Government (and they are not alone by any means) are continually using this argument to attempt to force technology companies to weaken their encrypted messaging systems. They are calling for backdoors to be put in to allow ‘authorised’ agencies to access the data to aid with criminal investigations.

My argument is that should the tech companies relent and add these backdoors then the bad people will just use something else or, crucially, write their own. This would leave the rest of us on hobbled, insecure system with ‘authorised agencies’ trawling around peoples private messages attempting to justify their hard won access.

So what is involved in writing your own secure messaging system? Surely it’s not just an app on the phone. Surely there needs to be servers and things to receive and forward these messages to the correct recipients. How would a regular user set these things up?

Well, yes there does need to be some form of delivery system but that doesn’t mean we need to write it – there’s already one out there, it’s on just about every phone out there and it’s been tried and tested for years. I am of course talking about the humble SMS text message.

### Hang on, SMS isn’t secure!

True, the way SMS works doesn’t add any encryption to the process – plain text goes in and plain text comes out.

But this doesn’t mean that we can’t encrypt the message before we send it and for the recipient to decrypt it at the other end.

Now, I consider myself as a pretty competent developer – but I’m not what I would think of as a “rockstar developer”. I won’t have any of the big tech companies banging on my door offering me a massive salary and stock options to work for them. But surely I could write a mobile app which would allow the user to send and receive encrypted messages over SMS. As it happens – I can, and did just that.

As a **proof of concept** (you’re going to hear that term a lot in this post) I wrote an Android application, using Xamarin, which handles Key Pair generation, Key Exchange via QR code, Encryption, Decryption and integration with the devices SMS functionality.

Encryption is handled by the Open Source <a href='https://github.com/tabrath/libsodium-core/' target='_blank'>Sodium.Core</a> library which is a fork of <a href='https://github.com/adamcaudill/libsodium-net' target='_blank'>libsodium.net</a> (also Open Source) which is itself a wrapper around the well regarded <a href='https://github.com/jedisct1/libsodium' target='_blank'>libsodium</a> library – yep, Open Source all the way down.

In the image below Bob is sending a message to Alice, they have already exchanged their public keys using the app to display and scan a QR code containing the required data.
Below is the basic flow showing Bob sending an encrypted message to Alice (sequence shortened)

![shhh sms logic flow](/assets/images/shhhsms-highlevel-flow.png)

Lets break this down a bit and explain, at a high level, what is happening here;

1. Inside the Shhh.SMS app Bob selects Alice as the message recipient and enters his message (he can add emojis if he likes – that all works too!)
2. After clicking Send devices SMS app is opened with the encrypted message ready to send
    - Bob will need to specify the recipient from his contacts
3. Alice receives the SMS just like any other and uses the SMS apps ‘Share with’ functionality to send the encrypted message content with the Shhh.SMS app
4. Shhh.SMS opens and if it can verify the message it displays the decrypted text

After passing the message over to the devices SMS application is only exists on Bob’s phone in it’s encrypted form.

When Alice receives the message it is only decrypted for viewing within the Shhh.SMS application.

Moreover, while the message was being sent it was encrypted using keys that only exist, securely, on the sender and recipients devices. The cell carriers involved in the delivery of the message have no way of decrypting it.

### So what’s the point?

Let’s get this absolutely straight – I did not write this app so that bad people could communicate with each other about bad things. That’s not the point I’m trying to make here.

The point is that the encryption genie is out of the bottle and it cannot be put back in. It’s just math!

>“…it’s a proof of concept and lacks polish but that’s not the point”

If the world Governments think that outlawing the use of encrypted messaging applications is going to stop bad people from using them then they are frankly deluded.

This app took me a couple of weeks of evenings to put together – sure, it’s **a proof of concept** and lacks polish but that’s not the point. The point is that if I can write this in a couple of weeks as an investigation, what could others with a more sinister mindset achieve?

The general public are, generally, good people. So why should we all be treated as if we are criminals?

>When privacy is criminalized, only criminals will have privacy.
>
> -- Daniel Suarez, <a href='https://www.goodreads.com/work/quotes/52090299' target='_blank'>Change Agent</a>

Our privacy is being eroded because of a small minority of bad people. Laws are being passed that target a tiny proportion of people but affect us all.

You may be surprised to know <a href='https://boingboing.net/2016/11/28/the-snoopers-charter-gives-the.html' target='_blank'>who can currently request (demand?) access to your internet browsing history from your Internet Service Provider</a>. Some are obvious, GCHQ and the Home Office, but I’m still at a loss as to why the **Welsh Ambulance Services National Health Service Trust** would need access to such information. And this is all without considering the security and accessibility of this data – is it just the agencies on this list?

### OK, so how do I get the app?

As previously mentioned, this is a **proof of concept** and nothing more than that.

The user interface is basic and pretty ugly (no attempt has been made to style the app beyond some basic layout). The code could do with refactoring and cleaning up.

It certainly is not ready for the Google Play Store (development was Android only) and I have zero intention of making it so. That is not the purpose of this exercise.

What I have done is to make the source code fully Open Source and <a href='https://github.com/OnTheFenceDevelopment/ShhhSMS' target='_blank'>available on Github</a>.

If you want to submit pull requests to fix problems or improve the app then please feel free to do so – but do bear in mind that it will never be my intention to release this as a production app via the Google Play Store.

## By the way – did I mention that Shhh.SMS is only a Proof of Concept? Good, just checking 🙂