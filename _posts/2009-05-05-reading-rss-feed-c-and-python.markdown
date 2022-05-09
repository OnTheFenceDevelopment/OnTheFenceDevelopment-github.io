---
layout: post
title:  'Reading an RSS Feed with C# and Python'
date:   2009-04-24 00:00:00
tags:   linux ubuntu
---
When I started this site I had a project in mind that would download Podcasts as they were posted and maintain the content of my MP3 player so that I didn’t have to do it myself. Well since then I have lost my iTunes virginity and while it doesn’t do everything that I wanted (like telling me that a new episode has been downloaded) it does automatically download and delete them once I’ve watched/listened to them.
But just because I don’t need to develop a complete application there is still an itch to scratch here – a few of them in fact.

- How do I download an RSS stream – it’s not just podcasts that uses them
- How do I parse the resulting XML
- How do I download a file and store it locally and 
- How do I do this in C# and Python

Well this post will answer the first two questions using C# and LINQ and Python and it’s XML library.
<!--more-->
Using C#
First of all lets take a look at using C# and LINQ to pull an RSS feed down and read the resulting XML, outputting the results to a console application.
 
Using Visual Studio 2008 create a C# Console application – it should present you with a default Program.cs file with a few namespace imports and a Main method.
 
Before we can start we need to import the .NET Framework LINQ to XML library. To do this, add the following line under the last using statement at the top of the file.
```csharp
using System.Xml.Linq;
```
With that in place we can now declare an XDocument specifying the URL to the feed we want to download.
 
Add the following line to the Main method:
```csharp
XDocument feedXML = XDocument.Load("http://feeds2.feedburner.com/netRocksFullMp3Downloads");
```
That single line pretty much taked care of downloading the XML (I’ve targeted the 20 show feed from <a href="http://www.dotnetrocks.com" target="_blank">DotNetRocks</a>), all we need to do now is parse the content.
 
Now I could write a simple class and fill a generic collection and then do a foreach over the collection … but this is .NET 3.5 and I have implicit types and LINQ at my disposal.
 
The following simple LINQ query will populate a collection of XElements:
```csharp
var feeds = from feed in feedXML.Descendants("item")
select new
{
    Title = feed.Element("title"),
    Link = feed.Element("link"),
    Date = feed.Element("pubDate"),
    Description = feed.Element("description")
};
```
Each element has Title, Link, Date and Description properties which will show up in intellisense.
 
A simple foreach statement over this collection, again using implicit typing, will provide access to the content:
```csharp
foreach (var feed in feeds)
{
    Console.WriteLine("Title:{0}, Date{1}",feed.Title.Value,feed.Date.Value);
}
```
So that’s how it can be done in a handful of lines using C#, so how about Python?
 
<strong>Using Python</strong>\
Now I’m not going to go into project structure here (two reasons, I’m new to Python and I’m in the process of changing from Eclipse to Python Machine as my IDE of choice – more on that in another post), I’m just going to review the code required to do the job.
 
Just as with C# there is a library to do much of the grunt work leaving us to add a handful of lines of code. The library in question is urllib. With this imported it is just a matter of navigating to the RSS feed and reading it into a file.
This is the code I used for downloading the RSS to a local file:
```python
import urllib
file = urllib.urlopen("http://www.twit.tv/node/4350/feed")
text = file.read()
fileObj = open("feed.xml","w")
fileObj.write(text)
```
Line 2 creates a ‘file-like’ object that is connected to the specified network resource, in this case the RSS feed for FLOSS Weekly on the TWiT network. This object exposes a number of methods for reading the content of the resource including .read() which I use in line 3 to simply read the contents into a text object. Lines 4 and 5 simply create a filesystem object which creates a file called feed.xml and writes the contents of the text object into it. 
So now we have the contents of the RSS feed we still need to parse it – but we don’t have LINQ, how will we cope?
 
Well as luck would have it Python is Open Source and there are plenty of libraries out there that will provide the required functionality. I’ve chosen <a href="http://feedparser.org" target="_blank">feedparser</a> for this exercise – why, because it was written with this task in mind and it does exactly what it says it does.
 
The code required to provide a similar output to the C# example is:
```csharp
import feedparser
feed = feedparser.parse("feed.xml")
print feed["channel"]["title"]

for item in feed["entries"]:
    encLocation = item["enclosures"][0]["href"]
    encLength = item["enclosures"][0]["length"]
    if encLength.isdigit():
   print encLocation, int(item["enclosures"][0]["length"])/(1024*1024),"MB"
    else:
   print encLocation,"N/A"
```
Now I could try to explain all of this but the <a href="http://www.feedparser.org/docs" target="_blank">documentation</a> is pretty good itself, at least this will provide a starting point. Essentially the feed.xml document is opened and the channel title is printed out. After this a for loop is executed to iterate over the entries and output the required information. I’ve added a little check to ensure that a missing ‘length’ value does not throw an exception.
 
<strong>Summary</strong>\
So it is clear that with a similar number of lines of code it is possible to download and parse an RSS feed from a remote computer using either C# or Python. While C# has the weight of Microsoft behind it and the functionality of LINQ, Python has the Open Source community and the functionality of … well whatever the community decides it needs.