---
layout: post
title:  'Taking control of my Domain'
date:   2018-03-01 00:00:00
tags:   pluralsight privacy
---
Some time ago I was watching a <a href='https://app.pluralsight.com/library/courses/master-domain/table-of-contents' target='_blank'>Pluralsight course called ‘Master Your Domain’</a> where Rob Conery explained how to break your reliance on the major service providers for email, source code, blogs and file-sharing and create your own domain to host your data.

Following the course I started hosting my own Git server, Blog and File Sharing service but Email …. well that was too big a step for me to take at that time. However, times change and when I started experiencing issues with my email that was the trigger for me to take the plunge.
<!--more-->
## What was the problem with Google Mail?

When GMail moved to Inbox I have to say I was less than impressed. For my personal email it was fine – I didn’t mind moving to ‘Inbox Zero’ but, call me a dinosaur, it just jarred with me when it came to my business account.

Now, I really didn’t want the hassle of moving email providers so as many of the ‘problems’ were to do with the Inbox application I decided to use an alternative email client called <a href='https://play.google.com/store/apps/details?id=com.wemail' target='_blank'>WeMail</a> on my Android phone and this served me very well for a couple of years.

Recently however, I started noticing multiple ‘draft’ messages hanging around (basically ‘snapshots’ of messages as I was typing and had then sent) and issues with message signatures – sometimes they were added, sometimes not. Was this a problem with the WeMail or Google – who knows.

## What about Google Docs?

I was also not overly impressed to see that <a href='https://www.thesun.co.uk/tech/4815417/google-drive-block-terms-and-conditions/' target='_blank'>Google had blocked ‘large numbers’ of users from accessing their files on Google Docs</a>. Admittedly Google were trying to filter out malicious content but the fact remains that they were scanning everybody’s files for what it deemed to be inappropriate. What if content in my files triggered a false positive and they blocked my access to an important document? What about my email? I have all sorts of information in there from company accounts and confidential client discussions to inane conversations with recruiters and colleagues.

## Making the move

After deciding to make the move I had a look at what I actually stored on Google services and what needed to be migrated.

Obviously there was a couple of gigabytes of email but I also had a lot of stuff in Google Docs – from invoices to memes – where was I going to put all this stuff?

### Files and Stuff

As already mentioned above, following Rob Conery’s course I had configured my own Dropbox-like File Sharing service using <a href='https://owncloud.org/' target='_blank'>OwnCloud</a> and this had been running fine for a while now. I had the server installed on a Raspberry Pi sitting on top of a 250GB SSD in an external drive enclosure. With the appropriate DNS configurations and port forwarding on my router this configuration worked well for me, allowing me to share folders with clients for them to upload large media files and letting me transfer files between my Windows workstation & laptops as well as my iMac and MacBook Pro.

### Email

As Rob mentions in his course, it’s really not viable to host your own email these days. Messages coming from unknown sources are blacklisted by many services in an effort to reduce the level of spam reaching our inboxes. For this I needed to find an alternate provider; one that provided me with all the features I already had (spam protection, mobile access etc) but with some increased confidence over the privacy of my inbox.

In the course Rob recommends <a href='https://www.fastmail.com/' target='_blank'>Fastmail</a> and reading their <a href='https://www.fastmail.com/about/privacy.html' target='_blank'>Privacy Policy</a> I was happy to give them a try – they offer a 30 day free trial and I did give them a try previously but not ‘in anger’ as it were, i.e. I created an account and sent test messages, added appointments etc but never actually used it on a daily basis.

After exporting my Calendar and Contacts from GMail I set about the import process from within Fastmail. The process itself was pretty straightforward with clear instructions and troubleshooting advise. I experienced no real problems but I’m sure that Fastmail support would have been on the case if I had.

The only ‘grumble’ I had at the time was that my Gmail data was imported into a folder called ‘migrated’ – I was expecting my Gmail Inbox messages to appear in my new Inbox. This caused a bit of consternation at the time but looking at it now I’m not so sure it’s a problem – all the data is there and I can easily move things around if I so desire.

Re-configuring my DNS to redirect email to the Fastmail servers was also straightforward and I’m happy to say that a couple of weeks into my trial I’m very happy with the service I’m receiving so will definitely be signing up to the full plan.

### So what about Backup?

So I now have my email hosted successfully and files are back under my control so we’re all good yes?

Well not quite.

One of the things we don’t really think about it that on top of storing all our information and making it available to us online, Google are actually backing this stuff up. If one server was to totally fail then the data is ‘simply’ pulled from another and we never know there was a problem.

Well, the data is now sitting on a drive in my office – what happens if it fails, or the office burns down? How will I get that data back? I need a regular, offsite backup.

The answer was fairly simple and conforms with my need to keep my information private.

I had previously bought a Mac Mini for developing my Xamarin iOS applications, this was later replaced with an iMac, so I fired it up and installed the OwnCloud client onto it. This was set to sync everything to it’s local drive – and yes, it’s still sitting in my office so at this point I’ve gained nothing.

I then signed up for a <a href='https://spideroak.com/' target='_blank'>SpiderOak</a> account – initially 250GB but they later increased this to 400GB – using their 21 day trial. Their <a href='https://spideroak.com/one/' target='_blank'>‘SpiderOak One‘</a> client was then installed onto the Mac Mini and configured to backup everything in the OwnCloud sync folder.

I’ve also install the One client on my workstation and also mounted a couple of folders from my Synology NAS onto the Mac Mini for good measure and I have backed up almost 100GB of data so there is plenty of headroom for future expansion.

## Going Forward

Ok, some of you may be asking about the cost of all this and yes there is some additional outlay – my Google Apps account was created when they were free and to their credit Google have honoured this long after charging for new accounts. But the cost to the business is minimal – and even as a personal user it’s certainly not prohibitive.

The backup solution I have in place does have it’s downsides – we had a power cut here a while back and I totally forgot to reboot the Mac Mini so there were no backups for a while.

But the fact is that I now have control over my data and if this takes a little more work and expense then such is life.