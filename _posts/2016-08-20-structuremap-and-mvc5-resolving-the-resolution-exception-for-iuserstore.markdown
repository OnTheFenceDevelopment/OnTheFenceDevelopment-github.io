---
layout: post
title:  'StructureMap and MVC5 – Resolving the resolution exception for IUserStore'
date:   2016-08-20 00:00:00
tags:   asp-net-mvc inversion-of-control
---
I’m currently working on an MVC5 website which uses StructureMap for Inversion of Control operations. Everything was working fine but then I started to get exceptions when I ran the application and attempted to login (not sure if Update 3 was responsible for surfacing this problem but it certainly worked without any problems previously)

![structure map error](/assets/images/structuremap-error.png)
<!--more-->
Now, clicking ‘Continue’ in Visual Studio (or pressing F5) allowed the application to continue with no further issues but I wanted to get to the bottom of this issue – I certainly didn’t want this coming back at me when the site goes live.

Clicking on ‘View Detail’ I found the following error message which seemed surprisingly informative;

>No default Instance is registered and cannot be automatically determined for type ‘IUserStore<ApplicationUser>’
<br><br>
There is no configuration specified for IUserStore<ApplicationUser>
<br>
>1. new ApplicationUserManager(*Default of IUserStore<ApplicationUser>*)
2. MyDiveLogs.ApplicationUserManager
3. Instance of MyDiveLogs.ApplicationUserManager
4. new AccountController(*Default of ApplicationUserManager*, *Default of ApplicationSignInManager*)
5. MyDiveLogs.Controllers.AccountController
6. Instance of MyDiveLogs.Controllers.AccountController
7. Container.GetInstance(MyDiveLogs.Controllers.AccountController)

So – what does that mean?

Well, in a nutshell it means that StructureMap could not determine how to create a concrete instance of IUserStore, which is required to create an ApplicationManager instance which is in turn required to create the AccountController.

This is caused by StructureMap being ‘greedy’ and will attempt to use the constructor with the most parameters. In the case of the AccountController it will ignore the parameterless constructor and try to use the one that requires an ApplicationUserManager (the root of my issue) and an ApplicationSignInManager.

Having trawled around the web trying to locate a resolution I’ve found a couple of options;
1. Tell StructureMap to use the parameterless constructor instead or
2. Tell StructureMap how to instantiate the instances correctly

<br>
The first option is a simple matter of adding an attribute to the AccountControllers parameterless constructor as below;

```csharp
[DefaultConstructor]
public AccountController()
{
}
```

This works fine and if you are worried about how the AccountController will function without being given an ApplicationUserManager and ApplicationSignInManager to use then fret not – take a look at its UserManager and SignInManager properties. The getter will perform a null check and create the appropriate instance as required.

Interestingly, this helps us with the second option for resolving this problem, i.e. telling StructureMap how to create the instances for us.

Locate the IoC.cs class (mine was in a folder called DependancyResolution in the main MVC project) and update the Initialize method as below (note that you may have to import some namespaces)
```csharp
public static IContainer Initialize() {
    return new Container(c =>
    {
        c.AddRegistry<DefaultRegistry>();

        // ADD THESE LINES
        c.For<Microsoft.AspNet.Identity.IUserStore<ApplicationUser>>().Use<Microsoft.AspNet.Identity.EntityFramework.UserStore<ApplicationUser>>();
        c.For<System.Data.Entity.DbContext>().Use(() => new ApplicationDbContext());
        c.For<Microsoft.Owin.Security.IAuthenticationManager>().Use(() => HttpContext.Current.GetOwinContext().Authentication);

    });
}
```
And that’s it – you should now be able to access Actions within the AccountController without this exception being thrown.