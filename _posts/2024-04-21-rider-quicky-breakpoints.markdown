---
layout: post
title:  'Rider Quicky - Managing Breakpoints'
date:   2024-04-21 00:00:00
tags:   rider development howto rider-quicky
---
![jetbrains rider logo](/assets/images/rider-icon.png){:width="220px" style="float:left; margin-right: 10px;"}
Visual Studio may have fallen out of favor with me but having worked with the IDE for over 20 years that muscle memory is hard to rewrite. From keyboard shortcuts to menu options and settings, I know how to do it in Studio but sometimes I don't even know if it's possible using Rider.

I frequently find myself just accepting that 'this is the way Rider does it' but sometimes I think; 'you know what ... no, I need to work this out, Rider must be able to do this'. Most of the time I find the way but then I have to say I forget the things that I don't bump into everyday.

With that in mind I think I need to start writing these down so I don't have to trawl the internet or the settings to work it out each time.

To kick off this 'Rider Quicky' series I look at something that bugged me for quite a while - deleting breakpoints, simple huh?
<!--more-->

As developers when we are building new features or debugging issues we can sometimes use breakpoints like they are going out of fashion. We then go to demo the new feature and we soon bump into the minefield of breakpoints and find ourselves F5'ing through them saying 'oh, sorry about that .. I'll just skip over these'.

In Visual Studio disabling or deleting all breakpoints in the solution was straightforward but to me it wasn't clear how this was possible with Rider. 

Until now I've been using the 'Bookmarks' window to view and manage my Breakpoints (yes - they appear there as well as Bookmarks!). 

![rider bookmarks tool window containing breakpoints](/assets/images/rider_bookmarks_tool_window_with_breakpoints.png)

Using this window I can deactivate and/or delete Breakpoints but what if I wanted to remove a dozen or more?

Well, Rider does (of course) have a Breakpoint manager but it's not accessed via any menu that I can find - but there are a couple of ways to access it;

- Via the Debug tool window, clicking on the option shown below

![rider debug window with show breakpoints and exceptions option highlighted](/assets/images/rider_debug_tool_window.png)

- or via the keyboard shortcut `CTRL+Option+B` 

Using either of these will open the Breakpoints manager:

![rider breakpoints manger dialog](/assets/images/rider_breakpoint_manager_dialog.png)

Now, we're talking - from here I can disable/delete all/selected/individual breakpoints as well as editing individual breakpoint conditions.

Perfect ... another part of my 'development inner loop' unlocked when using Rider.
