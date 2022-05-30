---
layout: post
title:  'Stackify Prefix – first thoughts'
date:   2017-03-10 00:00:00
tags:   visual-studio web-development tools
---
Listening to one of my favorite podcast (<a href='http://www.dotnetrocks.com' target='_blank'>.Net Rocks</a>) I heard a plug for the <a href='https://stackify.com/prefix/' target='_blank'>Stackify Prefix</a> tool which claims to help the developer fix problems before anyone else sees them – a bold claim. Well as I am currently working on a greenfield development project I decided to give is a whirl – it’s free after all so why not.

Now I was not expecting to find too much wrong with the application and thankfully I was right – but I was getting errors.

![stackify interface](/assets/images/stackify_invalid_contract_exception.png)
<!--more-->
The highlighted call is to a WebAPI method from an AngularJS controller (a JavaScript file on the client) and as you can see from the right hand pane it does succeed. In fact the data is returned as I’d expect and the application works without any issue. So why is Prefix flagging this?

Well, looking at the stack trace a little more carefully I see that the exception is being raised by the XmlMediaTypeFormatter when it is creating it’s default serializer. But the WebAPI is returning JSON so why it is spinning up an XML serialiser?

Well, my WebAPI endpoint took this form:

{% gist c8bc6729ad09d3b60579f191ffafeec7 %}

The problem is on line 8 where I’m returning the OK status with the required content – which is an anonymous object that I’ve just put together on the fly. The WebAPI is configured to accept the ‘application/json’ header and to use an appropriate JSON Formatter – which it does.

The problem is that I still have the default XML Formatter in the list and for some reason the framework is trying to use it to serialize my anonymous object – and failing (silently).

So all I need to do is to remove the Formatter during the WebAPI registration – within WebApiConfig.cs in the App_Start folder (see line 12 below).

{% gist 5441c335465d87e2c9addb19d29eed2c %}

Now this was fairly trivial but a bug is a bug and as we know – exceptions are expensive. They take time to raise while they pull the required information together and work their way through to the calling code – which in this instance appeared to simply discard it. A small performance hit but if this scaled then it could have become a bigger problem in the future – and probably harder to find.

Prefix highlighted it straight away and the issue is now fixed. It never made it to production, in fact it never made if off my desk – it was Pre-Fixed!