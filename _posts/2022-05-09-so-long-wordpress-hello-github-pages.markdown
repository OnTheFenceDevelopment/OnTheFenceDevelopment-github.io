---
layout: post
title:  'So long Wordpress, Hello Github Pages'
date:   2022-05-09 00:00:00
tags:   wordpress github github-pages hosting
---
Over the years I have used many different platforms to serve up this blog including, Wordpress, Joomla!, Drupal and SquareSpace. At the time of writing I'm hosting it on Wordpress.com (using Wordpress obviously).

The blog started live as an aide memoire for myself so that I could save myself the time trawling the Internet when I'd managed to resolve some issue or other. When I branched out as an Independant Contractor I extended it to become my company website giving me a web presence allowing clients to see what I've been working on.

After nine years of contracting and as a result of the Covid-19 pandemic essentially closing down the market here in the UK I decided to return to 'normal' employment so the site reverted back to the blog is started out as.

Now, when I was contracting it was my company that was paying wordpress.com £240/yr for the Business Plan, which I needed due to a handful of plugins I was using. However, what with one thing or another I forgot about this and ended up paying it myself when it renewed after I'd reverted it to being a simple blog. Not the end of the world but basically money I didn't really need to spend.

With that in mind I decided to contact Wordpress.com about downgrading the site to the Personal plan so that I could save a bit of cash (I have another personal blog on that plan costing me just £37/yr) - and that's where the 'fun' started.
<!--more-->
Using the online chat I found out that Wordpress.com had restructured their plans and there was no Personal plan to downgrade to (or any Business plan that I wanted to downgrade from) - only a Pro Plan (£15/mth - billed annually @ £180/yr) or a Free Plan (which is obviously free but does appear to inject ads into your site). 

Neither of these plans was particularly appealing and I did't want to go down the self-hosted route again so I reached out to the Twitterverse asking about alternatives and received a very interesting response;

>How important is it to be a Wordpress site?  Can you re-write to a Static Web app, such as #dotnet #blazor?  They are currently free to host on #Azure, and good to learn.\
-- @GeorgeLeithead

Now that got me thinking - taking into account that it was just a blog now, did I really need to use something like Wordpress? I mean, I'm a developer, I understand HTML etc, why can't I just serve up static pages? How hard could that be?

I mentioned this to the Tech Lead at work and he mentioned Github Pages which offers free hosting to static websites and supports a tool called Jeykll which can turn Markdown into HTML to produce a perfectly adequate blog site.

George from Twitter kindly provided a link to his repo for the BlazorBlog project which is currently a proof of concept (I'm sure he won't mind me describing it as so) which will need a bit of work for me to be able to export my Wordpress blog and generate a suitable static site for Azure.

So which do I use, Azure or Github? Well, as I have a couple of blogs on the go, this one for techie stuff and another for my personal thougths and rants, I'm thinking I can use both - this is On The Fence Development remember ;-)

Because this blog has a lot more images and code snippets requiring syntax highlighting etc I'm using Visual Studio Code to write this post using Markdown with Jekyll to generate the post pages etc.

I'm currently publishing this blog to the <a href="https://onthefencedevelopment.github.io/OnTheFenceDevelopment-github.io" target="_blank">built-in Github Pages url</a> but will be repointing the <a href="https://www.onthefencedevelopment.com" target="_blank">On The Fence Development</a> domain here in due course.

I'll be blogging about my progress with both options and 