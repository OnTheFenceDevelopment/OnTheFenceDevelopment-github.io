---
layout: post
title:  'Configuring Dropbox on an Ubuntu Server – Pt 1'
date:   2011-06-11 00:00:00
tags:   linux ubuntu dropbox
---
If you’ve been reading any of my recent posts you will know that I have been [moving from a shared server host to a virtual private server]({% post_url 2011-06-07-moving-shared-hosting-virtual-private-server %}) and that I have also [experienced issues with my backups]({% post_url 2011-04-05-when-backup-not-backup %}). Well with the blog configured and running well the migration was almost complete, but what about backing up my data? I’d already seen how easy it was to run into problems so this time I wanted to be a little bit more in control and not just blindly rely on third party plugins. I was keen to use Dropbox but was unsure about installing and configuring it on a headless Ubuntu Server. As it happens it was not really that difficult to get it up and running.
<!--more-->
The Dropbox Wiki has a very good article on <a href='http://wiki.dropbox.com/TipsAndTricks/TextBasedLinuxInstall' target='_blank'>configuring Dropbox on an text based Linux system</a> like mine but there are a couple of steps that are a little light on detail and it does not really flow very well so it’s easy to miss something and end up scratching your head for a while. I’ll not reproduce the entire article here but just highlight the areas I think need a little bit more explanation.

Using the ‘step-by-step’ setup process in the above article everything goes fine until step 7 at which point you are asked to navigate to a particular URL, from the server, to link the installation to a Dropbox account. Well there’s a problem – we are running a headless server so we can’t really run a browser can we. Well actually yes we can – just not a very pretty one!

The article suggests the installation of a text based browser called lynx which can be installed with the following command;

```
apt-get install lynx
```

So once you have lynx installed you will need to have two ssh sessions running to complete the sync process, one to start the daemon which prompts you with the appropriate URL and one to run the lynx browser in to navigate to it.

In one of the sessions enter

```
~/.dropbox-dist/dropboxd
```

![getting dropbox sync url](/assets/images/getting_sync_url.png)

and when the URL is displayed use the mouse to select it and copy it to the clipboard using CTRL+C. Now in the other session, enter `lynx` and you should see something like this:

![navigating to sync url in the lynx browser](/assets/images/navigating_to_sync_address.png)

It should come as no surprise that the browser is driven by the keyboard and to navigate to a URL we just need to press ‘g’ and paste the value copied from the other session (or you could just type it in) and then press ‘Enter’. At this point you may get a few messages about accepting cookies etc and I just pressed ‘A’ to accept all (although I needed to do this a couple of times!). The resulting webpage may not look like Dropbox – but in text mode it’s as close as we’ll get.

![logging into dropbox with lynx browser](/assets/images/logging_into_dropbox.png)

Using the TAB key you should be able to jump down to locate the Username and Password fields. Enter the appropriate values and then TAB down to the ‘Submit’ text/link and press ‘Enter’.

After successfully logging in you should now be able to TAB down to locate a prompt asking you for your password again to link the host server with the current Dropbox account. Do this and TAB down to the ‘Submit’ button and press ‘Enter’. If successful then the other ssh session should now display a welcome message.

![linking to dropbox complete](/assets/images/sync_complete.png)

In the lynx session, exit the browser by pressing ‘q’. You should now find a Dropbox folder in your /home directory which will contain (or still being syncing) all of your existing files (or the default Dropbox ones if you linked to a fresh account).

So that’s that then – well not quite. We currently have an ssh session locked running the daemon – if we close it down then the daemon will also close. So we need some way of running it as part of the normal startup routines which can be achieved with some scripts in the appropriate locations. I’ll run through this part of the wiki article in part 2.