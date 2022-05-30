---
layout: post
title:  'Online Tool of the Month – unminify.com'
date:   2018-10-26 00:00:00
tags:   online-tool-of-the-month
---
Minification and bundling of Javascript and CSS files is obviously a good idea when you are deploying your websites to production – but if you want to use a third-party, minified, resource and want/need to look at the unminified version – it can be a bit of a pain.

I recently purchased a theme for a website which came as a set of CSS, Javascript and image files. There were a number of pages which demonstrated the theme and it was pretty much what I wanted – but not quite, I needed to make a few very minor changes.
<!--more-->
These changes were limited to styles which specified ‘hero blocks’ with image backgrounds. I didn’t need a block with an aircraft in the background – I needed one with a camper van.

Now I could have simply renamed my images to match the existing assets, but when they are called something like ‘airplane_x500.png‘ I don’t think that’s a great idea. I certainly would not do it in code – create a class file called airplane.cs and implement a camper van inside it!

So, I needed to update the CSS – and herein lies the rub. The CSS file in question was minified (others did have the original version in the bundle – this one did not).

I could have contacted the designer and request the unminified asset but I really didn’t want to go through the hassle of this with no guarantee of receiving the file.

Enter <a href='https://unminify.com/' target='_blank'>Unminify.com</a>, a simple website which does exactly what it says it’s going to to – take minified resources and reverse the minification process.

The UI is pretty simple and self explanatory – simply paste your minified text into the central text area....
![unminify before](/assets/images/unminify_before.png)
... click the Unminify button ...
![unminify after](/assets/images/unminify_after.png)
Job Done 🙂