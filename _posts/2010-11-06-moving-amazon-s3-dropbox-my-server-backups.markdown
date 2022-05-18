---
layout: post
title:  'Moving from Amazon S3 to Dropbox for my server backups'
date:   2010-11-06 00:00:00
tags:   dropbox amazon-s3
---
For the past few years I’ve been using Amazon S3 for my remote file storage needs, initially it was used for a site I created blog-type in DotNetNuke for my girlfriends daughter to use on her Gap Year trip around the world. The hosting I had at the time was quite expensive in terms of disk space so the low cost of the Amazon service made it an easy choice.
Time passes ….. and I start to use Amazon for storing backups of my websites (this one included), initially manually but more recently I’ve been using plugins to do it for me and just send me an email when they are done. Even with this increase in storage I still only run up a $0.10 bill with Amazon every month – very cost effective I think you’ll agree.
<!--more--> 
Now I have had no problems with the Amazon service – none what so ever, so why am I moving away – surely it’s not just to save $0.10 a month! Well no, even I’m not that tight fisted ;-). The problem is that I am charged in US dollars and my UK bank have great pleasure in charging me £1 to perform the conversion from $ to £ – and that annoys me, on principal! Now I’m not going to get on my soapbox about the UK banks but they have already had enough of my money recently and I don’t see why I should cough up another £12 a year for a computer to work out the exchange rate. Amazon confirm that they will only be charging in $ for the foreseeable future so I need to find an alternative solution to backing up my server data.
 
Enter Dropbox – 2GB of free space and cross platform capabilities to boot. The best part, I already use it to synchronize files between my numerous systems, be it my Laptop or Netbook (both running Linux) to my Vista system or my Windows 7 work PC. Saving stuff to Dropbox at home and then having it sync to my work system (and vice versa) has been very useful. But how useful is it for automated processes, i.e. can I find plugins for the WordPress blogs and Drupal sites that I develop and maintain? Well, yes it is (with a little work on the Drupal side of things).
 
The WordPress side of things is a snap as there is a simple plugin called WP Time Machine that just does what I want. After installing and activating the plugin it is literally a matter of a few mouse clicks, a username and password and a folder name and you’re done. With everything configured you can click the ‘Generate wp Time Machine Archive’ button and the backup files will magically appear in your dropbox folder – marvellous! But what about scheduled backups I hear you ask – well this is handled via a cron script (details of which can be <a href='http://wptimemachine.com/-/scheduling-wp-time-machine-via-cron' target='_blank'>found here</a>). After a few test runs I have the settings I wanted and duly setup a cron job in my hosting panel to run the script on a weekly basis. WordPress sorted, not what about Drupal?
 
Well first of all there doesn’t seem to be a backup module out there (at the moment) that includes Dropbox as a target service. The <a href='http://drupal.org/project/backup_migrate' target='_blank'>Backup and Migrate module for Drupal</a> is probably the best known and widely used solution but it ‘only’ targets S3, FTP and Email. Not to be defeated I Googled around and found a short but informative <a href='http://tombigel.com/2010/09/19/dropbox_support_drupal_backup/' target='_blank'>blog article</a> on the subject of adding Dropbox support to the Backup and Migrate module – so it was possible!
 
While the article author (Alon Pe’er) has done all of the main leg work in terms of reviewing suitable Dropbox API libraries and producing a patch for the Backup and Migrate module he stops short of explaining how to put it all together into a working solution. That’s not a critisism, just an observation! So in reference to the strapline for my blog – If I don’t write it down myself, I’ll forget how to so it.
 
The first thing to do is to download the three components I’ll be needing, namely

- The Backup and Migrate module (<a href='http://drupal.org/project/backup_migrate' target='_blank'>download from here</a>)
- Alons Patch (<a href='http://drupal.org/files/issues/backup_migrate-dropbox.patch' target='_blank'>download from here</a>)
- The Dropbox Uploader library (<a href='http://jaka.kubje.org/projects/dropbox-uploader/' target='_blank'>download from here</a>)

<br/>
Now, to apply the patch I extracted the Backup and Migrate module to my desktop. Opening the extracted folder I navigated to the includes folder and dropped a copy of Alons patch into it. How did I know to do that? Well opening the patch file the first line refers to a file called destinations.inc – and that’s the folder it’s stored in (there are probably there ways to determine this – but it worked for me).
 
I then popped open a terminal window and navigated to the same includes folder and entered the following command:
```
patch -p0 > backup_migrate-dropbox.patch
```
Finally I dropped the DropboxUploader.php file into the includes folder.
 
So that’s that – I have the module patched and the Dropbox library in the right place – all I need to do now is copy the backup_migrate folder up to my Drupal installation, activate and configure it.
 
Configuration is virtually the same as with the normal unpatched version of the Backup &amp; Migrate module so I’ll not regurgitate it here. The only difference is that when configuring a Destination, Dropbox is now an option. Selecting it prompts you for a destination name, e.g. ‘My Dropbox Backup’, a path inside your Dropbox folder, e.g. backups/mydrupalsite and your Dropbox credentials.
 
And that’s it – with the destination configured it can be applied to a schedule or just run on demand.

>Obviously when there is an upgrade to the Backup and Migrate module I’ll have to go through this process again otherwise I’ll lose the Dropbox functionality. There is also the possibility of the patch not working on future releases of the module so I’ll have to be mindful of that.

So with my Amazon S3 account now empty and everything now backing up into Dropbox I no longer have any of those annoying (albeit trivial in terms of value) bank charges – so I suppose they will have to find some other way to fund their bonuses and Christmas parties 😉

>Well would you believe it, the day after I upload the patched version of Backup and Migrate to my Drupal sites an upgrade comes out! Well at least I can say that the patch etc works with the latest version (6.x-2.4) of the module!
     
