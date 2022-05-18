---
layout: post
title:  'Running Screwturn Wiki under Mono'
date:   2010-10-17 00:00:00
tags:   mono wiki open-source
---
So at work we had a need for a Wiki of some description and after evaluating a number of different systems we decided to go with <a href='http://www.screwturn.eu/' target='_blank'>ScrewTurn</a>. This is written in C# and was initially installed on a Windows Server under IIS – and all was well. At the same time I was evaluating the Statusnet microblogging platform – which we then also decided to implement for internal communication (Yammer and Twitter were deemed as not being suitable).

Now, here lies a problem; Screwturn is written in C# and supported to run on Windows but statusnet is written in PHP and I had no end of problems getting all of the requirements (mainly php_curl) running under IIS. On the flip-side, installing statusnet on a Linux platform like Ubuntu is a breeze once the LAMP stack is installed – but what about Screwturn? Obviously I knew about <a href='https://www.mono-project.com/' target='_blank'>Mono</a> but didn’t have any really experience with it – would it support enough of the .NET Framework to run the Wiki? If so then we could implement both Screwturn and Statusnet on an Ubuntu server (actually a VM) our DMZ – replacing the ageing tin box Windows server.
<!--more-->
The upshot is that Screwturn WILL run on Ubuntu under Mono – with some very minor tweaks to a small number of files. You don’t need to rebuild the source, you don’t need to know any C# – assuming you have the LAMP stack and Mono installed already, all you need is a text editor and you are good to go. If you just want to see how I did it rather than read about how I worked it out then just scroll to the bottom of this post – I’ve summarised it there.

My starting point was to create a Virtual Machine running Ubuntu Server 10.04 LTS (remember this is going to be a production system and using the LTS instead of the recently released 10.10 made sense from this point of view). After installing the LAMP stack (<a href='http://www.howtoforge.com/ubuntu_lamp_for_newbies' target='_blank'>click here if you need help with this</a>) and Mono (<a href='http://www.ivankristianto.com/software-development/mono/howto-run-asp-net-on-linux-with-apache-web-server-mono-mod_mono/760/' target='_blank'>click here for the step by step installation that I used for my investigations</a>) I set about downloading Screwturn itself.

Bearing in mind I installed the server with no Desktop I used good old wget to fetch the latest package, locating the URL by hovering of the download link on the website.

My command line was;
```
wget -O screwturn.zip http://www.screwturn.eu/GetFile.aspx?File=/Releases/ScrewTurnWiki-3.0.4.560.zip
```
Obviously this will change as new versions are released but you get the idea.

After unzipping this package (which I needed to install ‘unzip’ from the repo) into a new folder I created in the the Home folder I copied the WebApplication folder into /var/www and renamed it to screwturn. Reading the Install.txt file (back where I extracted the zip file I downloaded earlier) I decided to leave the master password for the timebeing but did update the permissions on the public folder using chmod a+w /var/www/screwturn/public and then restarted Apache (just for good measure).

With fingers crossed I navigated from my laptop browser to the VM location of the new ‘site’ and after about 15-20 seconds (quite common for an ASP.NET site starting up) the Screwturn Home Page was displayed – job done yes?

![screwturn wiki homepage](/assets/images/stw_initial_load.png)

Well, actually no. While clicking on some of the menu links, like ‘All Pages’, ‘Categories’ or ‘Navigation Paths’ took me to the appropriate pages, clicking on ‘Create a New Page’ or ‘Administration’ resulted in a Yellow Screen of Death.

![screwturn wiki yellow screen of death](/assets/images/stw_yellow_screen_of_death_1.png)

As an ASP.NET developer I’m quite used to seeing these and duly editted the web.config file (as indicated in the YSoD) to turn Custom Error off, restarted Apache (just to be sure) and tried again. After a short delay (ASP.NET startup remember) yet another YSoD was displayed – this time telling me that it could not find a file called MasterPageSA.master – progress of sorts!

![screwturn wiki next yellow screen of death](/assets/images/stw_yellow_screen_of_death_2.png)

Listing the files in the root of the application showed that the file was actually present so I wondered if it was the tilde ‘~’ character that was causing the problem – maybe Mono didn’t like it. I knocked up a quick test application with a master page and it worked fine so that ruled that out. Then I noticed that the filename of the actually file was MasterPageSA.Master (note the upper case M in the extension). “Surely Not”, I thought but renamed the file with a lower case m instead and clicked on refresh and again success of sorts – a few seconds later a different Yellow Screen of Death appeared – this time with what appeared to be a Javascript error.

![screwturn wiki another yellow screen of death](/assets/images/stw_yellow_screen_of_death.png)

Googling for this error I was led to the Screwturn Wiki forum where a guy appeared to be pointing the finger at Screwturns use of Webparts and Monos lack of support for this feature. Damn – was this a deadend? I ‘tweeted’ my frustration and within a few minutes I got a reply from the ScrewTurnWiki Twitter account saying that the application didn’t use Webparts but it did use an AJAX component called Athem.NET which might do.

Ok, how hard can it be? Screwturn is written in C# and I develop in C# for a living. Surely I can sort this out. So I downloaded the source code (the joy of Open Source) and opened it in Visual Studio 2008 on my Windows system. After checking that everything built and ran ok I located all of the references to the Webpart namespace and commented them out! An extreme approach but I needed to see if the code made use of the namespace or if the references were left over from previous development. I did not, for one second, expect the code to build but was quietly pleased when it did! So whoever was on the Twitter account was right – Screwturn does not use Webparts. So what about this Anthem.NET component?

Well Anthem.NET provides AJAX functionality to the application and while I did not relish having to tear this out and replace it with MS AJAX I removed the reference to the library, fixed all of the compilation errors resulting from the loss of the reference and after a couple of hours I had the code building again – but would it run?

The answer was, surprisingly, yes. However the Yellow Screen of Death with the Javascript error was once again displayed when clicking on the ‘Create a New Page’ menu item. All that work and I had achieved nothing – or had I? Well I knew that Webparts were not causing the problem and neither was the Anthem.NET library – good news as I didn’t have to replace it with MS AJAX. So that meant that the problem appeared not to be caused by Mono not supporting aspects of the .NET Framework. But how was I going to move forward?

Well, the only thing I could think of was to flip back to Ubuntu and run the source in a development IDE like MonoDevelop – which is when I did (on my laptop, not the server!). It was in MonoDevelop where I found the last piece of the puzzle.

While running the application in MonoDevelop and clicking on the ‘Create a New Page’ menu item I saw this stack trace:

![mono develop stacktrace](/assets/images/mono_develop_stacktrace.png)

Googling the Parser error I came across a forum posting indicating that Mono was a little stricter when it came to parsing and that the angle brackets in Javascript were particularly troublesome. He overcame the problem by commenting the Javascript out – a trick used to stop older browsers, which did not support Javascript, from trying to interpret the script. Looking at the code for the Editor.ascx control I could see that the two script blocks were commented out already – but not consistently.

Notice how the closing comment tag also has the // comment notation while the opening one doesn’t. Could this be the problem? Well after kicking a few permutations around I found that if I changed the tags around both of the script blocks as below then the page ‘Create a New Page’ page loaded fine (after prompting me to login) – indeed so did the other pages that failed to load earlier – because the Editor control is present in each of them.
```xml
// <![CDATA[

Javascript in here
// ]]>
```
There was one more tweak though. With the ‘Create a New Page’ loaded, clicking on the ‘Visual’ tab resulted in an error being displayed within the page itself (not a Yellow Screen of Death).

![iframe error](/assets/images/iframe_error.png)

The error message indicated that it cannot find a file called IframeEditor.aspx – well knowing from above how strict Mono is about casing I assumed (correctly) that the file was probably present but cased differently – which proved to be the case. Locating the reference to the incorrectly cased file and changing it to IFrameEditor.aspx resolved the issue.

And that’s that really – A few tweaks and Screwturn Wiki is running perfectly well on Ubuntu under Mono. The changes have been fed back to the guys at Screwturn and hopefully they will see the benefit of incorporating them into the main build – assuming they do not break anything else when running under Window/IIS that is.

**So in summary the required changes are:**

- Rename MasterPageSA.Master to MasterPageSA.master (lower case ‘m’ on extension)
- Replace the comment tags around the two Javascript blocks in Editor.ascx as below
    - `<!–` needs to be replaced with `// <![CDATA[`
    - `// –>` needs to be replaced with `// ]]>`
    - Locate reference to `IframeEditor.aspx` in the `Editor.ascx` markup and change it to `IFrameEditor.aspx` (upper case F)

<br/>
Note: I am using the Wiki in File Storage mode and have not attempted to connect to a database MySQL or otherwise. The File Storage mode fits our needs at this time.