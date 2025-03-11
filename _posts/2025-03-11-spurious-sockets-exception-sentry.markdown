---
layout: post
title:  'Spurious Sockets Exception reported by Sentry'
date:   2025-03-11 00:00:00
tags:   development maui mobile-development sentry
---
While finishing off the migration of my <a href='https://onthefencedevelopment.com/smite-scoreboard-for-android-ios.html'>Smite Scoreboard</a> app to MAUI and having completed the bulk of the work I turned my attention to replacing <a href='https://onthefencedevelopment.com/smite-scoreboard-for-android-ios.html' target='_blank'>the soon-to-be retired</a> <a href='https://onthefencedevelopment.com/smite-scoreboard-for-android-ios.html' target='_blank'>App Center</a> for a suitable alternative capable of capturing exceptions and providing enough information to investigate them effectively.

After reviewing a number of alternatives I opted for <a href='https://www.sentry.io' target='_blank'>Sentry</a>, mainly because of the presence of a decent free tier that offered the basic features I require with decent data retention policy.

After configuring a project on my shiny new Sentry account, adding the required initialisation code to the MAUI project and replacing all the AppCenter references it was time to try it out .... and that's where the trouble started.
<!--more-->

Temporary code was added to temporarily trigger exceptions to verify everything was wired up correctly and was impressed by the details that Sentry had collected - even without any debug symbol files being uploaded. 

However, something quite unexpected was also being reported - an exception I've not seen before and while it didn't prevent the app from starting and running normally it wasn't something I could push to production until I'd fully investigated and resolved the issue.

![Sentry Issue Report from Smite Scoreboard for System.Net.Sockets.SocketException](/assets/images/sentry-sockets-exception.png)

Looking at the stack trace this is an `AggregateException` which is normally associated with asynchronous code and this was confirmed by the exception message;

> A Task's exception(s) were not observed either by Waiting on the Task or accessing its Exception property. As a result, the unobserved exception was rethrown by the finalizer thread.

Unfortunately there wasn't enough information in the issue details for me to identify the offending code so it was not possible to simply add a breakpoint and drop into the regular debugging loop that we all know so well. 

This meant that I needed to adjust my approach, dropping breakpoints on general Exception Handlers Sentry had replaced App Center and into the Global Exception Handler I'd implemented to capture any unhandled exceptions that may occur but none of these were hit.

During this process I determined that the exception was being thrown during the app startup, before the UI came to rest on the app landing page - this would at least limit the code I needed to review. 

It took a little while to work out when the exception was being thrown but I'm still not 100% sure why it is happening, but appears to happen when the `App.MainPage` is being set to a new instance of `AppShell` within the `App.xaml.cs` class.

### A breakthrough - of sorts!
This led me to a moment of clarity ..... 

> This isn't my code causing this issue - it's something else!

While this was encouraging it wasn't enough for me to draw a line under the issue and move on - no, that's not how I roll, I need to be sure. But how was I going to get the certainty?

Well it turned out to be pretty easy really - I just created a brand new, vanilla solution using `File > New Project > MAUI`, imported the Sentry package via Nuget and wired everything up.

I started up the new app and boom .... there it was, the same exception as before with only the most minimal of code changes. 

![Sentry Issue Report from new Project for System.Net.Sockets.SocketException](/assets/images/sentry-sockets-exception-new-solution.png)

Now I was certain that the issue was not of my making (not directly anyway) as I could replicate it using the built-in solution templates ..... but what was causing it?

Well I'm sorry to say .... I don't know. I have burnt quite a few hours getting to this point when I could have been getting the app pushed to the respective stores instead of chasing this issue around.

This is what I can tell you though:
- I use a Mac - not a Windows based system
- I develop using JetBrains Rider - not Visual Studio Code
- The issue only affects physical Android and iOS devices and NOT emulators/simulators
- While the exception type was always the same the message did differ slightly between Android and iOS (see below)
- The issue only manifests when I start the app from Rider in Debug mode, i.e. starting the app from Rider is Release mode or by tapping on the launch icon on the device itself does not seem to trigger the exception

### Solution - of sorts!
I'm not normally one for suppressing errors but I really don't think this will be an issue for this particular app which is pretty simple, having no local database and requiring no internet access - so that's what I'm going to do and fortunately the Sentry implementation provides a degree of extensibility that will facilitate this.

First I create a new class called `SentryExceptionTypeFilter`:

```csharp
using Sentry.Extensibility;

namespace SmiteScoreboard;

public class SentryExceptionTypeFilter<TException> : IExceptionFilter where TException : Exception
{
    private readonly Type _filteredType = typeof(TException);
    public bool Filter(Exception ex) => _filteredType.IsInstanceOfType(ex);
}
```

This was then used as part of the `UseSentry` initialisation within the `CreateMauiApp` in the `MauiProgram` class

```csharp
using Microsoft.Extensions.Logging;

namespace SmiteTesting;

public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();
        builder
            .UseMauiApp<App>()
            .UseSentry(options =>
            {
                options.Dsn = "<DATA SOURCE NAME FROM SENTRY PORTAL>";
#if DEBUG
                options.AddExceptionFilter(new SentryExceptionTypeFilter<System.Net.Sockets.SocketException>());
#endif
            })
            .ConfigureFonts(fonts =>
            {
                fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
            });

        return builder.Build();
    }
}
```

With these in place I was able to run the application in Debug mode with no exception being reported to Sentry. The preprocessor directive will also ensure that this only affects Debug builds so Release builds sent to Production would not have filtering applied and that seems to be the best I can do right now.

### Conclusion
All I can conclude from this is that the exception is due to some incompatibility between MAUI and Rider running on a Mac when building in Debug mode and targeting physical Android and iOS devices.

Not having a suitable Windows system to hand right now I can't really check it out there but as/when/if I do I'll be sure to continue with my investigations. For now if you are seeing any of the following exceptions turning up in your Sentry issues while debugging using Rider on a Mac, don't despair - it's quite probably not your fault.
- `System.Net.Sockets.SocketException` - with message of `Operation Canceled` on Android (not a typo btw, just US spelling)
- `System.Net.Sockets.SocketException` - with message of `Connection Refused` on iOS
- `System.Net.Sockets.SocketException` - with message of `No route to host` on iOS

With all that out of the way - v3 of Smite Scoreboard will hit the stores in a few days, once I've finalised testing and sorted my Apple certificates & provisioning profiles.

