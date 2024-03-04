---
layout: post
title:  'Running Docker Desktop on Apple Silicon'
date:   2024-01-18 00:00:00
tags:   development mac apple-silicon docker
---
Almost a year ago I posted about my [use of Docker to streamline my development SQL instances]({% post_url 2023-02-25-rationalising-my-sql-server-installs-with-docker %}) and since then I've been working quite happily on my aging Mac - until I bought my shiny new Macbook Pro and my instructions didn't result in a runnable container.

Now I'd checked out a lot of things before putting my hand in my pocket and shelling out for the Macbook and I was wondering what I'd done - maybe I'd fallen at the first hurdle and should have just bought a 'regular' Windows laptop instead.

Well, I wasn't having that - no, not at all. 

As with so many problems in technology, I cannot possibly be the first person to have bumped into the, especially as this is an Apple M3 CPU - the 3rd generation of Apple Silicon, surely the early adopters ran into this.

Well, after trawling the internet and going down some blind alleys I managed to get SQL running on Docker on my Macbook Pro, M3 Pro.

> TLDR; Basically you need to install the Apple Rosetta application, make sure you are running the latest version of Docker Desktop and enable the use of Rosetta for x86/amd64 emulation.
<!--more-->

I mentioned above that I've been using Docker so that I could run multiple versions of SQL Server but I am also using it to run a Gitlab instance on my old iMac (running Ubuntu). The draw for me to use Docker was the fact that upgrading was as simple as stopping the container, pulling the new docker image and restarting the image.

But things aren't always as simple as this and sometimes things go wrong and as I'm hosting all my own source code now I don't want to risk losing it all because an upgrade fails.

Yes, I run regular backups and send them to remote storage for safe keeping - but a backup isn't a backup unless you can restore it - so I need to ensure that the latest backup can be successfully restored before I applied spun up the container against the new image.

The process requires me to create a container running the version my iMac is running, restore my backup, pull the new image and spin up the container again to apply the upgrade. I then check that I can login and compare the last commits on a few projects.

With this being a new Mac I installed the latest version of Docker Desktop and pulled the latest Gitlab image - and that's when the trouble started because when I did it was displayed with what appeared to be a warning that the image architecture might be incompatible with that of the host system.

![docker desktop image item with an orange amd64 label](/assets/images/docker-desktop-images-amd64.png)

This isn't something I'd seen before but prior to this shiny new Macbook I was running on Intel CPUs - Mac and Windows. This was something new.

It took s bit of trawling around but the solution was pretty simple in the end:
- Install Apple Rosetta
- Configure my container with a specific environmental variable telling Docker to use Rosetta

The first step is simple enough - open a terminal and run the following:

```bash
softwareupdate --install-rosetta
```

This is obviously a one-time thing but the following environmental variable will need to be applied during the creation of any container that displays the above architecture warning.

<table>
    <tr><th>Variable Name</th><th>Setting</th></tr>
    <tr><td>DOCKER_DEFAULT_PLATFORM</td><td>linux/amd64</td></tr>
</table>

![docker desktop container creation dialog](/assets/images/docker-desktop-amd64-env-var.png)

That's it - click Run and you're good to go.