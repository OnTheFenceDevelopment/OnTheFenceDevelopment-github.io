---
layout: post
title:  'Dynamic Items in MAUI Shell'
date:   2023-08-27 00:00:00
tags:   mobile-development maui xamarin
---
With support for Xamarin.Forms due to end in May 2024 and with MAUI maturing into a viable replacement I decided it was time to migrate my pet and portfolio projects, namely the Smite Scoreboard and Motorhome Stopover apps.

Both written using Xamarin.Forms, these apps are deployed to the App and Play Stores and I consider them as being supported and therefore under active development. With that in mind I need to keep them up to date, even if no features are being added or bugs fixed.

Why? Well, both Stores require apps to be built to the most recent version of the appropriate platform SDK and to do that I need to be using the latest versions of Xamarin/MAUI so if I let these codebases fall behind too far I'll need to bring everything up to date before I can fix what may be an urgent issue - so best to do that work up front. Right now that work means migrating to MAUI.

I'm starting with the Smite Scoreboard application because it is the less complex of the two - but that doesn't mean it doesn't have it's complexities. 

The biggest headache I've had to date has been replicating the navigation that is currently implemented using Xamarin.Forms Master/Detail views and needs to be migrated to <a href='https://learn.microsoft.com/en-us/dotnet/maui/fundamentals/shell/' target='_blank'>MAUI Shell</a> - in particular the <a href='https://learn.microsoft.com/en-us/dotnet/maui/fundamentals/shell/flyout' target='_blank'>Flyout Navigation</a>.
<!--more-->

The Smite Scoreboard app navigation goes something like this:
- User selects the Game type, i.e. Individual or Team
- User enters player names and optionally takes their photo
- When all players are configured the user can start the Game
- The Game page is then displayed and the Game can start with scores being entered

The navigation requirements are such that the user can abandon the Player/Team configuration or the Game itself, and to do this the appropriate menu options need to be added to the Shell Flyout - but they should only be displayed in the correct context.

- Abandon Player Entry should only be displayed when the Player Entry page is displayed
- Abandon Game should only be displayed when the Game page is displayed

The current implementation looks like this:
![current smite menus](/assets/images/smite-menus.png)

Sounds simple and using Master/Detail it was pretty straightforward but this isn't really the way the Shell works out of the box - however, it is possible to change it's opinionated approach and override the default behaviour.

I tried numerous approaches but they either didn't work or the code just didn't smell right. I trawled the internet for code examples but I couldn't find anyone trying to achieve quite the same thing so the code I found just didn't cut it.

I finally got everything working as I wanted with the code pretty clean - but we'll get to that later.

### My Solution
The 'problem' I had was being able show or hide menu items in the Shell Flyout based on the page being displayed.

Having tried to provide an Item Template via <a href='https://learn.microsoft.com/en-us/dotnet/maui/fundamentals/shell/flyout#define-flyoutitem-appearance' target='_blank'>`Shell.ItemTemplate`</a> markup in `AppShell.xaml` I knew it was possible to define how the Flyout items are displayed but didn't realise that I could actually swap out the <a href='Shell.FlyoutContentTemplate' target='_blank'>entire Flyout content</a>, i.e. Header, Items and Footer, replacing it with ... well, whatever I wanted really.

So, thinking back to the problem in a slightly different way - I want to display a number of items and have the ability to add and remove items as I see fit. Your thought process will probably differ from mine but my mind wandered to a ListView ... which can display a list of items (obviously) and can respond to items being added and removed.

I've created a sample project (link at the bottom of the post) and made the minimum updates required to demonstrate the issue and the solution. The project contains a number of pages;

- `MainPage` the application landing page,
- `AboutPage` an About page
- `PlayerEntry` represents the Player Entry page in the Smite Scoreboard app
- `Scoreboard` represents the Game page in the Smite Scoreboard app

## YOU ARE HERE

Revisting the `AppShell.xaml` file I removed the previous attempts at setting the `Shell.ItemTemplate` and replaced it with this

```xaml
<Shell.FlyoutContentTemplate>
    <DataTemplate>
        <StackLayout>
            <ListView x:Name="MenuItemsListView" 
                        SeparatorVisibility="None" 
                        HasUnevenRows="True"
                        ItemsSource="{Binding SmiteMenuItems}">
                <ListView.ItemTemplate>
                    <DataTemplate>
                        <ViewCell>
                            <StackLayout Padding="15,10">
                                <Button Text="{Binding Text}" Style="{StaticResource MenuButton}" Command="{Binding Command}" CommandParameter="{Binding CommandParameter}"></Button>
                            </StackLayout>
                         </ViewCell>
                    </DataTemplate>
                </ListView.ItemTemplate>
                    
            </ListView>
        </StackLayout>
     </DataTemplate>
</Shell.FlyoutContentTemplate>
```

This basically replaces the entire content area of the Flyout with a ListView, binds it to a code behind property and defines how the items should be rendered which matches the previous styling.

We also need to create that bound property so I've added the following to my `AppShell.xaml.cs`;

```csharp

    public ICommand MenuItemClicked { get; }
    public ObservableCollection<Button> SmiteMenuItems { get; }
    
    public AppShell()
    {
        InitializeComponent();

        Routing.RegisterRoute(nameof(AboutPage), typeof(AboutPage));
        Routing.RegisterRoute(nameof(PlayerEntry), typeof(PlayerEntry));
        Routing.RegisterRoute(nameof(Scoreboard), typeof(Scoreboard));
        
        MenuItemClicked = new Command<string>(async route =>
        {
            Current.FlyoutIsPresented = false;
            await Current.GoToAsync(route);
        });
        
        SmiteMenuItems=new ObservableCollection<Button>
        {
            new () { Text = "Home", Command = MenuItemClicked, CommandParameter = nameof(MainPage) },
            new () { Text = "About", Command = MenuItemClicked, CommandParameter = nameof(AboutPage) },
        };


        BindingContext = this;
    }
```

Running this up in an emulator I get the same result as 

TODO:
Update AppShell Content to include ListView, bound FlyoutItems (or something else?) - commit and tag
Update to wire up to Commands to perform navigation - commit and tag
Update to Add/Remove Items - commit and tag