---
layout: post
title:  'Configuring vsftp on Ubuntu Server 10.04 LTS'
date:   2011-06-10 00:00:00
tags:   linux ubuntu ftp
---
So my [move from shared hosting to virtual private server (VPS)]({% post_url 2011-06-07-moving-shared-hosting-virtual-private-server %}) was going well so far – I’d moved this blog across and  [wired up Exim4 to handling all my emailing needs]({% post_url 2011-06-09-migrating-blog-virtual-private-server-exim4-email-support %}). Then yesterday I saw an <a href='http://lifehacker.com/5809888/how-to-make-a-blog-or-site-into-a-mobile-app-without-programming-knowledge' target='_blank'>interesting article on Lifehacker about the MobilePress plugin for WordPress</a> which rendered the blog in a format more suitable for mobile devices. Excellent, I thought – I’ll have that! That’s when I found out that the blog itself was not as ready as I thought it was – the fact was I could not install any plugins due to the lack of an FTP server on my VPS – so my next job was to resolve that!
<!--more-->
When I tried to install the MobilePress plugin I was presented with the following page which is requesting FTP credentials – which I didn’t have.

![wordpress connection information screen](/assets/images/wordpress_install_plugin1.png)

But once again Open Source came to the rescue through the <a href='http://vsftpd.beasts.org/' target='_blank'>vsftp project</a> which claims to be the fastest and most secure FTP server for Linux systems. A bold claim indeed but surely this means massive amounts of configuration etc, well as it happens (and for my purposes at least) this is not the case. That said, all of the tutorials I found out on the web were missing one key step which left me scratching head for a little while until the penny dropped.

First of all I installed the package from the standard repository:

```
sudo apt-get install vsftpd
```

Next I needed to make a quick change to the main configuration file which is located at `/etc/vsftpd.conf` by making sure that the following lines are uncommented

```
local_enable=YES write_enable=YES
```

With the update made and the file saved I restarted the FTP server

```
sudo /etc/init.d/vsftpd restart
```

This is the point were all of the tutorials I found move onto securing the server further (it is apparently pretty secure already so these steps are optional). But at this stage I should have been able to access my FTP server from an external client as well as configure the blog to use if for its plugin installation downloads – and I could do neither.

I checked the ftp user existed, changed it’s password and made sure it was not in the `/etc/ftpusers` which (ironically) lists users who cannot access via ftp. I checked that the appropriate ports were open and that the service was in fact running. Everything looked fine.

Then I wondered what if the ftp user is a special, restricted, user and what if I created another user;

```
sudo adduser ftpuser
```

and after specifying a password (and accepting the default values for the other user related fields) added them to the ftp user group

sudo adduser ftpuser ftp

Tada! I could now access the FTP site from my local browser and after entering the appropriate information into the WordPress configuration screen (using localhost for the hostname and the username/password I’d created) I was in business. I finally installed the MobilePress plugin (remember that) and the blog now provides a more mobile friendly experience.

![mobile layout](/assets/images/mobile_layout.png)