---
layout: post
title:  'Another Xamarin Forms app about to hit the App/Play Stores'
date:   2018-08-22 00:00:00
tags:   xamarin mobile-development smite-scoreboard-app
---
![smite scoreboard app icon](/assets/images/smite_scoreboard_app_icon.png){:style="float: left; margin-right: 10px;"}
<a href='http://www.originalsmite.com/' target='_blank'>Smite</a> is a wooden garden game based on a Northern European game and played around the world.

If you think of a combination of skittles and boules you’ll be pretty much there – but not quite, there are a few twists.

Each player will take turns to throw a wooden ‘smitter’ at 10 numbered wooden pins, arranged in a similar manner to those in 10 pin bowling.

- Knock over a single pin and you score the number on that pin.
- Knock over two or more pins and you score the number of pins that fall; knock over four pins and you score four points.
- Before the next players turn the pins are stood back up but remain where they fell, they are not returned to their original location.
- Miss all the pins three turns in a row and you are ‘smitten’ and out of the game.
- If any players score exceeds 50 points they are returned to 25..!
- When a player scores exactly 50 points the game will end when the round completes – all remaining players will complete the round. There can be more than one winner!

<br>
It sounds simple but when the pins start to spread out the game becomes much harder – I can personally attest to this, as can many members of my family..!
<!--more-->
![smite scoreboard app screenshot](/assets/images/smite-scoreboard-screenshot.png){:style="width: 250px; float: right; margin-left: 10px;"}
Keeping score is not difficult but games can go on longer than expected and you soon find yourself scrabbling around for scraps of paper to continue the scoring.

Having run out of paper on many occasions I decided to create a simple app to keep score and apply the simple rules above. The ability to take player photos to use as avatars and ensuring that game state is saved when the app is backgrounded (lunch and dinner frequently interrupt a ‘a few quick games of Smite’) add some nice functionality and coding challenges.

Written using Xamarin.Forms there are Android and iOS versions of the app with around 95% of the code being shared – only a couple of small platform specific classes were required.

I currently have a few testers looking at the release candidate version – with a few more being recruited at the upcoming Smite World Championships.

It’s a pretty straightforward app and nowhere near as complicated as the likes of my other apps, ~~FillLPG~~ or <a href="{{ 'motorhome-stopover-home.html' | relative_url }}">Motorhome Stopover</a>, but I fully expect to have a few bugs to fix and features to add.