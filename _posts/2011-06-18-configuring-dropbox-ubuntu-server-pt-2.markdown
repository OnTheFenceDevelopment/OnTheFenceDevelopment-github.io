---
layout: post
title:  'Configuring Dropbox on an Ubuntu Server – Pt 2'
date:   2011-06-18 00:00:00
tags:   linux ubuntu dropbox
---
In Part 1 I clarified a few points on the <a href='http://wiki.dropbox.com/TipsAndTricks/TextBasedLinuxInstall' target='_blank'>Dropbox tutorial for getting the server running on a headless Linux server</a> and while I had it running it was ‘locked’ to an ssh session, i.e. close the session and the Dropbox server also stopped. The same tutorial provides links to sample `init.d` files which can be used to start the Dropbox server on boot. This works well enough but there were a couple of things that, again, could have done with a bit more detail.
<!--more-->
The Wiki post provides links to start up files for Ubuntu, Fedora and Gentoo – I’ll obviously be using the <a href='http://wiki.dropbox.com/TipsAndTricks/TextBasedLinuxInstall/UbuntuStartup' target='_blank'>Ubuntu version</a> here. I simple copied and pasted the script into nano and changed the DROPBOX_USERS to read:

```
DROPBOX_USERS="root"
```

I also took the ‘header’ information from the bottom of the page and pasted it after line one.
 
This file was then saved to `/etc/init.d/dropbox` and made executable by running

```
sudo chmod +x /etc/init.d/dropbox
```

Now we need to create the init script links and fortunately there is a helper script that we can use;

```
sudo update-rc.d dropbox defaults
```

Finally, back at the original Dropbox Wiki article, there is an upstart script that needs to be saved to `/etc/init/dropbox.conf`.
 
Job done – all we need to do now is to start the Dropbox server and this is a simple matter of running the following command in a terminal (I did this as root).
 
I ran a quick test by cd’ing to the Dropbox folder and creating a simple text file and saving it. Navigating to the Dropbox site confirmed that the file had been synced successfully.
 
So, now with a Dropbox server running and syncing as expected all I need to do now is to create a script that will perform the required operations, i.e. backing up the MySQL database and create a tarball of the blog folder itself. This script will be run on a schedule using cron.