---
layout: post
title:  'WhatsApp – a Haven for Paedophiles and Terrorists?'
date:   2018-02-10 00:00:00
tags:   encryption privacy rant
---
Yep – thought that would get your attention!

It’s headlines like this that the UK Government (and the press) are throwing around in order to drum up support for one of the most intrusive and privacy damaging campaigns to date.

The premise is that bad people use these services, which make heavy use of encryption to keep messages private, and by doing so hamper the security services who can no longer access private information in order to monitor them and stop them from doing bad things.

Now I’m not denying that these bad people do use WhatsApp (and similar applications) to enable them to communicate without their messages being intercepted. But I use WhatsApp and so do my wife and kids and we are not bad people. If WhatsApp are expected to put a backdoor into their systems to allow access to the content by so-called ‘authorised agencies’ then what about our privacy?
<!--more-->
When I discuss this with people many will say “well, if you’re not doing anything wrong then what’s the problem?”. However, when I ask them for their email and social media passwords they are a somewhat reluctant to hand them over – “but if you are not doing anything wrong then why do you care?”, I ask.

The answer is simple, their email and social media feeds are private and none of my business. Just because something is private does not mean it’s illegal or even wrong, just private.

We may be discussing our medical history, financial details, travel plans or just what time we will be home for tea but that’s our business, it’s private and nobody else’s business except ours and whoever we’re talking to.

So while I am willing to accept that bad people use these platforms in an effort to hide their activities, I’m pretty sure that they make up a tiny percentage of the 1,000,000,000 (and increasing) WhatsApp users. Do we all have to give up our right to privacy for the sake of these people and will it even make a difference?

## The Snoopers Charter

In 2016 the Investigatory Powers Act, or Snoopers Charter as it was dubbed, was passed into Law and with it the privacy of every UK citizen was eroded a little more.

Did you know that under this legislation your Internet Service Provider now has to keep your browsing history for 12 months and provide it on demand to authorised agencies?

If you did then you may have assumed that as long as you are not “doing anything wrong” then you have nothing to worry about as the Police and Security Services are only looking for bad guys.

Well, did you also know that on the <a href='https://www.independent.co.uk/life-style/gadgets-and-tech/news/investigatory-powers-bill-act-snoopers-charter-browsing-history-what-does-it-mean-a7436251.html' target='_blank'>list of agencies that can access these records</a> are:

- HMRC (the tax man)
- The Department of Work and Pensions
- The Department of Transport!
- The Welsh Ambulance Services and National Health Service Trust!!
- The Food Standards Agency!!!

Now what on earth to the Food Standards Agency need with my internet browsing history? What possible use could it be to them?

If the UK Government were to enforce a backdoor into WhatsApp and other platforms like it – who would be able to access the information and how secure would it be?

But that’s not all. If the Government weakens encryption and demands backdoors be created in otherwise secure systems, who knows who can gain access to the information that was once protected?

If SSL certificates (which put the padlocks on your browsers address bar to indicate that the page is secure) become less secure, how safe are you when you are accessing your online banking or shopping on Amazon?

The truth of the matter is that if the UK Government gets it’s way it’s not really them that we have to worry about – it’s the hackers. They will have a field day with all this insecure data flying over the wire. All it would take would be a poorly implemented backdoor and then all bets are off. If Government agencies cannot even secure their own data, what chance do they have of securing the keys to our data?

## A Developers Viewpoint

So, apart from being a UK citizen, what has this got to do with me and why am I ranting about it?

Well, as a developer I know that writing a chat application is not really that hard – in fact I recently read <a href='https://www.amazon.co.uk/Xamarin-Cross-platform-Application-Development-Second/dp/1784397881' target='_blank'>a book which guided the user through cross-platform Xamarin development</a> and the target project was a cross platform chat application. Moreover, <a href='https://github.com/jonathanpeppers/XamChat' target='_blank'>the source code is actually on Github</a> so there’s a starting point right there.

Currently that XamChat application stores and sends data in plain text so not secure or private. But how difficult would it be to upgrade the app to use encryption? Even though I am not a cryptographer by any stretch of the imagination I’m guessing not that hard at all.

And that’s the point – if I can do this then any reasonably competent developer could do it too. If the UK Government we to make it unattractive for the bad guys to use secure apps like WhatsApp then there is nothing stopping them from writing their own end-to-end encrypted messaging system using state of the art encryption that cannot be broken with today’s technology.

Meanwhile the rest of us will be using insecure systems that leak information and make us vulnerable to malicious hackers keen to exploit these weakness, gather personal information and use it to their own ends.

## Going Forward

In an effort to prove my point, I’m going to take a run at this. Ultimately I’m going to see just how hard bolting encryption into the XamChat application.

I’m not expecting (or intending) to create a WhatsApp killer or even anything that polished – just something usable to prove the point.

First thing to do is to get up to speed on encryption, especially in .NET. There’s <a href='https://app.pluralsight.com/library/courses/practical-cryptography-dotnet/table-of-contents' target='_blank'>a 4 hour course on Pluralsight</a> so I can kill two birds with one stone; [my commitment to watch one Pluralsight course a month]({% post_url 2018-02-03-so-what-will-2018-be-the-year-of %}) and create a Command Line application to create Encryption Keys, Encrypt & Decrypt text data in preparation for creating SecureXamChat.

>Edit – 15th Feb 2018: Subsequent to me posting this there was <a href='https://www.theguardian.com/commentisfree/2018/feb/12/encryption-safe-hillary-clinton-secure-backdoors-privacy' target='_blank'>a great article in The Guardian</a> which (obviously) make a much better job of getting the point across and it well worth a read.