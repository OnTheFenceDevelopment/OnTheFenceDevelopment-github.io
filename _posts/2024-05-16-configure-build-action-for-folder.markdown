---
layout: post
title:  'Configure Default Build Action for all items in a Folder'
date:   2024-05-16 00:00:00
tags:   development dotnet csharp configuration
---
How many times have you added an 'non-content' file like a SQL script to a folder and forget to set the required build action?

Well today I resolved this issue once and for all in two projects I'm currently working on with a simple update to the respective `csproj` files.

<!--more-->

In one of the projects I am using <a href='https://dbup.readthedocs.io/en/latest/' target='_blank'>DbUp</a>, a package which allows me to create and apply database migrations easily. All I need to do is create a suitably named SQL script containing the required updates and `DbUp` will bundle it up and when the resulting executable is invoked it will check whether the script has already been run and if not it will do so.

Well ... it will do that if I remember to set the `Build Action` to `EmbeddedResource` that is ... something I frequently forget to do and only remember when I test the migration and wonder why it wasn't applied.

I'd previously worked for a client where adding a migration script (they were using Entity Framework Migrations) that required a specific build action wasn't an issue because it appeared to be handled automatically. At the time I tried to find the setting in Visual Studio but to no avail. Speaking to the tech lead he mentioned that it was a simple configuration made directly in the `csproj` file but he couldn't bring it to mind and I didn't investigate further before I left them.

Today, after bumping into this issue twice I decided enough was enough and had a dig around to find what turned out to be a simple solution.

The `csproj` file within one of the solution had a single `<ItemGroup>` containing all the SQL scripts - looking something like this;

```xml
<ItemGroup>
    <EmbeddedResource Include="Scripts\00001-CreateTables.sql" />
    <EmbeddedResource Include="Scripts\00002-AddSeedData.sql" />
    <EmbeddedResource Include="Scripts\00003-UpdateUserTable.sql" />
    <EmbeddedResource Include="Scripts\00004-AddAuditTable.sql" />
    <EmbeddedResource Include="Scripts\00005-FixUsersTable.sql" />
    .
    .
    .
    .
    .
</ItemGroup>
```

But it also had an `<ItemGroup>` above this that looked like this:
```xml
<ItemGroup>
    <None Remove="Scripts\00001-CreateTables.sql" />
    <None Remove="Scripts\00002-AddSeedData.sql" />
    <None Remove="Scripts\00003-UpdateUserTable.sql" />
    <None Remove="Scripts\00004-AddAuditTable.sql" />
    <None Remove="Scripts\00005-FixUsersTable.sql" />
    .
    .
    .
    .
    .
</ItemGroup>
```

So, to ensure the my SQL scripts were configured correctly without any input from me I removed these two blocks and replaced them with the following

```xml
<ItemGroup>
    <EmbeddedResource Include="Scripts\*.sql">
        <CopyToOutputDirectory>Never</CopyToOutputDirectory>
    </EmbeddedResource>
</ItemGroup>
```

Job done - when I create a new .sql file in that folder it will automatically be configured correctly. Right-clicking on a file and selecting `Properties` for the newly added file confirms this;

![sql file properties dialog in rider showing correct configuration](/assets/images/sql-file-build-action.png)