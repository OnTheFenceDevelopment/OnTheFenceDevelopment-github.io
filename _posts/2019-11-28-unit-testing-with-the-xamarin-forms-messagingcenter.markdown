---
layout: post
title:  'Unit Testing with the Xamarin.Forms MessagingCenter'
date:   2019-11-28 00:00:00
tags:   xamarin xamarin-development development
---
While we all know that Test Driven Development (TDD) is a good idea, in practice it’s not always viable. It could be a time constraint, a resource issue or the project just doesn’t warrant it.

While TDD may sometimes be an option, unit tests themselves should really be considered to be a must. They will save you a lot of time in the long run and while they may not prevent you from going grey, ask me how I know, they will reduce your stress levels when bugs raise their ugly heads.

So, whether you write your tests before you write the code or vice-versa, if you are developing production code you really should write tests to cover it.
<!--more-->
Now, one of the requirements for unit testing is the ability to mock out a components dependencies so that you are only testing the component itself.

Normally you would use the Dependancy Injection pattern to help develop loosely coupled systems but Xamarin.Forms has a few components which can be a fly in the ointment – one of these is the MessagingCenter.

MessagingCenter allows you to send messages from one component to another using the publish-subscribe pattern to do so in a loosely coupled manner.

It’s build into Xamarin.Forms and is very easy to use;

On one side of the process you will send (publish) your message;
```csharp
MessagingCenter.Send(this, "ForceLogout", message);
```
One the other side you will subscribe to the message;
```csharp
MessagingCenter.Subscribe<WelcomePage, string>
  (this, "ForceLogout", async (sender, arg) => {
    await ForceLogout(arg); 
});
```
The problem is that MessagingCenter cannot be mocked and injected into your class – so how do you unit test it?

Well, the answer is embarrassingly straightforward – you may already be using a similar approach to test for events being raised (I know I am).

Basically, all we need to do is to subscribe to the message in our test, setting a flag when the message is received;
```csharp
var messageSent = false;

// Arrange 
MessagingCenter.Subscribe<WelcomePage, string>
  (this, "ForceLogout", (sender, arg) =>
        {
            messageSent = true;
        });

// Act
.
.
// Assert
Assert.IsTrue(messageSent);
```
It really is as simple as that. While we can’t mock out the MessagingCenter, we can simply subscribe to the message we are interested in – just as we would in the application code itself.