---
layout: post
title:  'Installing AtMailOpen Webmail Client on Hosted Server'
date:   2010-01-02 00:00:00
tags:   
---
I have a reseller account with my hosting provider which allows me to manage multiple domains (this being one of them) and also provides email services for each of them. The thing is that the two webmail clients it provides, Horde and SquirrelMail are [frankly] clunky and long winded to access – the latter being an issue with the implementation rather than the applications themselves.

To login I need to provide a full email address as the username (any you can see how long this domain name is) and a password. Then I’m presented with the option of loading Horde or SquirrelMail as well as enabling Auto Load the selected application. If I select SquirrelMail then I’m taken directly to my Inbox but if I select Horde then I’m presented with a ‘language selection’ screen which also contains a Login button. While SquirrelMail is a basic email client Horde also has a Calendar, Notes, Tasks and a News Reader – but they both look a little dated.

Now while I can handle the login process and live with dated interface it’s not something I would like to provide to other users – I’m just worried that I will get phone call after phone call about how to use the applications and complaints about the user experience.

I have a domain which will soon be hosting a WordPress blog that my girlfriends daughter will be using to keep in touch while she is working abroad for six months before starting her college studies. I didn’t feel comfortable giving her the standard email client offerings so decided to configure AtMailOpen instead.

After downloading the latest version [1.03] from <a href="https://www.atmail.com" target="_blank">https://www.atmail.com/</a>

I used the file manager in the control panel provided by my Hosting provider to upload it to a new /mail folder in the root of the website file system. During the Install process (see below) I was unsure about the MySQL user it was going to use so I then used the control panel tools to create a MySQL database called ‘atmail’ with a user called ‘mailusr’ with full access to the new database.

Navigating to **http:///mail** kicked off the installation process which was pretty straightforward if you know the IP Address of your database and the appropriate user credential. However, the PHP configuration on the server appeared to be incompatible with AtMailOpen’s requirements – ‘magic_quotes’ was turned but but apparently it shouldn’t be for the application to work properly. Now this is a shared server and I don’t have access to the php.ini file to make the necessary adjustments or the level of knowledge to override the settings for my site, although I’ll be looking into this soon. The good thing was that this did not seem to prevent the installation from completing ‘successfully’.

Once the installation was complete navigating to **http:///mail** brought up the email interface which was greyed out with a modal lightbox on the foreground requesting the login details – but this wasn’t quite as I wanted it. The username was to be entered in the form of an email address but split into user and domain, i.e. ‘admin’ in one field and ‘domain.com’ in the other, which [in my opinion] is a bit of a user experience failure. In addition to this the mail server, i.e. mail.domain.com, was also requested and there was a language and protocol dropdowns as well.

![original login screen]({{ '/assets/images/atmail_original_login_screen.png' | relative_url }})

Not great – but as this is Open Source it was simple to modify the login page to set the default domain and mail server – leaving just the username and password to be entered (the language and protocol can just be left at their default values).

The file of interest here is //html/login-light.html and is just a simple html file containing regular input controls in a table layout. I replaced the domain and mail server textboxes with hidden input fields with the appropriate id values, i.e. the same as the ones I had removed.

The result is a simpler login process to a cleaner, more modern email client – now that’s more like it.

![updated login screem]({{ '/assets/images/atmail-open-login-mozilla-firefox-modified.png' | relative_url}})

Now I just have to finish the WordPress plugins before she jets off to the sun – apparently I have about 10 weeks and will expect a running countdown during that time 😉