---
layout: post
title:  'Installing Eclipse and the Android SDK on Ubuntu 10.04/10.10'
date:   2010-05-29 00:00:00
tags:   linux ubuntu android eclipse
---
As previously posted I have recently bought myself a nice new Android phone – a HTC Hero to be precise. One of the main reasons for buying it was so that I could look into developing applications for this new platform, thus expanding my skill set.

I had been playing around with installing the Eclipse IDE (arguably the best Java IDE around) and the Android SDK on my previous Ubuntu installation and basically made a hash of it a few times. Having refined my process I’ve decided to write it down so that I don’t forget ;-

Following my clean installation of Ubuntu 10.10 I needed to get my development environment sorted out, and this meant installing Eclipse and the Android SDK and then wiring them both together.

When <a href='https://www.eclipse.org/downloads' target='_blank'>downloading the IDE</a> I opted for the ‘Eclipse IDE for Java Developers’ because essentially Android is a set of libraries built on top of Java, so it seemed like a good place to start. Note that I’m using Eclipse 3.6 (Helios) for my development.

>Thanks to Kalpak (see comments) for noticing that I had not detailed the installation of a Java SDK. I must have already had on installed on my system when I decided to write this post. I’ve updated this post with the required installation.

>In Kalpaks comment he mentions that Java 1.6 is not supported for Android development but <a href='http://developer.android.com/sdk/requirements.html' target='_blank'>this no longer seems to be the case</a> – although I stand to be corrected 😉

First we need to install a Java SDK – apparently 1.5 or 1.6 will suffice but I’m going to install 1.6 here by running:

```
sudo apt-get install sun-java6-jdk
```

With that complete we are ready to install Eclipse.

The installation process for Eclipse is a simply case of extracting the downloaded archive into a suitable location, I’ve created a folder called Applications in my /home/dave directory and extracted the archive into it. Double clicking on the eclipse executable file kicked off the IDE which loaded quite quickly after prompting my for a workspace location – I just kept the default.

So that’s Eclipse sorted, now what about the Android SDK?

After <a href='http://developer.android.com/sdk/index.html' target='_blank'>downloading the SDK</a> it too is installed by simply extracting into a suitable location, again I extracted it into my /home/dave/Applications folder. But we are not quite finished yet – we need to use the SDK Manager to download and install at least one Android development platform first (read the ‘SDK Readme.txt in the folder when you extracted the SDK for more details). This is a simple case of executing `[SDK Folder]/tools/android` (either via the command line for by double-clicking it).

The SDK and AVD Manager will now load and I simply selected the ‘Available Packages’ option, selected everything in the right-hand pane and clicked on ‘Install Selected’. After a length installation process I was done – this is my SDK/AVD Manager after the installation completed.

![sdk manager](/assets/images/android_skd_avd_manager.png)

So that’s it, we’re there yes? Well no, not yet. In the Windows world we are used to installations detecting the presence of IDEs or vice-versa and everything just working once the installer finishes. Well Linux is not like that we need to so some additional configuration before we can get coding; in fact Eclipse/Android installation is pretty much the same on all platforms, so it’s not just an Linux thing.

The first thing to do is to install the Android ADT (Android Developer Tool) plugin into Eclipse – which you’ll be happy to hear is a semi-automatic process.

- Start Eclipse and select ‘Install New Software’ from the Help menu.
- Click the ‘Add’ button next to the “Work With” dropdown list.
- Enter a suitable name for this resource, e.g. Android Developer Tools, and the following URL into the location: <a href='https://dl-ssl.google.com/android/eclipse' target='_blank'>https://dl-ssl.google.com/android/eclipse</a>
- Click Ok

Eclipse will now search for the ADT plugin and all things being equal will display a screen similar to this:

![installing developer tools](/assets/images/eclipse_adt_install-.png)

Select the ‘Developer Tools’ checkbox (which will select the DDMS and Development Tools beneath it) and click next. After agreeing to the Licence Agreement (which of course you read first) click Finish and the installation will proceed.

You may get a security warning at this point because the packages are apparently unsigned but I just clicked OK to carry on. All things being equal you will be prompted to restart Eclipse.

Finally you need to tell Eclipse where the Android SDK has been saved. To do this simply select Preferences from the Window menu, click on the Android option in the left hand pane and then the Browse button next to the SDK Location field. Navigate to the folder where you extracted the SDK and click OK. Click OK in the Preferences window and you are done.

Selecting File > New you will see ‘Android Project’ displayed and clicking it will display the following window:

![new project dialog](/assets/images/new_android_project_dialog.png)

There seems to have been a change here, I don’t see the ‘Android Project’ option when I click File > New anymore. Now I have to click File > New > Project, expand the Android option on the resulting window and there is the Android Project option. Not sure if this is a change or because I’ve now done something differently·

Now I’m still new to Android development so I’ll not inflict my poor knowledge of what you need to enter into this screen – you probably know better than me at the moment anyway 😉

What I can say is that I managed to complete the obligatory ‘Hello World’ application from my copy of ‘Professional Android 2 Application Development’ book by Reto Meier so I must have it set up somewhere near right.

![hello world in android emulator](/assets/images/android_hello_world.png)