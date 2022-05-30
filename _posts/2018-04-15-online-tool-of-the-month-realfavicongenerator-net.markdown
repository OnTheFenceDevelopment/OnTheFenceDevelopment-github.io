---
layout: post
title:  'Online Tool of the Month – realfavicongenerator.net'
date:   2018-04-15 00:00:00
tags:   online-tool-of-the-month utilities web-development
---
![favicon plugin](/assets/images/realfavicon-plugin.webp){:style="float: left; padding-right: 10px;"}
Following the migration of this website to WordPress I installed the <a href='https://wordpress.org/plugins/redirection/' target='_blank'>‘redirection’ plugin</a> in an effort to handle the difference in the url structure used by Squarespace (my previous host/platform). This plugin allows me to redirect users using the old Url to the correct content and also see any 404 errors for resources I may have missed.

While reviewing this 404 log I noticed a few rather odd entries, such as

- apple-touch-icon-precomposed.png and
- apple-touch-icon.png.

<br>
Knowing that I never had such content on the site before I did a bit of Googling and found that these are favicons (the little square logos that reside on your browser tabs) that Apple’s Safari browser will attempt to load along with your page.

Now that I knew what the problem was, how do i fix it? I mean, I had a favicon on the site – why couldn’t Safari just use that one?
<!--more-->
After a bit more searching I found the <a href='https://realfavicongenerator.net/' target='_blank'>Real Favicon Generator</a> site where I was able to enter the Url of my site and it would generate a report on what it found (or didn’t find as the case maybe).

![site checker](/assets/images/realfavicon-checker.webp)

This is actually for another site I manage but the result is similar to when I ran it on this site

Now, that’s a lot of red but fear not – help is at hand. As the sites name eludes, it is also able to generate the appropriate icons as well. But how will I get these into WordPress – it only has the facility to allow me to specify a single favicon file.

Well – as well as the testing of the site and generation of the icons, there is also a WordPress plugin which makes things super easy.

With the plugin installed, navigate to the Appearance menu and select ‘Favicon’.

Select your desired image, they recommend 260x260px but mine was 150x150px and it looks fine for my purposes.

Click Generate and you will be taken to an editor page which allows you to tweak a few colours and settings – I didn’t bother with this, I just clicked the ‘Generate your Favicons and HTML code’ button at the bottom of the page.

And that’s it – I re-scanned the site and (unsurprisingly enough) everything was now green – and the 404 errors are no longer appearing in the redirection logs.

![plugin configuration](/assets/images/realfavicon-configuration.webp)
![asset generation](/assets/images/realfavicon-generate.webp)