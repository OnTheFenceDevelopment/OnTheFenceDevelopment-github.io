---
layout: post
title:  'Docker Desktop issues with Gitlab on Mac'
date:   2023-11-01 00:00:00
tags:   mac docker gitlab
---
A little while ago I installed Ubuntu on my aging iMac and subsequently installed Gitlab on it with a view to bring as much of my source code on premise as possible.

As frequently happens, a proof of concept investigation soon becomes something you rely on but it still needs some of the basics sorting out - in the case of my Gitlab instance this means docker image upgrades and a backup/restore process.

I have to say I was both surprised and pleased to see the frequency of the docker image updates but so far I've not installed any of them as I need to investigate and verify that I can backup and restore everything in the event that an image update goes wrong or I have a hardware failure of some sort.

With the iMac running my 'production' instance and Gitlab not apparently supporting a Docker installation on Windows that only leaves my MacBook Pro (MBP) to perform my investigations.

The first thing was to install and configure Gitlab via Docker on the MBP .... that should be a walk in the park yes? 

Well, as I'm writing about it you can correctly assume that wasn't the case.
<!--more-->

I already have Docker Desktop running on the MBP so once I'd identified the correct Gitlab image to fetch, the community edition of 16.2.4, I updated the same script I use on the iMac to download the image, configure volumes on the local filesystem and spin up a new container.

```bash
docker run -d -p 22:22 -p 443:443 -p 80:80 \
--name gitlab \
--restart unless-stopped \
--hostname localhost \
--shm-size 1024m \
-v /Users/dave/gitlab/config:/etc/gitlab \
-v /Users/dave/gitlab/logs:/var/log/gitlab \
-v /Users/dave/gitlab/data:/var/opt/gitlab \
gitlab/gitlab-ce:16.2.4-ce.0
```

Now, when the container first spins up it will perform the installation and configuration of Gitlab and all the additional components and services such as postgresql, redis, nginx etc and this can take a bit of time. Add to that the fact that even when starting a configured container it can take a while for everything to start up (I'm talking maybe 5 minutes or so on the older hardware I'm using) so i was prepared for a bit of a wait ... but it soon became clear that there was a problem and the `restart` option in the above script had put the process into a bit of a loop.

Removing the `restart` option resolved the looping, but of course the container still failed to start, although I could now start to get a handle on what was happening.

Looking at the container logs in Docker Desktop I could see that there was a problem starting the postgresql database.

```
2023-10-31_19:06:45.43696 LOG:  starting PostgreSQL 13.11 on x86_64-pc-linux-gnu, compiled by gcc (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0, 64-bit
2023-10-31_19:06:45.43918 LOG:  could not bind Unix address "/var/opt/gitlab/postgresql/.s.PGSQL.5432": Operation not permitted
2023-10-31_19:06:45.43952 HINT:  Is another postmaster already running on port 5432? If not, remove socket file "/var/opt/gitlab/postgresql/.s.PGSQL.5432" and retry.
2023-10-31_19:06:45.43992 WARNING:  could not create Unix-domain socket in directory "/var/opt/gitlab/postgresql"
2023-10-31_19:06:45.44039 FATAL:  could not create any Unix-domain sockets
2023-10-31_19:06:45.44342 LOG:  database system is shut down
```

I did previously have postgresql installed on the MBP when I was working with a previous client and wondered of the error was pointing to a port clash. However, as I had suspected, I had removed this to free up space when my engagement with the client concluded.

I also tried updating permissions on the folders I was using to mount the container volume to but this made no difference. The only way I was able to get the container to start up correctly was to remove the options to bind the volumes linking container folders to host folders. If I did this everything just worked.

I trawled the internet using the error message but didn't find anything even remotely relevant ... until I found <a href='https://github.com/sameersbn/docker-gitlab/issues/2818#issuecomment-1740375553' target='_blank'>this comment in a github issue thread</a>

Basically the comment says that Docker Desktop has recently changed the default technology used fo file sharing from gRPC Fuse to VirtioFS and that changing it back might just fix the problem. 

Now that mae sense - bearing in mind that dropping the volume configuration resolved the issue, this change within Docker Desktop itself could be my problem.

Well, there was only one way to find out - I duly opened up the Settings page in Docker Desktop, made the suggested changed and restarted the app.

![docker desktop settings page with file sharing implementation options highlighted](/assets/images/docker-settings.png)

I deleted the last failed container and ran the script again .... and just like that (after about 10 minutes) I was able to login to my fresh new instance of Gitlab.

![gitlab login page](/assets/images/gitlab-login.png)

So - with the easy bit out of the way, now I can look at restoring a backup I took from the iMac instance.