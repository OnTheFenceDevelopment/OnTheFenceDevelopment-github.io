---
layout: post
title:  'Online Tool of the Month – MakeAppIcon'
date:   2018-07-23 00:00:00
tags:   online-tool-of-the-month xamarin mobile-development
---
I’ve been developing a couple of Xamarin applications recently and while the default application icons are better than nothing you will of course need to replace these with custom graphics before going live.

Now I’m no designer so I’ve used <a href='https://www.fiverr.com/' target='_blank'>Fiverr</a> to find suitable resources for a number of previous projects (websites, logos and menu icons) and have done so for these mobile apps. In return for about £10 I received nice, clean icon designs which I’d never have been able to put together myself – £10 well spent in my opinion as I can spend the time coding instead 🙂
<!--more-->
Anyway, having the design is one thing – creating the required assets for each platform is another. Android and iOS both require numerous versions of the image with specific dimensions. Android requires these to be placed in a specific folder structure while iOS requires specific file name formats for the assets to be used correctly.

Creating these manually is a bit of a pain and time consuming – surely there must be an easier way!

Enter <a href='https://makeappicon.com/' target='_blank'>MakeAppIcon</a> which makes creating these assets a breeze. Assuming you have a suitable source file, I use a 1024×1024 png file, this handy tool will create all the possible permutations required for Android and iOS – many of these you may not need but at least you have them if you need them.

When you goto the site it’s not that easy to see what you need to do – there are ads for their paid products and the free service does not jump out at you. Currently you need to turn your attention to the panel with the toaster.

![make app icon website](/assets/images/make_app_icon.png)

Select your source image and it will start to process it – which can take a few minutes (this is a free service remember). When it has finished you will be asked for your email address so that it can send you your icons.

Now, I normally don’t like doing this but on this occasion I decided to go ahead – and I can confirm that I’ve not received any SPAM etc as a result (not even to push their paid products!).

After a few minutes an email will arrive containing icons from ldpi to xxxhdpi for Android and every size for iOS from 20×20 to 83.5×83.5 (@1x, @2x and @3x as appropriate). There’s even Play Store and iTunes artwork.

All you have to do now is import them into your project and your are good to go 🙂