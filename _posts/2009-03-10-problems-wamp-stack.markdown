---
layout: post
title:  "Problems with the WAMP Stack"
date:   2009-03-10 00:00:00
tags:   windows-vista wamp
---
Had an interesting problem at work today trying to configure the WAMP Stack on a Vista PC. I needed this configuration to evaluate the Joomla CMS application for an internal project. I had some minor experience with Joomla and the LAMP stack on a Ubuntu Linux system but as it didn’t fit my needs I never got very far into it. Now I had a change to continue my climb the learning curve and get paid for it – neat huh!
<!--more-->
WAMP is to Windows what LAMP is to Linux, basically the installation of the Apache webserver, the MySQL database and the PHP (or PERL/Python) programming language.

I downloaded WAMP from <a href="http://www.wampserver.com/en/" target="_blank">http://www.wampserver.com/en</a>

and, after stopping my local instance of IIS to prevent any port 80 clashes, did a basic Next/Next/Next type installation which resulted in a new icon in the System Tray (see below) – but all was not well!

![WAMP Server Menu]({{ site.url }}/assets/images/menu_wamp.jpg)

When I tried to kickoff the Joomla installation it complained that it did not have any MySQL support – kinda serious for a CMS I suppose.

I hadn’t checked that the installation was successful but WAMP had not complained and all the services appeared to be running. Clicking on the System Tray Icon and opening the phpMyAdmin (which should allow administration of the MySQL database) all I got was an error – looks like my problem was caused because an extension was not loaded, but why not?

![php my admin error]({{ site.url }}/assets/images/phpmyadmin_error.jpg)

I checked the php.ini files and the extension_dir parameter was set correctly and the required extensions were uncommented and should therefore be loaded. However, when I navigated to the phpinfo page the Extension Directory was set to

`.`

and not

`c:/wamp/bin/php/php5.2.9/ext`

as specified in the php.ini file – so where was it getting that from?

After a little hunting around I remembered that I already had PHP installed on this PC – maybe it was picking that one up. The problem was that even if this was the case I needed/wanted to keep WAMP totally separate from everything else on my system, so how did I tell WAMP to use it’s own php.ini file? Turns out it was not too difficult after all.

Adding the following line to the http.conf file within the WAMP Apache configuration resolved the problem

`PHPIniDir "c:/wamp/bin/php/php5.2.9/"`

So, now that I have that sorted I can install Joomla and start playing – I mean learning.