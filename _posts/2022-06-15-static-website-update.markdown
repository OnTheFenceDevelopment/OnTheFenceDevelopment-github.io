---
layout: post
title:  'Static Website Update'
date:   2022-06-15 00:00:00
tags:   github-pages jekyll
---
Well today is a milestone in the migration of this blog from Wordpress to Github Pages - I've (hopefully) transferred all posts as well as created the additional pages such as About and those for the mobile apps.

The process has been pretty eye opening, reading the 160+ posts dating back to 2009, copy/pasting the content from my browser into Visual Studio code, saving the images and downloads and reformatting everything into markdown.

I've split the process across my Windows 10, Mac and Linux devices with very little friction. Creating snippets in Visual Studio code to allow me to quick add markup elements for images, downloads and the Jekyll front matter section at the head of every post has sped up the process no end.
<!--more-->

### So what's left to do?

Although I'm typing this on 15th June 2022 the chances are that you won't read this until August. 

Why?

Well, there are still a few things that need to be sorted before I can flip the switch so for now the Wordpress blog remains the face of On The Fence Development.

The things I need (want?) to resolve are:
- Pagination
    - Currently the home page contains all of the posts ... right back to 2009 .. and while that's not a massive proble, in itself I'd rather make used of a page footer for things like social media links etc so that needs to be a lot shorter.
- Styling
    - I'm still not 100% happy with the layout etc. I'm not a designer by any stretch of the imagination and while I don't want anything snazzy I at least want it to look modern.
- Search and Tag Cloud
    - I'm not quite sure how useful a Search will be - the Wordpress analytics shows that most visitors reach any particular post via something like Google so do I really, honestly need to provide a search facility? Probably not .. but I'm a little old school.
    - As for the Tag Cloud, well I've gone through the effort of adding tags to each post I may as well make use of them.
- Comments
    - I'm still undecided about this. Over the years a number of comments have been submitted (and largely responded to) but as the blog is now a static website there is no provision for commenting.
    - According to the Akismet plugin on the Wordpress instance of the blog it was blocking a decent amount of comment spam so I need to bear this in mind
    - Wondering whether I could use Jekyll data files to import existing comments (there's some good content in there) and then just ask visitors to leave comments via Twitter (or Mastodon of course)