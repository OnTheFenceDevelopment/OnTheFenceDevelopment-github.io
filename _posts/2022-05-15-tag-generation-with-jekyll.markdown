---
layout: post
title:  'Tag Generation with Jekyll'
date:   2022-05-15 00:00:00
tags:   jekyll github-pages
---
Moving from a CMS like Wordpress to a static website/blog has a lot of advantages but also a number of drawbacks - one of them being the loss of a Search function.

But is this really a deal breaker? I mean, how many times do you think someone will actually use the search box on your blog? Think about it, they've probably reached your blog via a search anyway so they are on the post they want to be on already. Once they've read it, how many will actually stick around to see what else you've written ... I mean, really.

Chances are they will click Back on their browser, return to Google/Bing/Whatever and continue looking for whatever they were looking for when they clicked on the link to your post.

So, I'm not going to lose any sleep over the absence of a Search facility on my blog, but that doesn't mean that I need to throw all sence of navigation out of the window.
<!--more-->

I'm generating this blog using Jeykll which takes regular markdown (if there is such a thing), some HTML templates, CSS and configuration files and produces a static site or pages like the one you are reading right now.

At the top of every post file is what Jekyll calls 'Front Matter' which is basically the posts metadata. In this front matter is a parameter called `tags` which contains a space delimited list of strings that describe the content of the post, e.g. `javascript jquery csharp`.

With these specified for each page, what we need is a way of displaying them on the post and allow the user to quickly navigate to a list of posts that have the same tag specified.

>Disclaimer - as with many things in life and programming, I wasn't the first person to want to do this and this blog is built on the shoulders of others. But that doesn't mean I can just regurgitate what they have previously written and pass it off as my own. So, my solution is heavily based on <a href="https://longqian.me/2017/02/09/github-jekyll-tag" target="_blank">a post by Long Qian</a>.
>That said, if the process of converting my posts to markdown has taught me anything it's that sometimes sites fall off the internet and when they do, any links to them also die. So the rest of this post will go over the solution and call out salient.

**Displaying the Post Tags**\
This is pretty straightforward really assuming you already have a `post.html` template on your `_includes` folder. If you don't then take a look at the <a href='https://jekyllrb.com/docs/themes/#overriding-theme-defaults' target='_blank'>Jekyll documentation</a>.

With that in place, open the file and edit the html, adding the following markup;

{% raw %}
```liquid
<span>[
    {% for tag in page.tags %}
      {% capture tag_name %}{{ tag }}{% endcapture %}      
      <a href="/tag/{{ tag_name }}"><code><nobr>{{ tag_name }}</nobr></code>&nbsp;</a>
    {% endfor %}
  ]</span>
```
{% endraw %}

This will result in a series of links at the top of each post, including this one, but clicking on these will currently result in a 404 error (be as we're expecting that it's fine for now).

Obviously you can style your tag links however you want - it's just HTML and CSS afterall.

**Creating the Tag Pages**\
In the above markup the links are pointing at a `tag` folder which we don't currently have, so we'll need to create it (at the same folder level as your `_config.yml` file).

For now we will manually create a tag markdown file, later we'll script this for Windows and Mac. In the future I'm looking to create a Github Action to do create these in case I forget when I add a new tag.

The filename needs to be the same as the tag it represents, e.g. `github-pages.markdown`. Just like any other file that we want/expect Jekyll to process we need to add some Front Matter to this file with some specific values.

```
---
layout: tagspage
title: "Tag: github-pages"
tag: github-pages
---
```

Starting from the bottom we have the tag name (this follows through from post, through filename and into this parameter). Next is the title which can be free form but this example works for me. Finally we have the layout which we will create next - you can call it what you like but remember to be consistent.

So, onto the tagspage template - in your `_layouts` folder create a file called `tagspage.html` (this is the folder where the `post.html` template that we added the tag markup to resides) and add the following content.

{% highlight liquid linenos %}
{% raw %}
---
layout: default
---
<div class="post">
<h1>Tag: {{ page.tag }}</h1>
<ul>
{% for post in site.tags[page.tag] %}
  <li><a href="{{ post.url }}">{{ post.title }}</a> ({{ post.date | date_to_string }})<br>
    {{ post.description }}
  </li>
{% endfor %}
</ul>
</div>
<hr>
{% endraw %}
{% endhighlight %}

**Collecting the Tags**\
We're almost there - while we have all of the file/folders and templates in place we are missing a crucial piece of the puzzle .... the data.

If you look at the lines 7 to 11 you'll see this is a loop over items in `site.tags` ..... what's that exactly?

Well, this is a list of all the tags used across the site .. and we have to build it because Jekyll won't do this for us.

Create a file called `collecttags.html` in your `_includes` folder and add the following content

{% raw %}
```liquid
{% assign rawtags = "" %}
{% for post in site.posts %}
  {% assign ttags = post.tags | join:'|' | append:'|' %}
  {% assign rawtags = rawtags | append:ttags %}
{% endfor %}
{% assign rawtags = rawtags | split:'|' | sort %}

{% assign site.tags = "" %}
{% for tag in rawtags %}
  {% if tag != "" %}
    {% if tags == "" %}
      {% assign tags = tag | split:'|' %}
    {% endif %}
    {% unless tags contains tag %}
      {% assign tags = tags | join:'|' | append:'|' | append:tag | split:'|' %}
    {% endunless %}
  {% endif %}
{% endfor %}
```
{% endraw %}

This script will iterate over each post in the site and create a list of all the tags they contain. It then iterates over that `rawtags` list to build the `site.tags` list, dropping any duplicate tags so that each only appears once in the list.

Well, it will once it's executed which is acheived by adding it to the `head.html` template in the `_includes` folder (I added it just before the closing head tag)

{% raw %}
```liquid
{% if site.tags != "" %}
  {% include collecttags.html %}
{% endif %}
```
{% endraw %}

This is then used by Jekyll when building pages from our `tags` folder using the `tagspage.html` template.

**Auto Generating the Tag Pages**\
As mentioned above we need to create markdown files in the `tags` folder for each tag we use. 

Now, we can do that manually ourselves and it's no big deal but what if we forget - we add a previously unused tag to a post and don't add the markdown file. The site will still build but if the user click the new tag link on the post they will get a 404 error. Simple as that really.

In Long's post mentioned above he links to a python script to iterate over the files and generates any missing files. Well, I'm more of a Powershell guy so I created the following script to do the same thing:

```powershell
$files = Get-ChildItem ".\_posts"
$option = [System.StringSplitOptions]::RemoveEmptyEntries
foreach ($f in $files) {
    # Open Each File, locate and extract 'tags' from Front Matter if it exists
    foreach ($line in Get-Content $f.FullName) {
        if ($line -match '^tags:.*$') {
            # Tags Specified for Post, split and process
            $tags = $line.split(" ", $option);

            # Ignore the 'tags:' prefix and process the rest
            for ($i = 1; $i -lt $tags.Count; $i++) {
                # Does File exist already?
                $tagpath = 'tag\' + $tags[$i] + '.markdown';
                if (-not(Test-Path -Path $tagpath -PathType Leaf)) {
                    # File doesn't exist - create it
                    try {
                        $null = New-Item -Path $tagpath -Force -ErrorAction Stop
                        $frontMatter = "---`nlayout: tagspage`ntitle: ""Tag: " + $tags[$i] + """`ntag: " + $tags[$i] +"`n---";
                        Set-Content  $tagpath $frontMatter;
                        Write-Host "The file [$tagpath] has been created."
                    }
                    catch {
                        throw $_.Exception.Message
                    }
                }
            }
        }
    }
}
```

Now I could of course forget to run this script and I would be in the same situation as before. However, I'm currently migrating all my posts from Wordpress to Jekyll and adding a lot of new tags so running this script right now creates multiple files as required.

It's working for me right now but I am looking at Github Actions to see if I can automate this whenever I commit and push to Github - then I won't have to remember.