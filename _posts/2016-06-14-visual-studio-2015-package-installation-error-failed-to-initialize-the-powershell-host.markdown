---
layout: post
title:  'Visual Studio 2015 – Package Installation Error [Failed to initialize the PowerShell host]'
date:   2016-06-14 00:00:00
tags:   mobile-development visual-studio configuration
---
Well today I decided to start a new Xamarin.Forms project in Visual Studio 2015 but fell at the first hurdle – you would have thought File > New Project would be simpler than this really.

![visual studio package installation error dialog](/assets/images/xamarin-package-installation-error.png)
<!--more-->
After clicking through all the errors I tried to build the solution which failed as badly as I expected it to – only 28 errors but all pretty severe.

![visual studio build errors](/assets/images/xamarin-package-installation-build-errors.png)

Opening the Package Manager Console resulted in another error which seemed to indicate that a file was missing (nuget.psm1) but it was present, accessible and appeared to be intact.

So what’s the problem here? Well, it’s not actually Xamarin.Forms at fault – if I open Visual Studio with no solution loaded and then open the Package Manager Console I get the same error. I checked for updates and compared all the version numbers against the installation on my laptop (which didn’t have the same issue) and everything seemed in order.

Well after a look (and I mean, a lot!) of Googling I found a cure for the symptom but not for the root cause.

When you open Visual Studio 2015 an instance of the `devenv.exe.config` file is generated in the following location: `C:Users<username>AppDataLocalMicrosoftVisualStudio14.0` with a nice comment header indicating that modifications were subject to being overwritten. Now that’s a bit of a pain because only by editing that file can I get the workstation to open the Package Manager Console correctly and hence generate a Xamarin.Forms project.

Add the following within the assembly binding section of the config file:
```xml
<dependentAssembly>
    <assemblyIdentity name="System.Management.Automation" publicKeyToken="31bf3856ad364e35" />
    <publisherPolicy apply="no" />
</dependentAssembly>
<dependentAssembly>
  <assemblyIdentity name="Microsoft.PowerShell.Commands.Utility" publicKeyToken="31bf3856ad364e35" />
  <publisherPolicy apply="no" />
</dependentAssembly>
<dependentAssembly>
  <assemblyIdentity name="Microsoft.PowerShell.ConsoleHost" publicKeyToken="31bf3856ad364e35" />
  <publisherPolicy apply="no" />
</dependentAssembly>
<dependentAssembly>
  <assemblyIdentity name="Microsoft.PowerShell.Commands.Management" publicKeyToken="31bf3856ad364e35" />
  <publisherPolicy apply="no" />
</dependentAssembly>
<dependentAssembly>
  <assemblyIdentity name="Microsoft.PowerShell.Security" publicKeyToken="31bf3856ad364e35" />
  <publisherPolicy apply="no" />
</dependentAssembly>
<dependentAssembly>
  <assemblyIdentity name="Microsoft.PowerShell.Commands.Diagnostics" publicKeyToken="31bf3856ad364e35" />
  <publisherPolicy apply="no" />
</dependentAssembly>
```
Now, the laptop does not have those lines in it’s version of the file and it runs just fine so why the workstation is choking I have no idea – this is a quick and (very) dirty fix at best. From time to time you may need to reedit the file but at least you will be able to continue working.

The thing is I plan to pave this workstation soon and perform a clean installation so I’m not really looking to spend a great deal more time trawling the internet to find which obscure setting is flipped the wrong way and is causing this issue.