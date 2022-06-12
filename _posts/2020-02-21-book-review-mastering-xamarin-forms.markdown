---
layout: post
title:  'Book Review: Mastering Xamarin.Forms'
date:   2020-02-21 00:00:00
tags:   book-review
---
![mastering xamarin forms book cover](/assets/images/mastering_xamarin-forms.png){:style="float: left; margin-right: 10px;"}
It may sound odd but from time to time I get approached to review a book which is either due to be or has just been published.

I say odd because I’m just a regular developer – not a podcasting rockstar (or even a blogging one). Why would my option be worth a free copy of a book?

Maybe it’s because I’m just a regular developer – just like most of us.

Some of these I let pass me by, especially if I have no real interest in the content, i.e. a technology that I am not using and have no plans to use – F# for example. I frequently say that ‘you have to pick your fights when it comes to technology – you can’t win them all’.

So, when <a href='https://www.packtpub.com/' target='_blank'>Packt</a> asked if I would review this book it made me wonder:

>“How much of a master can I be after reading a book that’s ‘only’ 200 pages?”. 
<!--more-->
I’m certainly not belittling the authors efforts, but I have a Microsoft Press book <a href='https://www.amazon.co.uk/Creating-Mobile-Xamarin-Forms-Charles-Petzold/dp/1509302980/' target='_blank'>‘Creating Mobile Apps with Xamarin.Forms‘</a> which is more than twice that length and that doesn’t claim to be able to make me a ‘Master’.

I’ve developed a number of Xamarin.Forms applications and do so on a pragmatic basis, i.e. I do what I know works without necessarily knowing (or really needing to know) the ins and outs of why it works. I get the job done and (hopefully) produce robust applications for my clients that satisfy their requirements.

The thing is that time passes and, like most other technologies, Xamarin.Forms is being constantly updated. It’s very easy to get out of date. That said, trying to keep up with every iteration can be soul destroying resulting in development paralysis – not being able to move forward in case you make a ‘wrong’ decision that may cost you dear in the future.

Every now and then it’s a good idea to ‘take stock’ and <a href='https://www.franklincovey.com/the-7-habits/habit-7.html' target='_blank'>sharpen that saw</a>. We can never know it all and we don’t know what we don’t know.

### So, what about the book?

By assuming that the reader has a working knowledge of Xamarin and Xamarin.Forms the book is able to build on this and not waste time going over the basics. That said, we do start by creating a new project, discussing MVVM and Data Binding. These are a building blocks of a Xamarin.Forms application and it’s always useful to reinforce our understanding. You never know, it may just fill in a grey area or it may introduce some syntactic sugar that will streamline your development.

For me, the early parts of the book demonstrated a pretty slick method the validation – using base classes and <a href='https://docs.microsoft.com/en-us/dotnet/api/system.componentmodel.inotifydataerrorinfo?view=netcore-2.0' target='_blank'>INotifyDataErrorInfo</a> (a new one on me). I can’t say I’d struggled with validation but my solutions always seemed like I was using a bit more code that I’d like – creating a potential maintenance headache for the future.

When it comes to Navigation, as in moving between views rather than physically getting from A to B, most of us may well use the built in Navigation API or rely on something like <a href='http://www.mvvmlight.net/' target='_blank'>MVVM Light</a>. The author decides to create a custom Navigation Service (and explains why), based on the built-in API to create a ViewModel to ViewModel navigation (similar to MVVM Light) that streamlines the code moves it to a central location. I really liked the result and will definitely be using this in the future. Don’t get me wrong, MVVM Light is all well and good but the simplicity of the presented code was compelling.

The development of the Navigation Service leads onto the use of the built-in Dependency Service but then quickly demonstrates how to replace this with third-party Dependency Injection, the author used <a href='http://www.ninject.org/' target='_blank'>Ninject</a>. I’d recently used <a href='https://www.nuget.org/packages/Unity' target='_blank'>Unity</a> in a project so while I knew this was possible it was interesting to see a different approach.

Building up the architecture in stages, swapping out bits and pieces the whole thing came together pretty quickly.

Some books I’ve read contain code that won’t compile due to typos and missing quotes and/or parenthesis which makes you wonder about the quality of what you’re reading.

All the code in this book worked first time – bear in mind that I wasn’t copy/pasting the code, preferring to hand type it in so that it has half a chance of sticking in my aging brain in the process. The only minor glitch was a call to Device.OpenUrl which is now deprecated (although it will still compile) – but at the speed with which Xamarin.Forms is moving this is hardly surprising and easily fixed.

The book goes on to cover Custom Renderers and Platform-Specific functionality – topics which can sometimes be overlooked as ‘out of scope’.

It doesn’t stop there though – we get to create an Azure based API with a database back-end. Then we add authentication (albeit Facebook authentication), crash reporting and application monitoring.

The end result is a fully testable (did I mention the chapter on Unit Testing?) application, with ;

- Mapping
- Location
- custom navigation
- dependency injection
- Azure API and data storage
- Crash Reporting and Monitoring

All in less than 200 pages! That’s no mean feat. The pace didn’t feel rushed or labored – I took a couple of days to work my way through the chapters and enter the code.

### Summary

So, am I now a Master of Xamarin.Forms?

Well, I have to say – probably not.

What I can absolutely say is that I have leveled up and feel much, much better equipped to develop my next Xamarin.Forms application.

I gave this book a 5 star rating on Amazon and it could be said that it should only have been 4 – because I’m not a Master as the book ‘promised’.

But I feel that I learnt a great deal – while strengthening the foundation skills and knowledge that I had already.
