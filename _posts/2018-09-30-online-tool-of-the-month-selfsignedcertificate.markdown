---
layout: post
title:  'Online Tool of the Month – SelfSignedCertificate'
date:   2018-09-30 00:00:00
tags:   online-tool-of-the-month web-development
---
![https address in browser address bar](/assets/images/https.png){:style="float: left; padding-right: 10px;"}
In this day and age everything needs to be encrypted to prevent nefarious access to our data. Whether it’s our banking or medical records, our online email inboxes or our browsing and searching habits.

So, when developing websites or APIs I always start with an SSL enabled configuration – and in Visual Studio that’s a pretty easy thing to do, it’s just a checkbox really.

When deploying websites to production servers I, like millions of others, use <a href='https://letsencrypt.org/' target='_blank'>LetsEncrypt</a> to generate and renew my SSL certificates.

But what about that gap between Development and Production? I am of course talking about ‘Test Servers’.

I’m currently working on a few ASP.NET Core projects that will ultimately be deployed to Linux servers and in order to test this type of deployment I normally like to use a Virtual Machine (VM). This give me good flexibility and allows me to deploy to locally hosted systems with the ability to easily rollback configuration changes etc through the use of snapshots.

But what about the SSL certificate? I can’t use LetsEncrypt because the VM won’t be externally accessible for their system to interogate and validate. What I need is a Self Signed Certficate that I can install on my development system and the VM.
<!--more-->
With a Self Signed Certificate in place I can deploy and test my software using SSL thus ensuring that the Test environment matches Production and that there are no sneaky bugs loitering around.

Now – you can use a Powershell command like this:
```
New-SelfSignedCertificate -DnsName "www.onthefencedevelopment.com" -CertStoreLocation "cert:LocalMachineMy"
```
Or an OpenSSL command like this (if you have OpenSSL installed):
```
openssl req -x509 -newkey rsa:4096 -sha256 -keyout mysecurecerti.key -out mysecurecertificate.crt -subj “/CN=onthefencedevelopment.com” -days 600
```
But do you really want to have to look up all the command line parameters every time you need a certificate? Of course not.

Enter the <a href='http://www.selfsignedcertificate.com/' target='_blank'>Self Signed Certificate Generator</a> (<a href='https://www.selfsignedcertificate.com/' target='_blank'>https://www.selfsignedcertificate.com/</a>) which will generate a suitable certificate with a single click on the mouse.

Simply navigate to <a href='https://www.selfsignedcertificate.com/' target='_blank'>https://www.selfsignedcertificate.com</a> and enter the domain you want to generate the certificate for and click the big green Generate button.

![self signed certificate generator website](/assets/images/self_signed_1.png)

The tool will then display a page allowing you to download the certificate and key files as well as providing additional information about configuring the Apache web server to use the new certificate and how to generate the same certificate from the command line (if you really wanted to).

![self signed certificate geneated](/assets/images/self_signed_2.png)

Now, assuming that you have configured your system recognise the domain, e.g. <a href='https://support.rackspace.com/how-to/modify-your-hosts-file/' target='_blank'>edited your hosts file</a>, and even though your web browser will complain that it cannot verify the origin of the certificate you should be able to navigate to your website using HTTPS, e.g. **https://mytestsite.onthefencedevelopment.com**, and it should work just fine.

If you really wanted to keep your browser happy you can export the certificate via the browser and import it into your local certificate store. There are plenty of tutorials out there on how to do this but <a href='https://www.nullalo.com/en/chrome-how-to-install-self-signed-ssl-certificates/' target='_blank'>this one</a> is as good as any other I’ve found.

So there you have it – generating Self Signed Certificates the easy way.