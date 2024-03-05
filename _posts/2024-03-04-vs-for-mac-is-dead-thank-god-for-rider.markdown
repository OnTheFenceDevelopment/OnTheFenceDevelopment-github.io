---
layout: post
title:  'VS for Mac is Dead, thank god for Rider'
date:   2024-03-04 00:00:00
tags:   development tooling visual-studio jetbrains rider
---
![jetbrains rider logo](/assets/images/rider-icon.png){:width="220px" style="float:left; margin-right: 10px;"}
Even before Microsoft announced that they were <a href='https://learn.microsoft.com/en-us/visualstudio/mac/what-happened-to-vs-for-mac?view=vsmac-2022' target='_blank'>retiring Visual Studio for Mac</a> I have to say that I'd decided to go another way.

I'd never really felt that impressed with VS for Mac, feeling it was always a bit of a second class citizen - which is understandable I guess; Microsoft have Visual Studio 2022 for their own operating system after all so it was probably quite surprising that they released the Mac IDE at all.

Now, Mac users are not being left out in the cold by Microsoft - oh no. They are are suggesting <a href='https://learn.microsoft.com/en-us/visualstudio/mac/what-happened-to-vs-for-mac?view=vsmac-2022' target='_blank'>Visual Studio Code</a> for use on the Mac (and Windows and even Linux) which, it is said, can be augmented with <a href='https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit' target='_blank'>powerful extensions to support C#, Blazor and even MAUI development</a>.

But this all felt a little ..... I don't know, cobbled together to me. I wanted something a little bit more ... focused on the job I need it to do. Not a general purpose system that could be tailored for any number of use cases.

Enter <a href='https://learn.microsoft.com/en-us/visualstudio/mac/what-happened-to-vs-for-mac?view=vsmac-2022' target='_blank'>Jetbrains Rider for Mac</a> (and Windows and Linux) which in my opinion, despite being not being a free product, is a very worthy replacement.
<!--more-->

My first experience with Jetbrains products was <a href='https://www.jetbrains.com/resharper/' target='_blank'>ReSharper</a> and I have to say that I wasn't impressed because it appeared to have a massive impact on Visual Studios performance. When I was working with client hardware which had ReSharper installed I quickly found myself disabling it.
Any productivity improvements I may have gained using it would quickly be lost waiting for Visual Studio to respond with refactorings taking longer than it would if I just typed it myself.

My first experience with the Rider IDE was during the NDC 2020 event in London where Jetbrains had a stand in one of the breakout areas. I had a good chat with the guy there and shared my experience with ReSharper and finding out that it was built into Rider wasn't endearing me to the IDE. He explained that because ReSharper was built into the core of Rider it would not suffer the same performance issues as it is at the mercy of Microsofts extension framework when running in Visual Studio - something that the Jetbrains guy blamed for the poor performance.

So did I switch to Rider during the conference .... no, I didn't.

Like many developers changing something as fundamental as their IDE, something they use day in and day out and have the muscle memory to prove it, is not something done on a whim.

I actually put my hand in my pocket some three years later in early 2023 and quickly chastised myself for not making the move much earlier.

Not only did Rider far exceed the capabilities of Visual Studio for Mac but I quickly got to grips with the new IDE and was able to remove Visual Studio 2022 from my Windows systems.

Developers are all different - what impresses one when it comes to tooling may very well not impress another so I won't try to explain all the features Rider has to offer, but here are some of the highlights for me:

- Huge number of refactorings and source code navigation shortcuts
- Static and Dynamic Code Analysis which highlight errors in the code that VS ignores (missing views from MVC applications for instance) slow running or memory intensive code
- Powerful source control integration - I'm finding myself using it more than my standalone git client lately
- Endpoint tool to view client and server APIs within the project and submit tailored requests to them right from the IDE
- Custom Live Templates akin to Code Snippets in VS allowing you to quickly inject and configure code the way you want to - do you prefer leading underscores in your local variables or not?
- Themes (yes, it has a Dark Mode as well), Custom Key Bindings and key maps to mimic Visual Studio to help maintain that muscle memory.

Now I'm not saying that Rider is 100% perfect - it's not. I get some spurious errors reported via the static code analysis from timme to time and while this does not prevent the code from running it is a minor irritation.

The thing with Rider is that it is a dedicated .NET/C# IDE - that's what it does and (in my opinion) it does it very well indeed. It's a paid for product and I get support should I need it - I once raised an issue with Microsoft that unit tests took an age to start to build in VS2022 but never got a response from them, which was pretty much what I expected considering I was not a paying customer.

And we are back to money again and a reminder that Rider is a paid product, currently starting at £119 for the first year but I opted for their dotUltimate bundle at £135. At the time of writing his include five additional tools including dotCover (enhanced Unit Testing and Code Coverage), dotTrace (for performance profiling) and dotMemory - yes, that's a memory profiler. Now I have to confess, I've not used the last two in anger but it's good knowing they are there and I consider that to be money well spent.

Finally - did I mention the 30 day free trial? Well, I have now.