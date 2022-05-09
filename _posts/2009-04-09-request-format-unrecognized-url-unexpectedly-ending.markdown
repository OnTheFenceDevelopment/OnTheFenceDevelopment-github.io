---
layout: post
title:  'Request format is unrecognized for URL unexpectedly ending in …'
date:   2009-04-09 00:00:00
tags:   excel web-services
---
Another thing that you think would be straight forward but turned out to be quite frustrating.
I have written Web Services in the past without any problems but recently when I was writing one specifically for Excel (2007) I could not get it to link properly.
 
Running the web service in VS2005 resulted in the test page we all know and love and the Invoke button worked fine! Taking the URL and pasting it into Excel resulted in a “Request format is unrecognized for URL unexpectedly ending in…” error!
 
It turns out that this is by design – sort of. Basically the HTTP Get and HTTP Post protocols are disabled by default (not the case in .NET 1.0). Enabling them in is simple matter of adding the following to the system.web section of the web.config:
```
<configuration>
  <system.web>
    <webServices>
      <protocols>
       <add name="HttpGet"/>
       <add name="HttpPost"/>
      </protocols>
    </webServices>
  </system.web>
</configuration>
```
TaDa! it worked.
 
If you want some more information then <a href="http://support.microsoft.com/default.aspx?scid=kb;en-us;819267" target="_blank">click here to go to the Knowledge Base article [KB819267]</a>