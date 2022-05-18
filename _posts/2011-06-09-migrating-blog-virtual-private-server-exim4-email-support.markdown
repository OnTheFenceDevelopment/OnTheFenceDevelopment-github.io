---
layout: post
title:  'Migrating Blog to Virtual Private Server with Exim4 email support'
date:   2011-06-09 00:00:00
tags:   vps exim4
---
In my previous post I explained that I was migrating this blog from a shared server provided by <a href='http://www.5quidhost.co.uk/' target='_blank'>5quidhosting</a> onto a virtual private server (VPS) provided by <a href='http://www.bhost.net/' target='_blank'>BHost</a>. In theory this should have been quite straightforward but in practice, and bearing in mind I’m a developer and not an infrastructure boffin, there was a lot more to is that just moving zip files around and running a few commands.
<!--more-->
That said, that’s exactly where I started off – I accessed my 5quidhosting reseller control panel and backed up my home directory for this blog and the MySQL database associated with it. After creating a suitable folder within /var/www I uploaded (via scp) the home directory backup and extracted the public_html folder into the newly created location. Next I created a new database in MySQL, created a new user and then GRANTed the appropriate permissions to that user for that database. Finally, I uploaded the backup of the MySQL database (actually just a SQL script) and read it into the new database.

```sql
CREATE DATABASE onthefence;
CREATE USER 'onthefence'@'localhost' IDENTIFIED BY 'secret_password';
GRANT ALL PRIVILEGES ON onthefence.* TO 'onthefence'@'localhost';
```

Finally I opened the wp-config.php file and changed the DB_NAME, DB_USER and DB_PASSWORD values to the ones I used above.

At this point I was able to access the blog using a url like this: http://78.129.251.119/blog. But that’s not really very nice so a little bit of Apache tweaking was called for. I added this to the top of `/etc/apache2/sites-enabled/000-default`

```
ServerName onthefencedevelopment.com
ServerAlias *.onthefencedevelopment.com
DocumentRoot /var/www/blog
        Options FollowSymLinks
        AllowOverride None
```

Now I could load up the blog by navigating to http://78.129.251.119 (no path to the actual sub-folder). While the home page was displayed fine when I clicked on any of the posts I was taken to the live blog rather than navigating to the page on the VPS instance. Why? Well because when WordPress saves some of it’s data it saves that fully qualified domain name too, i.e. the full path including the **http://www.onthefencedevelopment.com** part. So I’d gone as far as I could go without actually breaking the link to 5quidhosting. By resetting the nameservers I’d essentially go live with the VPS instance of the blog. 

Safe in the knowledge that I could always repoint the nameservers back to 5quidhosting, I bit the bullet and did it.

With the nameservers reset to my registrars defaults I was able to create two A records in my DNS settings. An A record is really what maps a domain, e.g. onthefencedevelopment.com, to an IP address. So why two records? Well, initially I just created one for ‘www.onthefencedevelopment.com’ and after a short wait (no where near the 72 hours quoted by many a sys admin) this took effect – but the blog itself failed to load. The reason was that for some reason I’d configured it without the leading www. Not withstanding the arguments about which is right it’s probably prudent to have the two variants configured, i.e. http://www.onthefencedevelopment.com and just onthefencedevelopment.com, both pointing to the same IP address. A short wait later and bingo the blog was up and running – finished yes? Erm, actually no.

As mentioned in my previous post, 5quidhosting also provided email hosting. This was not only my Inbox for the domain but also my outgoing email server. The new blog did not have anyway of sending out email notifications and until it did I could not really consider this instance to be ready for service.

I’d already decided to switch my email hosting over to Google Apps and will blog about that separately but even with that sorted and my mailboxes accessible via the GMail interface I was still no closer to getting the server configured.

I’ve blogged about [sending emails from the command line on an Ubuntu server]({% post_url 2009-08-25-sending-email-command-line-ubuntu-server %}) already so surely it was laughing – my blog had come to it’s own rescue. Well, not quite. In the previous configuration I’d used a package called nullmailer which, paired with the mutt email client, worked well for me using my previous outgoing email server (provided by 5quidhosting). The problem is that the smtp servers provided by Google Apps required a level of encryption that nullmailer did not support. But all was not lost because, as usual in the open source world, there is normally numerous solutions to a problem. In this instance the alternative came in the form of <a href='http://www.exim.org/' target='_blank'>Exim4</a>. Exim4 provides the support that the Google Apps server required and replaced nullmailer in the solution.


```
sudo apt-get install exim4 mutt
```

With the packages installed I followed <a href='http://wiki.debian.org/GmailAndExim4' target='_blank'>the process defined on the Debian Wiki</a> (Ubuntu is Debian based after all) and within about 10 minutes I was able to run the following command to get mutt to send me a test message:

```
echo "This is a test" | mutt -s "Test Message" nobody@nowhere.com
```

A final test was to get the blog to send me an email – which I did by logging out and requesting a password reset, which duly arrived a few minutes later.