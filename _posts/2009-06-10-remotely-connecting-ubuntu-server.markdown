---
layout: post
title:  'Remotely Connecting to Ubuntu Server'
date:   2009-06-10 00:00:00
tags:   linux ubuntu
---
In a previous post I managed to get my Ubuntu Server test system connected to my home network and the Internet (at least from the inside looking out). If you read the post then you will know that because my house is almost 100% wireless I needed to move the system into the hallway to be next to the router in order to physically connect.
Now although I have a very nice hallway I don’t fancy sitting in it for hours with a keyboard on my lap. I also don’t really want to be running wires around the house and as I think that the system will end up in the garage I need to be able to connect remotely, from my Ubuntu or Windows systems.
<!--more-->
Although it’s been a while since I used any flavour of Linux (and even then in my use was pretty limited) I knew that remote connections were the way to go and remembered that OpenSSH was a good tool for the job.

After checking that it was not already installed by running:
```
dpgk --get-selections | grep openssh-server
```
I went about the installation by running:
```
sudo apt-get install openssh-server
```
followed by:
```
sudo /etc/init.d/ssh start
```
to get things going.
 
So far so good, I now have OpenSSH installed and running – how do i connect to it..?
 
Well I had already booted into Ubuntu (9.04 – Jaunty) on my laptop so it was just a matter of running: [see note at end of post] 
```
ssh dilbert@192.168.1.4 
```
[**dilbert** being the username I provided during the installation of Ubuntu Server and **192.168.1.4** being it’s IP address].
 
I was prompted for the password for the dilbert user and I was in … but I was not quite finished.
 
By default OpenSSH accepts remote logins from the root user – not a good idea! So while I was connected I editted the configuration file:
```
sudo vi /etc/ssh/sshd_config
```
and set PermitRootLogin to no.
 
All that’s needed now is to restart OpenSSH so that the new settings take effect:
```
sudo /etc/init.d/ssh restart
```
So there it is – I now have my Ubuntu Server setup so that I can access it remotely from my laptop when I boot into Ubuntu. But what if I’ve booted into Windows? Well I’ve heard that Putty is a good tool to connect to SSH from Windows so I’ll have to check that out.
 

>While I was able to run SSH from my Ubuntu laptop means that the client must have been installed already – although I can’t remember doing it so it must be there by default. If it’s not installed on your setup you will need to run
`sudo apt-get install openssh-client`
