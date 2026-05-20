---
layout: post
title:  'Smite Scoreboard App Summer Refresh'
date:   2026-04-06 00:00:00
tags:   smite-scoreboard-app
---
![smite logo](/assets/images/smite_scoreboard_app_icon.png){:width="220px" style="float:left; margin-right: 10px;"}
Well summer is approaching, and that can only mean one thing, yep breaking out your Smite set and challenging friends and family to some good old garden game fun.

Then it's the hunt for a notebook and a pen to keep scores, and then the game goes on longer than you thought, and your scorecard quickly turns into a mass of scribbles and illegible numbers. Before you know it you're writing above, below and and around the edges of the paper.

That's why I wrote the Smite Scoreboard app which my family uses whenever we get together, and the weather is kind to us (sometimes when it isn't).

Since initially developing the apps I've addressed the odd bug that snuck through and added the odd feature request, e.g. the ability Undo a Score, but this year it looks like I'll have my work cut out as a couple requests have come in that I think will be great improvements to the existing functionality.

These changes, along with those driven by the underlying platforms and the respective Stores, look like they will keep be occupied for a little while, but I'm currently hoping to have a release ready for the end of May.

<!--more-->

If you've read any of the previous posts regarding these apps you may know that the Google and Apple stores have requirements that mean, for apps to remain accessible, they need to be rebuilt using latest/recent versions of the respective SDK. This means that even if no additional functionality is being added there is still a job of work to be done to keep them apps up to date.

Sometimes this isn't a big deal; a deprecated call here and a permission or two there. But sometimes this maintenance is more onerous, which means that time for additional features is slim.

### Outstanding feature requests making the release cut
1. Ability to add/remove Players when starting a new Game rather than having to 'Keep All Players' or or start over an enter all the players in again.
2. Ability to change Players position in the order of play before starting a Game
3. Ability to configure more than 4 Teams

> Progress Update 20/05/2026:
> Things are moving along well and items 1 & 2 are ready to go while the new Team Builder page is coming along nicely. Still hoping for a release at the end of the month but it may get pushed into June.

### Outstanding feature requests not making the release cut
1. Smitten behaviour – apparently some people return to zero when they strike out three times in a row while others reduce their current score by half.
2. Mölkey Support (12 Pins) – I'm not really sure about this one, maybe I'll fork the project rather than trying to complicate the existing logic.

Anyway - can't spend time typing away here, there's code to write.
