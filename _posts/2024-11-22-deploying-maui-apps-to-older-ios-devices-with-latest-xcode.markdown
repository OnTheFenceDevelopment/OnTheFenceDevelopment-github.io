---
layout: post
title:  'Deploying and Debugging MAUI Apps to Older iOS Devices with Latest Xcode'
date:   2024-11-22 00:00:00
tags:   maui mobile-phone mobile-development ios xcode
---
While migrating a clients application from Xamarin.Forms to MAUI there was a requirement to test it on older iOS devices such as an iPhone 6s. Now that's not really a big issue, I happened to have one in my 'test phone' collection that hadn't been recycled or handed out to a family member who had dropped their own phone in the toilet.

Getting the phone charged and booted was the easy part - getting it connected to my MacBook Pro so that I could deploy and debug the application to it required a little bit more effort, but not too much as it turned out.
<!--more-->

If you've read any of my recent posts you will know that I'm an avid user of the Jetbrains Rider IDE and while it has it's oddities it serves me well. So when I connected the iPhone 6s to the Mac I was surprised to find that it didn't appear in the list of available devices. I've had no issues with newer iPhone/iPads so was pretty sure this was not a Rider issue.

![Jetbrains Rider iOS Device List](/assets/images/rider-missing-ios-device.png)

I tried rebooting the device, rebooting the Mac, checking for Rider updates and even different cables but nothing worked. With everything else checked, my attention turned towards Xcode which I'd recently updated to v16.1 so that I could build a previous MAUI migration using the very latest iOS SDK to comply with Apple Store requirements.

Taking this into account, i.e. the need to update Xcode to support newer versions of iOS, it made sense that in addition to dropping support for older versions, Apple would also be dropping support for using older physical devices within Xcode. 

This was pretty much confirmed when I opened Xcode and navigated to 'Window > Devices and Simulators' with my device connected.

![Xcode Devices and Simulator Page displaying a DeviceSupport Error](/assets/images/xcode-device-missing-support-files.png)

While Xcode is able to determine the phones model, iOS version, memory capacity and even the serial number, it looks like there are some missing 'Device Support' files which will prevent it from going much further than that. 

The suggestion is that I might need to install the latest version of Xcode I'm pretty sure that the opposite is required - I need an older version. 

But which version do I need? Which one supports physical devices running iOS 14.6 like my iPhone 6s?

Yeah, there are probably sites out there, and I am using the Xcodes utility which allows me to have multiple Xcode versions installed side by side (only one being active at a time mind you) but is there another way?

Well as you've probably guessed by the fact this post isn't finished yet there is an arguably cleaner way to get the latest version of Xcode to support older physical devices - and it only takes a few minutes and consists of just two steps.

#### Step 1: Download the Support Files
While it is possible to extract the files from a suitable version of Xcode, why do that when someone else has done all the hard work for you? 

- Just head over to <a href='https://github.com/iGhibli/iOS-DeviceSupport/' target='_blank'>https://github.com/iGhibli/iOS-DeviceSupport/</a> and download the Zip file to your Mac.
- With the file downloaded, double-click on it to extract it and open the resulting folder to reveal a `DeviceSupport` folder with zip files for each iOS version from 8.0 to 16.4 (at the time of writing).

![Downloaded and Extracted Device Support files](/assets/images/extracted-DeviceSupport-files.png)

#### Step 2: Copy them to the required location
There are a lot of files in here but fortunately for me only one labelled 14.6 which was, according to the filename, pulled from Xcode 12.4. 

I copied this file to my Desktop and extracted it to find that it contained two files;

![Extracted Device Support files for iOS 14.6](/assets/images/extracted-DeviceSupport-4.6-files.png)

Now for the slightly non-obvious bit - getting that folder to where it needs to be.
- Open Finder and navigate to `Applications`
- Right-Click on Xcode (yeah, sorry - I'm using a two button mouse, you do whatever works to open the context menu)
- Select `Show Package Contents`

![Finder showing Xcode Application Context Menu ](/assets/images/xcode-application-show-package-contents.png)

- Expand the resulting folder to the following path `Contents > Developer > Platforms > iPhoneOS.platform > DeviceSupport`
- Copy the extracted folder into this folder

![Xcode application Content folder structure](/assets/images/applications-xcode-content.png)

- Restart Xcode and open `Window > Devices and Simulators`

If you've pulled in the correct Support files you should now see that the error message has disappeared

![Xcode Devices and Simulator Page With No DeviceSupport Error](/assets/images/xcode-device-with-support-files.png)

Restart Rider and expand the Devices list and you should also see the device listed for selection here as well - result.

![Jetbrains Rider iOS Device List with iPhone 6s now displayed](/assets/images/rider-full-ios-device-list.png)

So, that's that - how to get the latest version of Xcode to deploy and debug applications on an older, technically unsupported physical device.

## Resources:
Jon Brown Blog Post about the Xcodes Utility: <a href='https://jonbrown.org/blog/xcodes-walkthrough-and-review/' target='_blank'>https://jonbrown.org/blog/xcodes-walkthrough-and-review/</a>