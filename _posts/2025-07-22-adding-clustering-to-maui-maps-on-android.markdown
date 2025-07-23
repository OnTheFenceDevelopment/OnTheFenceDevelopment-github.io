---
layout: post
title:  'Adding Clustering to MAUI Maps on Android'
date:   2025-07-22 00:00:00
tags:   maui android mobile-development mapping
---
Over the years I've developed a number of mobile applications that require the ability to display a number or locations on a map.

The challenge comes when there are a large number of locations to display because the map very quickly becomes overwhelmed with marker pins - but only really on Android because Apple Maps provides a degree of clustering out of the box.

[![image of android emulator and ios simulator running the sample application which displays a map of the UK with 500 randomly dropped pins. The landmass of the UK is almost totally obscured by the pins while ios is only displaying about 50 pins which massively reduces the on screen clutter.](/assets/images/maui-default-maps-android-ios.png)](/assets/images/maui-default-maps-android-ios.png){:target='_blank'}

The above images show the difference between the standard Android and iOS maps with 500 markers randomly dropped onto them and as you can see, Android isn't really cutting it as the UK landmass is pretty much totally obscured by the marker pins. While it could be argued that the iOS version is the lesser of the two implementations because there is clearly data missing, zooming in will cause more marker pins to be revealed.

In this post I'll show you how to extend the functionality of the regular Android mapping implementation provided by the `Microsoft.Maui.Controls.Maps` package to include Marker Pin Clustering which, in my opinion, will improve the UX no end.
<!--more-->

Now, before we start, I really hate reading blog posts which relate to a subject which is totally visual but don't provide any indiction of the end goal. I follow the steps and then find that whatever the post is achieving doesn't relate to what I want to achieve. So in an effort to save you from that, here is what we are going to be working towards.

[![image of any android emulator running the sample application which displays a map of the UK with 500 randomly dropped pins. Only five actual marker pins are displayed while the others are replaced with blue circular markers each with a number in the middle of them indicating how many marker pins they represent.](/assets/images/maui-clustering-map-android.png){:width="220px"; style="float:left; margin-right: 10px;"}](/assets/images/maui-clustering-map-android.png){:target='_blank'}
[![image of the same instance of the application from the previous image but this one has been zoomed out so only three clusters are displayed, one indicating that is contains over 200 markers pins while the others indicate that they contain over 100 each](/assets/images/maui-clustering-map-android-zoomed-out.png){:width="220px"; style="float:left; margin-right: 10px;"}](/assets/images/maui-clustering-map-android-zoomed-out.png){:target='_blank'}

As you can see in the first screenshot, the map is much less cluttered with only five actual marker pins being displayed. The rest are replaced with circular markers, each containing a number that indicates how many marker pins they contain. The marker pins will drop out of the clusters as the user zooms in to the map and will be reabsorbed into the clusters as they zoom out as in the second screenshot.

What we need to do is extend the functionality of the Google Map being displayed on Android which would have been achieved using a Custom Renderer in the days of Xamarin. This is still possible in MAUI but the implementation has changed and they are now called Handlers.

Now this would be a pretty long post if I explained every line of code, so I've pushed the working solution to Github and there is a link at the bottom of the post so you can head over there and take a look yourself.

> Note: You will need your own Google Maps API key to enable the Maps to load (see resources below)

## Creating the Starting Point
I created the sample application by following the steps in the 'MAUI Maps' article on Microsoft Learn (see resources at the bottom of this post) and edited the `MainPage.xaml` file so that it would display the map;

```xaml
<?xml version="1.0" encoding="utf-8" ?>
<ContentPage xmlns="http://schemas.microsoft.com/dotnet/2021/maui"
             xmlns:x="http://schemas.microsoft.com/winfx/2009/xaml"
             xmlns:maps="http://schemas.microsoft.com/dotnet/2021/maui/maps"
             x:Class="MauiMaps.MainPage">
    <maps:Map x:Name="MyMap" />
</ContentPage>
```

In the code behind file for the MainPage, `MainPage.xaml.cs`, I added a simple method to add 500 pins in random locations across the UK.

```csharp
protected override void OnAppearing()
{
    base.OnAppearing();
    
    MyMap.MoveToRegion(MapSpan.FromCenterAndRadius(new Location(54.5, -3.0), Distance.FromKilometers(500)));

    AddRandomPinsToMap();
}

private void AddRandomPinsToMap()
{
    Random rand = new Random();

    for (var i = 0; i < 500; i++)
    {
        var latitude = rand.NextDouble() * (58.7 - 49.9) + 49.9;
        var longitude = rand.NextDouble() * (1.8 + 8.6) - 8.6;

        var pin = new Pin
        {
            Label = $"Location {i + 1}",
            Location = new Location(latitude, longitude),
            Type = PinType.Place
        };

        MyMap.Pins.Add(pin);
    }
}
```

I also updated the `.csproj` file so that only the Android application would be built,

```xml
<TargetFrameworks>net9.0-android;</TargetFrameworks>
```

The result of this is the first Android screenshot at the top of the post.

## Creating the MAUI Handler
The next step was to add the Handler, which is made up of a simple class that inherits from `Microsoft.Maui.Controls.Maps.Map` and another, partial, class that inherits from `Microsoft.Maui.Handlers.ViewHandler` - I've added these to the Controls and Handlers folders that I've created in the project.

I then needed to register the Handler within the `CreateMauiApp()` method of `MauiProgram.cs` as below;

```csharp
builder.ConfigureMauiHandlers(handlers =>
{
    handlers.AddHandler<ClusteringMap, ClusteringMapHandler>();
});
```

With the Handler classes registered I just needed to implement them, so I added a new file called `ClusteringMapHandler.Android.cs` within the `Platforms/Android` folder and rename the class itself to match the Handler class created above and made it `partial`.

> So, to be clear - the file is called `ClusteringMapHandler.Android.cs` but the partial class it contains is just `ClusteringMapHandler` - matching the class in the Handlers folder.

With all that in place I then updated the `MainPage.xaml` to use the new `ClustingMap`

```xaml
<?xml version="1.0" encoding="utf-8"?>
<ContentPage xmlns="http://schemas.microsoft.com/dotnet/2021/maui"
             xmlns:x="http://schemas.microsoft.com/winfx/2009/xaml"
             xmlns:local="clr-namespace:MauiMaps.Controls"
             x:Class="MauiMaps.MainPage">
    <local:ClusteringMap x:Name="TheMap" />
</ContentPage>
```

Running the application now displayed the map but didn't display any of the pins or allow me to change the map type from the regular `Street` appearance to `Satellite`. After a bit of digging around I found that although I didn't need to change any of the existing code, by introducing a Handler I now needed to map any of the properties I wanted to access from the standard Map to my new `ClusteringMap` - and that included the `Pins` and `MapType` properties. I also noticed that the map wasn't centering over the middle of the UK anymore so I also had to deal with the `MoveToRegion` method.

This is where the shared `ClusteringMapHandler` comes in, i.e. now the one in the `Platforms` folder. In here we need to add a `PropertyMapper` which will be passed to the inherited `ViewHandler` and as many properties and/or methods as we want to interact with.

I've updated the file as below;

```csharp
public partial class ClusteringMapHandler() : ViewHandler<ClusteringMap, PlatformView>(Mapper)
{
    public static IPropertyMapper<ClusteringMap, ClusteringMapHandler> Mapper =
        new PropertyMapper<ClusteringMap, ClusteringMapHandler>(ViewHandler.ViewMapper)
        {
            // Add property mappings here if needed
            [nameof(ClusteringMap.Pins)] = MapPins,
            [nameof(ClusteringMap.MapType)] = MapMapType,
        };

    private static partial void MapPins(ClusteringMapHandler handler, ClusteringMap customMap);

    private static partial void MapMapType(ClusteringMapHandler handler, ClusteringMap customMap);

    private partial void MapRegion(ClusteringMapHandler handler, ClusteringMap map, MapSpan region);
    
    public void MoveToRegion(MapSpan region)
    {
        MapRegion(this, VirtualView, region);
    }
}
```

Next we need to head over to the Android specific partial class, i.e. `ClusteringMapHandler.Android.cs`, and code it out so that we can map the two sides of the Handler.

Now there's quite a lot going on in this file, so I won't go into detail of each line but the highlights are;

- We need to override two methods from the `ViewHandler` that the shared handler class inherits, namely `CreatePlatformView` and `ConnectHandler` (there is a `DisconnectHandler` but we don't need that right now).
- We also need to provide the implementation for the property mappings defined in the shared Handler.
- Finally, there is an internal class that implements `IOnMapReadyCallback` and overrides the `MapReadyCallback` method.

When the `ClusteringMapHandler` is instantiated the overridden methods are called to create the `MapView`. In doing so the `OnMapReady` method on the `MapReadyCallback` is invoked to hook up the mappings to the properties we set up and handle any calls to `MoveToRegion` that may have been called before the Map was fully instantiated.

The property mappings are fairly straightforward and involve calling the same methods with the same parameters as you would with the regular Map object.

With all this in place we are now practically back where we started, with a map that will display 500 randomly dropped pins that will almost obscure the map - but, with the MAUI abstraction out of the way we now have the ability to access the underlying map.

## (Finally) Implementing Marker Pin Clustering
With the Handler in place and running we can now implement clustering and the good news is that now we have access to the Google Map that sits on the other side of the MAUI Mapping abstraction we can install a nuget package to do all the heaving lifting for us.

The nuget package we are looking for is `GoogleMapsUtils.Android.Maui` which at the time of writing is at version 1.0.2 and works fine for MAUI 9.0 as far as I can tell. The package details states that it supports .NET 7.0 and Android API v33 but if you look at the package on Github (see resources below) and look at the `.csproj` of the Android project you'll see that it is supporting Android 21 so backward compatibility shouldn't be a problem .... buy you'll be double-checking that right.

If you are planning on an iOS version of your app you will need to tweak the `.csproj` file a little so that the Android specific package isn't included in the iOS build. To ensure the package is only built for Android targets just moved the `PackageReference` into a new `ItemGroup` and apply a `Condition` as below;

```xml
<ItemGroup Condition="$(TargetFramework.StartsWith('net9.0-android'))">
    <PackageReference Include="GoogleMapsUtils.Android.Maui" Version="1.0.2"/>
</ItemGroup>
```

Next we need to create a simple DTO class that will be used by the Cluster Manager that is provided by the Google Map Utils package we just installed. This needs to be created somewhere within the `Platforms/Android` folder, I've just added it to the Handlers folder so it sits alongside the `ClusteringMapHandler.Android.cs` file.

The file is pretty simple, although you could include additional properties should you need them but we'll just implement the `IClusterItem` interface for now;

```csharp
using Android.Gms.Maps.Model;
using Com.Google.Maps.Android.Clustering;

namespace MauiMaps.Handlers;

public class ClusterMarker : Java.Lang.Object, IClusterItem
{
    public LatLng Position { get; set; }

    public string Snippet { get; set; }

    public string Title { get; set; }
}
```

Now all we need to do is update the `ClusteringMapHandler.Android.cs` file to implement clustering and the good news is that we're only talking about a handful of lines of code.

I've added a local variable to hold the ClusterManager to the top of the file;

```csharp
private ClusterManager? _clusterManager;
```

Within the `MapPins` method I've replaced the `MarkerOptions` with our new `ClusterMarker` above. I'm also storing the markers in a temporary list which is then passed into the ClusterManager. The updated method looks like this;

```csharp
private static partial void MapPins(ClusteringMapHandler handler, ClusteringMap clusteringMap)
{
    var googleMap = handler._googleMap;
    if (googleMap == null)
    {
        return;
    }
    
    googleMap.Clear();
    
    var markers = new List<ClusterMarker>();
    foreach (var pin in clusteringMap.Pins)
    {
        var marker = new ClusterMarker
        {
            Position = new LatLng(pin.Location.Latitude, pin.Location.Longitude),
            Title = pin.Label,
            Snippet = pin.Address
        };
        
        markers.Add(marker);
    }

    if (handler._clusterManager != null)
    {
        handler._clusterManager.ClearItems();
        handler._clusterManager.AddItems(markers);
        handler._clusterManager.Cluster();
    }
}
```

Finally, we just need to update the `MapReadyCallback` so that the `ClusterManager` is instantiated correctly and that the Map uses it when the map is panned and zoomed.

Just add the following lines in the `OnMapReady` method after the `handler._googleMap` property is set;

```csharp
handler._clusterManager = new ClusterManager(handler.Context, handler._googleMap);
handler._googleMap.SetOnCameraIdleListener(handler._clusterManager);
```

That's it - you have now implemented Clustering on the Android Maps using MAUI.

Simple huh 😁

I do have some follow up posts planned with iOS Maps in my sights - watch this space.

### Resources:
- Sample Application on Github: <a href='https://github.com/OnTheFenceDevelopment/MauiMaps.git' target='_blank'>https://github.com/OnTheFenceDevelopment/MauiMaps.git</a>
- MAUI Maps on Microsoft Learn: <a href='https://learn.microsoft.com/en-us/dotnet/maui/user-interface/controls/map?view=net-maui-9.0' target='_blank'>https://learn.microsoft.com/en-us/dotnet/maui/user-interface/controls/map?view=net-maui-9.0</a> 
- Creating Google Maps API Keys: <a href='https://developers.google.com/maps/documentation/android-sdk/get-api-key' target='_blank'>https://developers.google.com/maps/documentation/android-sdk/get-api-key</a>
- GoogleMapsUtils.Android.Maui on Github:  <a href='https://github.com/tranhoangnam16705/GoogleMapsUtils' target='_blank'>https://github.com/tranhoangnam16705/GoogleMapsUtils</a>
