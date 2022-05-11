---
layout: post
title:  'Intellisense not working via COM'
date:   2009-08-13 00:00:00
tags:   vb6 csharp interop
---
I recently needed to write a class in C# that would be accessed by a VB6 application – something quite new to me.

The existing VB6 application (which is in the process of being rewritten in C#) currently uses OLE Automation to generate MSWord documents based on templates. While this approach was working fine it was pretty slow. Having made the decision that the new version of the application would be capable of generating Word 2007 documents it was decided that the resulting class should be accessible to the VB6 application via COM Interop.
<!--more-->
The process of exposing a C# class via COM is well documented out there and only a matter of clicking a couple of project level options. To test the concept (which as already mentioned was new to me) I created a simple class in C# with a public method to create a text file.

With the class compiled I opened up VB6 (it’s been a while!) and after adding the COM class as a reference was pleased to see that I could create an instance of it as normal:
```vb
Dim engine As OpenXMLDocumentEngine.Engine
Set engine = New OpenXMLDocumentEngine.Engine
```
The problem arose when I attempted to call one of the COM Class methods – there was no Intellisense (at least nothing showing my test method). However, entering the method name manually and running the code resulted in the test file being created so the handles were there.

I Googled the problem and many solutions involved creating and implimenting a Public Interface for the C# Class. However this approach did not work for me and after a lot of hunting around I found a solution that worked for me and it was as simple as adding a references to the InteropServices assembly and a Class Attribute setting the ClassInterfaceType to AutoDual.

using System.Runtime.InteropServices;
```csharp
namespace OpenXMLDocumentEngine
{
[ClassInterface(ClassInterfaceType.AutoDual)]
public class Engine
{
.
.
.
```
A quick recompile and behold full method level Intellisense in VB6:
![intellisense in vb6]({{ '/assets/images/vb6_intellisense.png' | relative_url }})