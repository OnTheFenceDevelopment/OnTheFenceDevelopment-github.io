---
layout: post
title:  'Keeping OpenDNS Updated with Ubuntu Server'
date:   2009-08-15 00:00:00
tags:   linux ubuntu open-dns
---
In [a previous post]({% post_url 2009-06-16-command-line-email-ubuntu-server-failed-tweeting-instead %}) I explained how I configued my Ubuntu Server to send a tweet whenever my external IP address changed. Well I found that no only did my external IP address change with startling regularity but it was also causing my OpenDNS settings to become out of sync.

Basically in the house we have a single PC and the rest are laptops. Now I have the OpenDNS updater on the PC and this will syncronise my external IP address with OpenDNS when it is turned on – but what if the IP address changes and that PC is not turned on.? Answer, all my parental controls go out of the window!
<!--more-->
Now I could install the OpenDNS updater on the laptops but the problem I see there is that if one of them connects to another network, via WiFi for example, then my OpenDNS settings will be updated with the networks external IP address – not what I want!

So it made sense to update my Ubuntu Server so that when it sends it’s tweet it can also update OpenDNS. The problem is that there is no supported updater for Linux – but then there doesn’t need to be as we have all we need anyway – wget to the rescue.

If you refer back to [the original post]({% post_url 2009-06-16-command-line-email-ubuntu-server-failed-tweeting-instead %}) you will see that the checkipaddress script will only tweet if the IP address has changed. So I just added the following line [all one line] inbetween the twitter and logger commands:

```
wget -O - -q --http-user=YOURUSERNAME 
              --http-passwd=YOURPASSWORD 
                    https://updates.opendns.com/nic/update
```
Now, when the IP Address changes, I get a tweet and OpenDNS gets updated. Now there will only ever be a few minutes lag between the change and the update so my parental controls should not be unduly affected.

All I have to do now is to contact my ISP and ask them to investigate why my IP address changes so frequently (numerous times per day – I kid you not!).