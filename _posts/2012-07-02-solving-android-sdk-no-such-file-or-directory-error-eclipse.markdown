---
layout: post
title:  'Solving Android SDK ‘No Such File or Directory’ error in Eclipse'
date:   2012-07-02 00:00:00
tags:   android sdk eclipse
---
I’ve hit this problem a few times now but this time I should probably write it down for my own sanity. Over the weekend I upgraded to Mint 13 (which is brilliant by the way) and because my laptop is running 6GB of RAM I opted for the 64-bit version of the distro to make full use of it.

Having Eclipse and the Android SDK ‘installed’ on my separate **/home** partition I didn’t need to bother reinstalling everything (but my [blog post on how to do it still holds]({% post_url 2010-05-29-installing-eclipse-and-android-sdk-ubuntu-10041010 %})) so assumed I was good to go – but I was wrong.
<!--more-->
Opening up Eclipse it all seemed OK until I switched to the DDMS perspective where I was greeted with the following error:

![eclipse error message](/assets/images/eclipse_file_not_found_error.png)

No Such File or Directory – what the hell? I checked and double checked but could not understand why this error was coming up.

Then, in a flash of Google, a search result caught my eye that sparked a memory from the last time I paved my system and installed a new version of Linux;

>I’m running a 64-bit OS but the Android SDK is 32-bit.

While this is not a major problem there are some 32-bit libraries that are required by the SDK that are not present on a 64-bit install.

Once I remembered what I was looking for I quickly found the required package and installed it with the following command:

```
sudo apt-get install ia32-libs
```

Restarting Ecplise and the troublesome error message was no more. I ran up a couple of my projects just to be sure and everything seems to be fine now – I just need to remember that next time, maybe the act of writing it down will help.