---
layout: post
title:  'Online Tool of the Month – base64-image.de'
date:   2018-12-23 00:00:00
tags:   online-tool-of-the-month
---
I recently had a need to create HTML email templates for a project which needed to include a couple of images, e.g. the company logo and feature image. I have of course done this in the past and just linked to the required assets on the hosting website – but this time is was different.

This time the website was potentially not accessible from outside of the local intranet and the requirement was to embed the images directly into the message.

One way to do this is to encode the images to a base64 string and use the resulting text, with a `data:image/jpeg;base64,` prefix in the src attribute of the image tag – something like this;

```html
<img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD/4QBoRXh....." />
```

Now all I needed to do was encode the images.
<!--more-->
I could of course have written a quick app to get the image bytes and encode them as a base64 string – but why reinvent the wheel.

A quick Google search took me to <a href='https://www.base64-image.de' target='_blank'>https://www.base64-image.de/</a> where you can simply drag and drop your images and it will generate the base64 string for you – even providing options to copy preformatted text to use in image tags and CSS background urls.

When it comes to using these encoded strings there is something that you should be aware of and that is file size.

I ran into problems with some email clients not rendering properly because the message, with the additional embedded images, was too large. I had to use resize the images a bit and then ensure that I enabled ‘Image Optimisation’ during the encoding process to get them as small as possible without losing too much quality.