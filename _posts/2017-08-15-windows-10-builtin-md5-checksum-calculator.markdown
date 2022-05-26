---
layout: post
title:  'Windows 10 (and 7) Built-In MD5 Checksum Calculator'
date:   2017-08-15 00:00:00
tags:   windows-10 utilities
---
I recently paved my main development workstation after it started misbehaving (slow start up, some applications not opening consistently etc) and am trying to be careful about what I install on it going forward.

Previously I had all manner of applications, games (including Steam) and utilities installed and the chances of finding what was causing the problems was pretty remote. There could of course be multiple culprits.

Today I needed to install MySQL Workbench so I headed off to download it and noticed the MD5 checksum beneath the link. Now, I don’t always check these and maybe this is why my workstation ended up in a bit of a mess. But with a view to keeping this system as clean as I can I decided to make a point going forward of checking these checksums when they are available.
<!--more-->
![my sql workbench ui](/assets/images/mysql-workbench-download.png)

The “problem” is which utility do you use to calculate the checksum of the downloaded file?

If you Google for ‘MD5 checker’ you will see a number of utilities and while I have no reason to doubt the integrity of any of these I stopped short of installing any of them.

Obviously each download was accompanied by it’s MD5 checksum so that I could verify the file but after freely installing all manner of utilities in the past I was a little bit wary this time around.

Now, MD5 is not a new thing and you would think that Windows 10 would have some form of utility built in that would calculate the hash – and there is. Apparently it is also available in Windows 7 but I no longer have any systems running Win7 so I cannot verify that.

Open a command prompt and enter the following:
```
CertUtil -hashfile <path to file> MD5
```
Depending on the size of the file it may take a few seconds to run the calculation but if successful the MD5 hash will be displayed as below.

![cert util output](/assets/images/cert-util-output.png)

It is also possible to generate checksums for other hash algorithms by replacing the MD5 parameter used above with any of the following (note that if you don’t specify a value then SHA1 is used by default):

- MD2
- MD4
- MD5
- SHA1
- SHA256
- SHA384
- SHA512

<br>
So, if all you need is to determine the checksum of a downloaded file then there really isn’t any reason to install yet another utility to do so.