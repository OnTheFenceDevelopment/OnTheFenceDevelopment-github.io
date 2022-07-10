---
layout: post
title:  'Online Tool of the Month – webhook.site'
date:   2018-05-31 00:00:00
tags:   online-tool-of-the-month
---
If you’ve ever worked with a third party API that uses Webhooks you will appreciate the power and flexibility that they provide. Instead of having to poll for updates yourself you can rely on the API to call you instead.

I first came across webhooks when developing a web application that implemented <a href='https://stripe.com' target='_blank'>Stripe</a> as it’s payment gateway for monthly/annual subscription payments.

In this instance the webhooks would fire when specific events occurred; e.g.

- Payment was successful
- Payment failed (and will be retried)
- Subscription Cancelled (manually or after repeated, automated attempts for payment have failed)

Long polling for this information would be a nightmare and having the webhook contact an endpoint on your API removes this headache – but does introduce another.
<!-- more -->
When I was developing the webhook callback endpoints it was difficult to see what data was being passed in the request. Stripe’s API documentation was good but there is nothing like actually seeing the data for yourself.

Attempting to route calls from a remote webhook to my development environment was somewhat problematic and I never quite managed to get it working. In the end I created a simple WebAPI service that I deployed to a virtual private server which would receive the webhook request (as JSON) and simply email it to me. Simple effective but a bit of a pain.

Recently I was looking at integrating an existing product with JIRA for another client and low and behold, it’s API provided webhooks – but before dusting off my WebAPI project I took a look to see if there were any alternatives out there – and, not surprisingly there was.

Enter <a href='https://webhook.site/' target='_blank'>webhook.site</a> – a simple but powerful web application that basically adds a lot of polish to the quick and dirty solution I had previously developed.

When you navigate to the site it will generate a unique url that you can use to configure the webhook.

Then you can either wait for something to hit it (if you are debugging something live) or fire up your development environment and go through the process that will trigger the webhook to fire. Some services, like Stripe, provide a function to allow you to simply trigger the webhook with dummy data.

Once the webhook.site endpoint receives the request it will display the request and it’s payload.

This will prove invaluable if you are trying to debug inconsistent data operations and webhook failures.

Maybe it was a typo in a property name, maybe a data type mis-match, but without being able to actually see the data being sent it is impossible to determine what is going wrong.