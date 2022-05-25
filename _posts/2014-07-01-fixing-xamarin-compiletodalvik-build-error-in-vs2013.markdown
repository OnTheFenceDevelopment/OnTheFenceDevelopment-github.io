---
layout: post
title:  'Fixing Xamarin COMPILETODALVIK build error in VS2013'
date:   2014-07-01 00:00:00
tags:   xamarin visual-studio
---
After clearing the decks of some other freelancing projects I’ve had on the go recently I’ve been able to get back to looking at my FillLPG application that I’ve decided to rewrite from scratch using Xamarin.

It was time to start working on the UI and with the new <a href='https://xamarin.com/forms' target='_blank'>Xamarin.Forms</a> library promising cross platform UI development I thought I’d create a quick project to compare the old approach with the new (and maybe write blog post or two about it). However, I ran into problems very quickly and thought I’d pass on my experience.
<!--more-->
I decided to create a Solution with Android, iOS and Portable Class library projects. The application would open with a Map (Google Maps on Android and Apple Maps on iOS) and would have a menu to open a standard login page. Now, in order to display a map on Android you need to reference the Google Play Services library and make some changes to the AndroidManifest.xml file to configure the required permissions etc – and this is where the problems started.

I’d created the Solution, added the Android and PCL projects and used the <a href='http://components.xamarin.com/' target='_blank'>Component Store</a> to include the <a href='http://components.xamarin.com/view/googleplayservices' target='_blank'>Google Play Services component</a>. When I attempted to build the solution I was greeted with a rather unhelpful error message.

At this point I’ve not written a line a code – but the solution won’t build!

The issue appeared to be caused by the presence of the Google Play Services component and it’s worth bearing in mind that this comes in the form of a Java .jar file (why wouldn’t it – that’s the native language of Android after all). Well, as part of the compilation a Java process is spun up and the .jar is loaded and (presumably) compiled. During this process the Java process has an amount of memory allocated to it but the default size (whatever that happens to be) appears to be too small and an OutOfMemoryException is thrown.

After quite a lot of Googling I found two solutions that worked for me;

The first approach involved simply adding a new **Environment Variable** to increase the Java heap size on a machine-wide basis, i.e. for all Java processes that run on your system.

- Variable: _JAVA_OPTIONS (the leading _ is deliberate)
- Value: -Xmx1g

<br>
This may be what you want but if, like me, you split your development between multiple systems are are working in a team of developers then this may not be the optimal solution.

The second solution requires opening up the .csproj file for the Android project and making a small adjustment. This has the benefit of being part of the project so, if checked into source control is will be set for all development systems that it is checked out on.

Open up the .csproj file into an XML editor (if you’re doing this in Visual Studio then you’ll need to unload the project first) and locate the JavaMaximumHeapSize element. Then update it as follows:
```xml
<JavaMaximumHeapSize>1G</JavaMaximumHeapSize>
```
Both of these options increase the heap size to 1GB which should be more than enough.

With that fixed I can get back to the Xamarin.Forms sample project and get back to work.