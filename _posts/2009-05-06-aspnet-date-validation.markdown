---
layout: post
title:  'ASP.NET Date Validation'
date:   2009-05-06 00:00:00
tags:   asp-net
---
A simple requirement at first sight not one with a simple solution. You have an ASP.NET page which allows the user to specify a date which is then used as an input parameter for an SQL Stored Procedure. What is stopping the user from entering ‘Hello World’ and submitting it?
Answer, nothing unless you configure some sort of validation.
<!--more-->
So what sort of validatator do you use? At first sight there does not appear to be a suitable candidate but to enforce a specific format, e.g. dd/mm/yyyy, the **RegularExpressionValidator** could be called into play here. This will stop the user from entering data in the wrong format but what about invalid date such as 32/12/07 or 29/02/07? How do make sure that the date is a real one?
 
This is where I was a little while ago and I decided to opt for the CustomValidator, writing my own Server Side and Client Side validation functions that Cast the user input to a DateTime type and catching any exceptions.
 
While this worked I was not too happy with the operation of the code. Then I watched a PodCast from <a href="http://www.dnrtv.com/default.aspx?showNum=75" target="_blank">dnrTV</a> where <a href="http://www.peterblum.com" target="_blank">Peter Blum</a> demonstrated some lesser known features of the ASP.NET validator controls. He used a CompareValidator to check for a valid date – a CompareValidator??!!
 
I normally associate the CompareValidator to check one value against another, e.g. Password and Confirm Password. So how does it validate a date?

1. Simply add a CompareValidator and set it’s ControlToValidate to the textbox containing the date.
2. Now locate the Operator property and Select DataTypeCheck from the dropdown list.
3. Finally set the Type property to Date and you’re done.

So there you have it – no need for custom code on Server or Client side.