---
layout: post
title:  "Calling Code-Behind Method from JavaScript"
date:   2009-03-29 00:00:00
tags:   vb.net javascript
---

>While this page is still popular [I have blogged about an alternate method for sending data from client to server using Javascript]({% post_url 2021-04-03-using-client-side-jquery-send-data-server-side-net %}). You may want to check that out while you are here.

It shouldn’t be too hard should it? You want to use some Javascript on the client-side to call a method on in the Code-Behind of your aspx page – how hard can that be? Surely it must be possible.
I was developing a DotNetNuke module (so the code below is VB.NET and not C#) which would allow the user to search for locations using Virtual Earth and store the latitude and longitude (as well as the zoom level) in a database.
 
The problem is that the Virtual Earth API is a Javascript (and hence Client-Side) technology and in the normal scheme of things cannot access .NET code on the server. So how do you do it? How do you get a Javascript function to call a Server-Side method – Is it even possible?
 <!--more-->
Well yes it is – and it ain’t that difficult either 🙂
 
Here is a sample that I used:
 
In the .aspx source code (actually in the `<head>` section of the page):
```javascript
function geoLock()
{
    var loc = map.GetCenter();
    var args = loc.Longitude + ":" + loc.Latitude + ":" + map.GetZoomLevel();
    performGeoLock(args,"");
    return false;
}

function geoLockComplete(result)
{
    if(result = 1)
    {
      document.getElementById("geoLockResult").innerHTML = 'GeoLock Successful';
    }
    else
    {
      document.getElementById("geoLockResult").innerHTML = 'GeoLock Failed';
    }
}
```
I also had a button with the onclick event set to `onclick=’geoLock()’`
 
In the Code Behind I had the following:
 
After the Page/Class definition add the following interface implementation:
```vb
Implements System.Web.UI.ICallbackEventHandler
```
In the Page Load:
```vb
' Create Callback Reference
Dim cbReference As String
cbReference = Page.ClientScript.GetCallbackEventReference(Me, "arg", "geoLockComplete", "context")

' Create Callback Script
Dim callbackScript As String = ""
callbackScript += "function performGeoLock(arg, context) { " + cbReference + "} ;"


' Register the Script
Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "performGeoLock", callbackScript, True)
```
You will also need to implement the RaiseCallbackEvent and GetCallbackResult methods.
```vb
Public Sub RaiseCallbackEvent(ByVal eventArgument As String) Implements System.Web.UI.ICallbackEventHandler.RaiseCallbackEvent
    ' [Your Logic in Here]
    ' Need to Set Value to be passed back to Client Script
    result = GeoBlogController.performGeoLock(newGeoLock)
    ' Note: result is an Int32 with Page Level Scope
End Sub

Public Function GetCallbackResult() As String Implements System.Web.UI.ICallbackEventHandler.GetCallbackResult
    ' Pass Back Info Value
    Return result
End Function
```
And that’s it.
 
When the user clicks the button the client-side geoLock() method is called.
 
It in turn creates an args variable (which in this case holds a colon separated list of values) and calls the performGeoLock() callback method.
 
The code in the Code Behind `RaiseCallbackEvent` method is executed performing some logic and setting the value of a return variable that will be passed back to the client script via the GetCallbackResult method.
 
Finally the client side method specified in the CallBackReference (in this case geoLockComplete) is called and passed the return value from the Code Behind methods.
 
I hope you followed all that (easier to do than to describe) but if not then take a look at <a href="http://msdn2.microsoft.com/en-us/library/ms153103.aspx" target="_blank">http://msdn2.microsoft.com/en-us/library/ms153103.aspx</a> which provides both explanation and example.
