---
layout: post
title:  'PersonalEncrypter – New and Improved'
date:   2018-12-06 00:00:00
tags:   personal-encryptor-cli personal-encryptor open-source privacy
---
![privacy stamp](/assets/images/privacy-stamp.png){:style="float: left; margin-right: 10px;"}
A couple of months ago I [updated the PersonalCLI project]({% post_url 2018-09-25-personal-encryptor-cli-v1-1-0-released %}) to remove information leakage in the form of the original filename of the encrypted data. In my [original post about this project]({% post_url 2018-02-24-the-personal-encryptor-1-0-released %}) I eluded to updating it to move away from the Microsoft encryption libraries and to implement the <a href='https://download.libsodium.org/doc/' target='_blank'>libSodium library</a> instead.

Well, I’m happy to say that I’ve found some time to do this and moved to .NET Standard at the same time – yep, the future is here.
<!--more-->
The initial project was really a quick and dirty exercise to demonstrate the ease with which these applications can be developed. It didn’t really lend itself well for extension – it was only meant to be a proof of concept after all.

In the new project I have created a class library to handle the mechanics of the encryption and a separate project for the CLI. There is also a skeleton project for a UWP desktop application which I’m currently working on (and committed in error – but hey, I’m only human). The UWP application will be initially aimed at Windows 10 but the ultimate aim to for a version of this project to be installable on just about any platform, e.g. Mac, Linux, iOS and Android.

> Note: The libSodium project uses a different encryption algorithm to the Microsoft libraries so it will require a new key pair to be generated.

So, I’m now working on the UWP application which may even find it’s way onto the Microsoft Store (if they’ll have it) – afterall, that’s the aim isn’t it – to get encryption into the hands of the masses so that they can have some semblance of privacy.

I’ll be pushing updates to the <a href='https://github.com/OnTheFenceDevelopment/PersonalEncryptor' target='_blank'>public Github repo</a> and announcing major milestones here so …… watch this space!