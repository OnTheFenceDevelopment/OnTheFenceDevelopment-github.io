---
layout: post
title:  'Discovering T4MVC – Replacing Literal Strings with Strongly Typed Helpers'
date:   2013-01-24 00:00:00
tags:   asp-net-mvc development
---
One of the things I love about working as a contractor is getting exposure to technologies, tools and utilities that will improve my coding and help me produce better code – geeky but true.
My most recent contract is no exception and this time I’ve decided to share this little gem of an extension which will remove those pesky literal string from your MVC Views.
<!--more-->
Any developer who has worked with MVC will have written code similar to the following:
```csharp
@Html.ActionLink("Edit", "Edit", "Magazine", new { Id = Model.Id }, null)
```
This will create a simple "Edit" Hyperlink which is call the "Edit" action method on the "Magazine" controller passing an "Id" parameter and there's nothing wrong with it. But what if you change the name of the action method, or come to that, the controller itself? Imagine hunting down every instance of the of a string literal and changing it; possible yes but time consuming and can you be sure you got them all.

Enter T4MVC – a simple T4 Text Template which generates a new class within the project that provides strongly typed helpers that can be used in place of the string literals.

The extension can be installed via NuGET and will add a few files to the project, the most important of which is ‘T4MVC.tt’. By right-clicking on the file and selecting ‘Run Custom Tool’ the magic happens and a new helper class called ‘MVC’ is generated.

With the helper class generated the above code could now be written as follows:
```csharp
@Html.ActionLink("Edit", MVC.Magazine.ActionNames.Edit, MVC.Magazine.Name, new {id = Model.Id}, null)
```
Notice how the action and controller names have been replaced with strongly typed string values.

Whenever you add, remove or change an action method (or a controller come to that) just right-click on the ‘T4MVC.tt’ file and run the custom tool to regenerate the helper class. If an action method had been renamed or removed then every instance of it being referenced as above would now cause a design-time compiler error which makes them super simple to locate and when the build succeeds you can be sure that you have no errant references to non-existent action methods.

Hopefully you will find this as useful as I did – I’ll be sure to include this in all my MVC projects from now on.

>One drawback I found with using T4MVC was that I had to remember to regenerate the files each time I made a change to the controller methods, if I didn’t then I could get a compiler error – which is of course the point of the extension, but frustrating when you forget.

>Well, help is at hand with another, zero configuration, Visual Studio extension called AutoT4MVC – which essentially triggers the regeneration whenever the project is built.
>To install the extension just open up the NuGet manager and search for <a href='http://visualstudiogallery.msdn.microsoft.com/8d820b76-9fc4-429f-a95f-e68ed7d3111a' target='_blank'>AutoT4MVC</a>, install, restart Visual Studio and you’re off – no configuration and no face/palm when you forget to regenerate before building/debugging. Simple!
