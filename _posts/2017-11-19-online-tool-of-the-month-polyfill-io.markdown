---
layout: post
title:  'Online Tool of the Month – Polyfill.io'
date:   2017-11-19 00:00:00
tags:   online-tool-of-the-month web-development
---
Browser compatibility is a pain – and that’s a fact. But when your client says, “we need to support IE9 and upwards” you can feel the dread come over you.

Well, fear not as help is at hand in the form of <a href='https://polyfill.io/' target='_blank'>Polyfill.io</a>, a CDN hosted service which will serve up a custom set of polyfills to fill those functionality  gaps in whatever browser makes the call.

![polyfill.io website](/assets/images/polyfill-io.png)
<!--more-->

Need some of those ‘Math’ or ‘console’ functions that are so readily available in non-IE browsers? Well, Polyfill.io has your back.

Add a single line of code to your mark up and voila – you’re good to go. Remember, before you start panicking about large request sizes the CDN will tailor the response to only those features that the current browser is lacking, which is pretty neat.

From the feature list on their site it is easy to see what is included naively in each browser and what can be polyfilled.

But there’s more – what if you only wanted a single feature, say ‘Function.name’, in IE9/10&11. Even though the service will return a tailored set of polyfills it is possible to view the detection and polyfill scripts for any feature by clicking on the ‘hamburger’ menu to the right of the feature – this takes you to the appropriate location in the Github repo (yep, this is all open source stuff).

The downside to using a CDN though is that if it goes down (and it did once for a client of mine) then it could leave your site somewhat ‘hobbled’ depending on the features you were relying on