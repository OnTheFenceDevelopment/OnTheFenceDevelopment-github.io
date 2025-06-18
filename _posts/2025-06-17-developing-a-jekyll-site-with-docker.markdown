---
layout: post
title:  'Developing a Jekyll Website with Docker'
date:   2025-06-17 00:00:00
tags:   jekyll docker
---
![docker logo](/assets/images/docker_logo.png){:width="220px" style="float:left; margin-right: 10px;"}

Yesterday I spun up Jetbrains Rider, loaded up the Jekyll folder for this very website and prepared to get a blog post out of my head and online ... but this is not that blog post!

No, that post had to go on hold while I battled with error after error as I tried to get the site built and the Jekyll service up and running. Before I knew it, the evening was drawing to a close and I still didn't have the site running locally.

The problem was clear though - dependency issues with Ruby and its Bundler that are core to Jekyll's operation. Something had updated on my MacBook Pro and it had really upset the apple cart.

[![error in Rider terminal when trying to start jekyll server showing what appears to be a dependency error](/assets/images/jekyll-bundler-dependency-error-rider.png)](/assets/images/jekyll-bundler-dependency-error-rider.png){:target='_blank'}

So how was I going to get around that?
<!--more-->

Well, the clue is in the title really - Docker to the rescue ([again]({% post_url 2023-02-25-rationalising-my-sql-server-installs-with-docker %})).

If the issue was down to an update being installed on the Mac then I was clearly not in control of the development environment so even if I managed to get it working this time .... how long would it be before it happened again and burnt another evening?

What I needed was a stable environment, one that I control (as far as possible) and have some confidence that I could replicate it should I need to fallback to a Windows system.

That's what Docker provides - the ability to create systems that run only the required versions of the required components and nothing else. Don't need a database? Then don't install one. Don't need a webserver? Then don't install one ... you get the idea.

For my Jekyll solution all I needed to do was create two simple text files with a handful of commands and I was off to the races!

Now, this isn't a post about the ins and outs of Docker, there are plenty of posts online written by people with far more knowledge than I have on the subject.

That said, at a high level there are two primary components to a Docker based solution; an Image and a Container based on that Image. The two files I mention above relate to each of those components.

## The Dockerfile
The Dockerfile is where we define what we need included in the Image and as Jekyll is built on top of Ruby that seems to be a good foundation for our image, so create a new text file called Dockerfile in the root Jekyll folder, i.e. the same folder as the `_config.yml` file, and add the following:

```bash
FROM ruby:3.1

RUN apt-get update && apt-get install -y build-essential nodejs npm

WORKDIR /srv/jekyll

RUN gem install bundler jekyll

EXPOSE 4000

```

From top to bottom the file specifies that the image will be based on version 3.1 of the Ruby image. We then install some required packages, `build-essential`, `nodejs` and `npm`.
Next we set the Working Directory, run the `gem` comment to install `jekyll` and the `bundler` and finally specify the port that `jekyll` will be served on.

# The docker-compose.yml file
This is where we configure the container and by placing it in the same root folder as the Dockerfile we can simplify things a little bit, e.g. we can now use a simple `.` for the build property which will tell Docker to use the Dockerfile in this current directory (the one we created above).
We can use a similar shortcut to define the same folder as the one to bind the volume to.

```bash
services:
  jekyll:
    container_name: jekyll-dev
    build: .
    volumes:
      - .:/srv/jekyll
    ports:
      - "4000:4000"
    working_dir: /srv/jekyll
    command: sh -c "bundle install && bundle exec jekyll serve --host 0.0.0.0 --watch"
    
```

The host to container name and port mapping is also defined along with the working directory and that's about it - well, all we need anyway. Finally we define the command to run on the container and this will build the website, start the Jekyll server and watch for changes within the working directory (triggering a rebuild as and when they are detected).

> I haven't managed to get the `livereload` option to work yet but will investigate this further as it's a useful thing to have. For now the `watch` option will suffice for me.

Now all we need to do is start everything up and all we need to do for that is open a terminal (or command window), navigate to the folder containing these two files and enter the following command:

```bash
docker-compose up -d
```

This will load and execute the commands in the document-compose.yml file which will in turn load the Dockerfile and build the Docker image if required. The `-d` will detach the terminal from the process we just started in order to run the container. This just means that you could close the terminal or continue using it without affecting the running process.

It might take a few seconds, or even minutes depending on the size of the site being built, but we will be able to open a browser and navigate to http://localhost:4000 which should bring up the website.

[![the home page of this website running on docker and showing this post at the top of the list](/assets/images/jekyll-docker-website.png)](/assets/images/jekyll-docker-website.png){:target='_blank'}

As I'm on a Mac I'm using Jetbrains Rider and it auto-saves as I go so even as I'm writing this post my new Docker container will be periodically rebuilding the site. When I'm done all I need to do is refresh my browser (and maybe wait for the last rebuild and refresh again) to see the post in all it's glory.

When I've finished what I'm doing I just need to run the following command in the terminal and the Docker container will be spun down and the Image deleted - we don't need it anymore.

```bash
docker-compose down
```

The good thing about this is that with these two text files committed to source control I can pull everything down to a different computer, and as long as it's running Docker I can run the Docker Compose command to build the image and spin up a container without having to worry about any dependency issues.

Well, that's the hope anyway.