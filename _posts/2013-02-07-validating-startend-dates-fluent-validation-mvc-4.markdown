---
layout: post
title:  'Validating Start/End Dates with Fluent Validation for MVC 4'
date:   2013-02-07 00:00:00
tags:   asp-net-mvc development
---
In my current contract I needed to add date filtering to a grid of search results in and MVC view – how hard could it be?
Well the filtering was the easy bit, validating the user input proved to be much more problematic. The view that I had contained, among other things, a couple of fields for Start and End Date where the user would select the dates using a jQuery date picker. I knew that I could rely on standard MVC validation to make sure that the user had entered a valid date, but how do I ensure that they have entered an End Date that falls AFTER the Start Date? This simple requirement is not something that can be acheived with the standard Data Annotation attributes but I was lucky as the project already had made use of the FluentValidation extension.
<!--more-->
Creating a custom validator using FluentValidation is pretty simple as below:
```csharp
public class SearchValidator: AbstractValidator
{
    public SearchValidator()
    {
        RuleFor(m => m.StartDate)
            .NotEmpty()
            .WithMessage("Start Date is Required");
 
        RuleFor(m => m.EndDate)
            .NotEmpty().WithMessage("End date is required")
            .GreaterThan(m => m.StartDate.Value)
                            .WithMessage("End date must after Start date")
            .When(m => m.StartDate.HasValue);
    }
}
```
This validation will ensure that the user has entered something in the Start Date (standard validation will ensure that the date is valid) and that an End Date has been entered and is later than that Start Date.

Wiring this up to the view model is a simple matter of adding an attribute to the class:
```csharp
[Validator(typeof(SearchValidator))]
public class SearchViewModel
{
    public DateTime? StartDate { get; set; }
 
    public DateTime? EndDate { get; set; }
}
```
The final steps are to add the markup to display the resulting validation messages;

```csharp
Start Date: @Html.EditorFor(m => m.StartDate)
@Html.ValidationMessageFor(m => m.StartDate)
 
 
End Date: @Html.EditorFor(m => m.EndDate)
@Html.ValidationMessageFor(m => m.EndDate)
```
and to ensure that the validation is triggered in the Action Method;

```csharp
if (ModelState.IsValid)
{
    // do stuff and return the Search view
    return View("Search");
}
else
{
    // Validation has failed, return the same view with the model
    return View(model);
}
```
Now when the user clicks the Search button the validation will ensure that Start and End Dates are entered and that the End Date is later than the Start Date. What's more, will be applied on the ViewModel wherever it's used - you don't have repeated code in your action methods.