---
layout: post
title:  'Online Tool of the Month – ExtensionMethod.Net'
date:   2018-08-17 00:00:00
tags:   online-tool-of-the-month
---
OK – not really a tool, more of a resource but I hope you will like it.

As you may know my language of choice is C# and since version 3.0 developers have been able to add functionality to existing types without actually modifying the type itself by using <a href='https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/extension-methods' target='_blank'>Extension Methods</a>.

We are all used to the String methods such as ToUpper() and ToLower() – but what if you wanted to truncate a string to a specified length and apply a ‘…’ suffix?
<!--more-->
Well, you could of course write a private method in the class you want to perform this operation or create a static class with static methods to do the job for you. Both perfectly valid ways of achieving the same result but extension methods are somewhat cleaner in my opinion (if you ignore the ‘they are’t object oriented’ argument).

Now you can read all about Extension Methods using the above link but as with things like RegEx, there is not always a need to reinvent the wheel and the <a href='http://extensionmethod.net/' target='_blank'>ExtensionMethod.Net</a> website is basically a collection of user submitted methods which address common needs (or even the not so-common ones).

![extension method dot net website](/assets/images/extension_method-net.png)

The site isn’t limited to just C# methods either – there are submissions for VB, F#, Swift, Kotlin and Javascript.

You can search or filter the methods by language, target object (e.g. System.String) and author.

Once you have found something you like you can view the code and, most of the time, see usage examples.

From there it is just a quick copy/paste to bring the code into your project – where you will more than likely want to tweak it slightly (because that’s what we do right?) and you’re good to go.

N.B. If you like the sound of the ‘Truncate’ method I mentioned above, <a href='http://extensionmethod.net/1623/csharp/string/truncate' target='_blank'>you can find it here</a>.