---
layout: post
title:  'When is a backup not a backup ….. ?'
date:   2011-04-05 00:00:00
tags:   backup data-recovery
---
The answer is of course, when you can’t restore from it. This is the situation I found myself in last weekend after receiving an email from a friend saying that he tried to post a comment but only received a blank page for his efforts. Sure enough, when I tried I got the same result.
Logging into the WordPress admin panel I was greeted with a message saying that the Akismet anti-spam plugin had not been loaded due to an error. Sounds like the most likely suspect, so what do I need to do about it? Well there was not an update available so it can’t be that. However, I had recently upgraded to WordPress 3.1 so maybe that’s the culprit. So clicking on the Reinstall button might sort me out right …. that’s where the problems really started.
<!--more--> 
Now before you start thinking “you forgot to backup didn’t you!?” the answer is no, well not quite. I have configured the wpTimeMachine plugin to perform a weekly backup and send it to Dropbox so presumed I was ‘safe’.
 
Well after clicking Reinstall and returning to the site all I saw was a php error – not good. Worse still was the fact that I could not access the Wodrpress dashboard either. In short the site was hosed – but I had last weeks backup so I was fine right…..?
 
A wpTimeMachine backup consists of five files, a zip file containing the contents of wp-content, a sql script containing all the data, the htaccess file, a script and a text file containing restoration instructions which assumes that you’ve lost the site entirely and are starting with an empty directory. The general gist is to get a vanilla install of WordPress running, extract your content into the new installation and restore your data.
 
Simple eh? Well no, not when the archive containing the content files, i.e. plugins, themes and uploads, is corrupted! Opening the archive displays a single folder (which was an upload from November last year – but the file is 13.5MB! Attempting to extract the archive resulted in an error saying “?End-of-central-directory signature not found” – this is not good!
 
Well I was not trying to recover from a total lost – I still had my content and my database. So I decided to create my own backup along the same lines as wpTimeMachine and see how I got on. Creating a vanilla install of WordPress 3.1 was pretty straightforward as was creating a local copy of my database (using the wpTimeMachine sql script). All that remained was to pull the contents of my wp-content down and and copy that into my local instance. Bad news was that trying to run the local instance resulted in the same errors – but that was because the links were still pointing (from my local instance) to the live site.
 
I zipped up the local instance and ftp’d it up to the site and, with breathe held, I unzipped it. With breathe still held – I attempted to login to the admin panel – SUCCESS!
 
Well, the site is back online (obviously) but there is still the problem of the corrupted backups – but at least I know about it know and can do something about it.