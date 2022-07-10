---
layout: post
title:  'Using Fonts for Icons in Xamarin.Android'
date:   2020-03-08 00:00:00
tags:   mobile-development xamarin
---
<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Where do mobile developers get their <a href="https://twitter.com/hashtag/android?src=hash&amp;ref_src=twsrc%5Etfw">#android</a> icons from? You know, those in the menu like &quot;ic_menu_gallery&quot;. I&#39;m creating a new project with a NavDrawer and want to swap out those added by the template. Free or paid (within reason) <a href="https://twitter.com/hashtag/xamarin?src=hash&amp;ref_src=twsrc%5Etfw">#xamarin</a></p>&mdash; On The Fence Dev 🏴󠁧󠁢󠁥󠁮󠁧󠁿🇺🇦 (@OnTheFenceDev) <a href="https://twitter.com/OnTheFenceDev/status/1234561178413780994?ref_src=twsrc%5Etfw">March 2, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

I’m currently working on a new privacy application for Android and in [a previous post]({% post_url 2020-02-17-getting-started-with-visual-studio-2019-android-navigation-drawer-template %}) I guided you from the Xamarin.Android Drawer Navigation project template to something that actually worked (as in you could actually use the pretty navigation provided by the template).

Now I wanted to change the menu items to something more relevant with some appropriate icons – I mean, how hard can that be right?

Well, as with everything in development these days – things are not always as easy as they seem to be.
<!--more -->
The source code from the previous post can be found on Github and if you take a look you will find the menu defined within an XML file at ..\Resources\menu\activity_main_drawer.xml. A number of items are defined here with the same basic attributes:
```html
<item 
    android:id="@+id/nav_camera" 
    android:icon="@drawable/ic_menu_camera" 
    android:title="Import" />
```
So, all I need to do is to change the android:icon attribute to point to the drawable I want ….. and that’s where the “fun” started.

If you’ve worked with drawables in Android you will know that you need multiple versions of the same graphic at different resolutions. This will allow different devices, with different screen resolutions to display the appropriate graphic. You can find more information here: <a href='https://developer.android.com/training/multiscreen/screendensities#TaskProvideAltBmp' target='_blank'>https://developer.android.com/training/multiscreen/screendensities#TaskProvideAltBmp</a>.

If you look at the above article you will see that five different resolutions (screen densities) listed – that means you need five versions of each of your graphics for your app (although there are instances where you can get away without all of them).

There are online tools to perform the generation for you but the resulting assets still need to be extracted and copied into the project.

Then comes the small matter of what icons to use – and where to get them from.

Android comes with built-in icons, like the **ic_menu_camera** asset in the above menu item. But finding a list of these isn’t, as I’ve found, that easy and Google recommend copying the icons you need (at all require screen densities) into your project and not to rely on them being present on any particular users device.

### So, is there a better way?

Well, as the title of this post eludes, we can use fonts instead – yes, you read correctly … Fonts!

After a little bit of searching I found a <a href='https://montemagno.com/using-font-icons-in-xamarin-forms-goodbye-images-hello-fonts/' target='_blank'>blog post by James Montemagno</a> in which he describes using the FontAwesome font in Xamarin.Forms projects.

Well, I’m not using Xamarin.Forms, I’m using Xamarin.Android but if one can do it then surely the other can too.

After a little bit of Googling (actually Duck Duck Go) I stumbled on a <a href='https://blog.joanzapata.com/iconify-just-got-a-lot-better/' target='_blank'>post by Joan Zapata</a> where he presents updates to his <a href='https://github.com/JoanZapata/android-iconify' target='_blank'>Iconify library for Android</a>.

Checking out the Readme on Github it certainly looked like this was the answer to my problems, there was just one wrinkle – it was written in Java.

No problem you say – just man up, roll up your sleeves and create a Library Binding project. Yes, I could do that – or I could see if someone else had already ported it over to Xamarin – which of course they had.

If you head over to <a href='https://github.com/PragmaticIT/xiconify' target='_blank'>https://github.com/PragmaticIT/xiconify</a> you will find the source and can dig through it at your leisure – but the Readme points to a nuget package which can be easily installed into your project, so that’s what I did and as you can see from the image below, I selected to ‘Material Design’ package.

![adding the iconify nuget package](/assets/images/iconify_nuget.png)

Once the package is installed it needs to be initialised in the applications Main Activity:
```csharp
protected override void OnCreate(Bundle savedInstanceState)
{
	base.OnCreate(savedInstanceState);
	Xamarin.Essentials.Platform.Init(this, savedInstanceState);
	SetContentView(Resource.Layout.activity_main);
	Android.Support.V7.Widget.Toolbar toolbar = FindViewById<Android.Support.V7.Widget.Toolbar>(Resource.Id.toolbar);
	SetSupportActionBar(toolbar);

	Iconify.with(new MaterialModule());
	
	.
	.
	.
	.
	.
}
```
To replace the menu icons all we need to do is fetch a reference to each of them and call SetIcon passing in the required IconDrawable provided by the new package:
```csharp
var myMenuItem = navigationView.Menu.FindItem(Resource.Id.nav_camera);
myMenuItem.SetIcon(
	new IconDrawable(this, 
					 MaterialIcons.md_message.ToString()
					 )
					.color(Color.Gray));
```
The result will look like this:

![flyout menu with font icon](/assets/images/font_icon_menu.png)

The great thing about this is that the font will scale as required without getting blocky – I don’t need to do anything more.

The Readme for the Xamarin ported version of Iconify also provided details for adding Font Icons to your XAML and even how to create your own Icon Packs.

So there you have it – a simple way to replace your icons with scalable fonts, doing away with the need to provide versions for each screen density.