---
layout: post
title:  'Parsing Json Dates from MVC Controller Actions in Client-Side Javascript'
date:   2015-02-05 00:00:00
tags:   javascript
---
Recently I’ve been working on a couple of MVC projects where I was using jQuery to perform an AJAX call to a controller action which in turn returned some JSON data. This is pretty run of the mill stuff but each time I hit a problem with dates.

Dates are always a problem in development, whether it’s storing them in a database or displaying them on the screen. How do you deal with timezones and formatting between cultures? As it turns out the solution to my issue was pretty straightforward and a single line of Javascript resolved the problems.
<!--more-->
Consider the following MVC Controller Action
```javascript
public ActionResult GetJSONData(){
    return Json(new{ Id = 1, 
                     Name = 'Joe Bloggs', 
                     DateOfBirth = '21/05/1970'});
}
```
If you now add a JQuery AJAX call from a View like so;
```javascript
$.ajax({
    url: 'Home/GetJSONData',
    method: 'GET'
}).success(function (data) {
    .
    .
    $('#dateOfBirth).text(data.DateOfBirth);
});
```
You may expect the **DateOfBirth** value to be displayed as defined in the controller action but it will instead be displayed as “**/Date(1423124521)/**”

You’ll probably recognise that as a <a href='http://en.wikipedia.org/wiki/Unix_time' target='_blank'>UNIX epoch Timestamp</a> value and you’ll know that Javascript has a built-in function to convert it to a Date object – but what’s the best/easiest way to actually get the value out of the JSON data, i.e. remove the surrounding text?

I looked at Regular Expressions and string manipulations etc but in the end I settled on this;
```javascript
var dateOfBirth = 
    new Date(parseInt(data.DateOfBirth.substr(6)));
```
The ‘trick’ (if that’s the right word here) is the parsing of the string to an Int while only removing the leading text – the trailing characters, “)/”, are ignored by the conversion and a corresponding Date object is created.

Of course, stripping off the trailing characters would certainly have been possible but that looked quite ugly in comparison. This single line of code does the job so there is no need to complicate the process and degrade readability/maintainability.