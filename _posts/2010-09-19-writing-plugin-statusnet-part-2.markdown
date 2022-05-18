---
layout: post
title:  'Writing a plugin for Statusnet : Part 2'
date:   2010-09-19 00:00:00
tags:   statusnet microblogging
---
In a [previous post]({% post_url 2010-06-07-writing-plugin-statusnet-part-1 %}) previous post I configured my development environment so that I could start work on my Statusnet plugin. Well, a little later that anticipated, I’ve managed to get enough time together to get a working plugin – although it’s not perfect by any means.
<!--more-->
Initially I had wanted to use the PingFM API to send notices from our internal statusnet instance through PingFM to configured services such as Twitter, LinkedIn and Facebook. However, to get an API key you need to apply to PingFM directly and this is a lengthy process (just look at their <a href='http://groups.google.com/group/pingfm-developers' target='_blank'>Google Groups page</a> and you’ll see people chasing up requests which are weeks/months old). While my approval was pending I opted to develop the plugin to take advantage of PingFMs ‘Post By EMail’ functionality. Basically each user has a unique email address which they can send posts to. These are then distributed to the services they have configured on their account. This, in my opinion, is not as slick an approach as using the API but it’s better than nothing.

However, shortly after getting the plugin working I received approval from PingFM and subsequently I updated the code to send posts through the API. This didn’t really require a lot of changes to the code so I’ll just concentrate on the API approach.

Cast your mind back to my previous post and you will recall that I downloaded a Helper Plugin which I saved into the /local folder beneath the statusnet installation. This plugin basically gave me a basic template to work with so after removing all of the functions I did not need I saved the template as PingFMPlugin.php in the /local folder.

The specification of the plugin states that only certain uses can post to PingFM and moreover, only selected notices should be posted, not all of them. I decided to implement a !pingfm group and basically any notice posted to this group, i.e. containing the text !pingfm, would be processed accordingly.

The first thing to do was to determine whether the user was authorised to post to PingFM and to do this I opted for a simple text file containing colon delimited usernames and associated Application keys (which the each user can access by logging into PingFM and clicking the Application Keys link) with each line being terminated by a semi-colon (as below).
```
jbloggs:62228f3fb09b60cc73c34d6dd8149fe9-0987654321;
```
So now all I need to do is to scan this file (in our case less than half a dozen records) and compare the usernames with the currently logged in user, if there was a match then the user was authorised and the notice would be sent to PingFM via the API.

So our OnEndNoticeSave function now looks like this:
```php
function onEndNoticeSave($notice)
    {
        // This event will fire once the notice has been saved

        // Was the notice sent to the !pingfm group
        $pos = strpos($notice-&gt;content, '!pingfm');
        if($pos !== false) {

            // If so, resolve the list of 'authorised' PingFM posters and match to the appropriate PingFM user
            // # Need PHP function to read usermappings file into a local array
            //      mumble_username:web_key
            //      jbloggs:62228f3fb09b60cc73c34d6dd8149fe9-0987654321 

            $userFile = file_get_contents('/var/www/statusnet/local/userMappings.txt');
            $userMappings = explode(";",$userFile);
            $user = common_current_user();

            // ... check for matching username
            foreach($userMappings as $mapping) {
                if(strpos($mapping,$user-&gt;id) !== false) {

                    // User is authorised to post to PingFM - process notice

                }
        }
    }
```
So far we have a $notice object which contains the original notice and a $mapping object which contains the username and api key of the user who has posted the notice into the PingFM group. What we need now is to package this up in a suitable form to send to the PingFM API and for this I’m using cURL and it’s <a href='http://php.net/manual/en/function.curl-exec.php' target='_blank'>curl_exec</a> command in particular.

The <a href='http://groups.google.com/group/pingfm-developers/web/api-documentation' target='_blank'>PingFM API documentation</a> states that the user.post method requires the developer api key, user application key, post method and the notice body itself.

This is how I’ve implemented this in the code:
```php
if(strpos($mapping,$user-&gt;id) !== false) {
    // The mapping will be in the form username:pingfm_application_key
    //  split these out into an array
    $userDetails = explode(":",$mapping);
    // $userDetails[0]: Username
    // $userDetails[1]: PingFM User Application Key

    // Trim off the !pingfm group 'tag'
    $trimmedNotice = str_replace('!pingfm','',$notice-&gt;content);

    $curl = curl_init('http://api.ping.fm/v1/user.post');
    $curl_post_data = array(
                "api_key" =&gt; "",
                "user_app_key" =&gt; $userDetails[1],
                "post_method" =&gt; "default",
                "body" =&gt; $trimmedNotice,
                );
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
   curl_setopt($curl, CURLOPT_POST, true);
   curl_setopt($curl, CURLOPT_POSTFIELDS, $curl_post_data);
   $curl_response = curl_exec($curl);
   curl_close($curl);
```

[The above code can be downloaded here]({{'/assets/downloads/PingFmPlugin.txt' | relative_url }})

Note the I trim off the !pingfm text from the original notice as this really only has an internal meaning, i.e. we are using it as a flag or trigger to forward the notice.

So that’s it. With this in place and the usernames/application keys in the /var/www/statusnet/local/userMappings.txt file the plugin enabled in config.php (see previous post) we are good to go. Authorised users can append their notices with !pingfm and in addition to the internal stream they will be sent out to their configured services, such as Twitter and FaceBook. All from the webportal/client they are currently used to.