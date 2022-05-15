---
layout: post
title:  'Making Progress with Static Blog'
date:   2022-05-13 00:00:00
tags:   github-pages jekyll
---
Moving from Wordpress to a Github Pages static blog has been going pretty well with over 30 posts migrated across. This may not sounds like a lot but I've been making my way up the learning curve, configuring and experimenting with Jekyll (the static site generator) and getting my Visual Studio Code workspace working well.

I now have the output almost as I want it, I still want/need pagination and a tag cloud, but these things will come in time.

<!--more-->
On the workspace front I have the Visual Studio Code configured with some useful code snippets to speed things along, the launch.json file is configured to build and serve the site and to rebuild it whenever I save a change and I have a Powershell script to generate the required files for Jekyll to wire up my tags.

The process has not been without it's wrinkles though; I had url generation issues, spurious github build action failures and am still frustrated by pagination. But none of the really matters now that I have everything wired up.

**Url Issues:**\
Once I had everything working locally and had the first half dozen or so posts sorted I pushed the files to Github for building/publishing. Clicking on the hosted site I was frustrated to see that clicking many of the links resulted in a 404 error while locally they worked just fine. What was going on?

As it turned out I was making <a href='https://mademistakes.com/mastering-jekyll/site-url-baseurl' target='_blank'>a common mistake with the url and baseurl settings</a>. In short, I didn't need to set the `baseurl` setting at all as this is for when the site is being hosted in a sub-directory, e.g. /blog. I was hosting at the root so this wasn't required at all.

As for the `site.url` setting, well I also didn't need to set this one either. By default when I build and run the site using `jekyll serve` it defaults to `http://127.0.0.1:4000` and when I push it to Github it sets it based on the repository url (or a custom domain if one is set). So remove these settings entirely resolved my issues. It took a while to work out but now that I know, I don't need to worry anymore.

I'll leave it there for now - next post will be on tag generation.