---
layout: post
title:  "Dirty Checking and the .NET GridView"
date:   2009-01-18 00:00:00
tags:   asp-net javascript
---
Most Web Developers have come across this problem at one time or another, how do I stop someone navigating away from a page if they have not saved any changes they have made?
<!--more-->
The answer is that you need to employ ‘Dirty Checking’, basically set a flag when the page data is changed and check it if the user tries to navigate away. Sounds simple (and in many instances it maybe so) but I have encountered a problem recently (today!) which took some thought to get around. Basically I had a Master page with the following Javascript in the head section:

```javascript
var isDirty = false; 
function setDirty(changeVal) { 
    isDirty=changeVal; 
} 
window.onbeforeunload = checkExit; 
function checkExit() { 
    if(isDirty == true) {
        return confirmExit(); 
    } 
} 
function confirmExit() {
    // this value will be return as a part of the confirmation message 
    return "You have not saved your changes to this record."; 
}
```

Any page utilising the dirty checking had some code in the Page_Load event that looked something like this:
```javascript
ddlCategory.Attributes.Add("onchange", "setDirty(true);");  // Dropdown List
txtWorkArea.Attributes.Add("onchange", "setDirty(true);"); // TextBox
 
chkAssessmentRequired.Attributes.Add("onclick", "setDirty(true);");  // Checkbox
 
buttonSave.Attributes.Add("onclick", "setDirty(false);");  // Button
function confirmExit() {
    // this value will be return as a part of the confirmation message 
    return "You have not saved your changes to this record."; 
}
```
So when the page is loaded the edittable controls have an attribute added which will execute the setDirty function and set the dirty status accordingly. Note that the Save button is configured to clear the Dirty Status (i.e. set it to false).

So, what’s wrong with that? Well nothing, everything works as expected – but enter the .NET GridView control! The dirty checking was then added to a page that contained a .NET GridView control and the problems started. The GridView allows in-line editing and can be configured to commit changes to the underlying database upon clicking the ‘Ok’ button within the editted row. However, as the GridView only held part of the information on the page we wanted it all to be committed at the same time, i.e. update the GridView but not call the Update method of it’s DataSource until the whole page was being committed. I had to wire up the dirty checking to flag any changes made to the data it contained.

My first approach was to set the dirty status of the page when any row was actually updated, i.e. when the user clicked on the OK button of the Edit Row. This could easily be caught in the RowUpdated event and seemed a logical choice and initially seemed to work as expected – until one of those damn tester people got hold of it. It was found that if the page was in a dirty state before any data in the GridView was editted then clicking on the Edit link button would result in the ‘Unsaved Changes’ dialog being displayed. It was clear that the onbeforeunload event is being fired by the GridView going into Edit Mode and there was nothing we could do about this – we just had to find a way around it.

We decided that as well as flagging the Dirty State we also had to flag and maintain the ‘edit’ state of the page. This way we could ignore Postbacks that occured when the GridView entered Edit Mode – simple….. The Javascript code in the Master Page was updated by adding a new ‘IsEditing’ function and updating the condition within the checkExit function.
```javascript
var isEditting = false;
 
function setEditing(nextValue)
{
    isEditting = nextValue;
}
 
function checkExit()
{
    if(isDirty == true && isEditting == false)
    {
        return confirmExit();
    }
}
```
So now we could flag a page as being in Edit Mode and bail out of checkExit if it was (even if the apge was flagged as being dirty). But we were not out of the wood quite yet – we still needed to wire the new functions into the rest of the code. We needed to add the ‘onclick’ attribute to each Edit button in the GridView to flag the page as being in Edit Mode. The simplest way of doing this is from within the RowCreated event:
```csharp
protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
{
  LinkButton editButton = (LinkButton)e.Row.FindControl("LinkButton1");
  if (editButton != null)
  {
    editButton.Attributes.Add("onclick", "setEditing(true);");
  }
}
```
When the row has been updated we need to clear the Edit mode flag and set the pages Dirty state to True. This can be done in the RowUpdated event which is fired when the user clicks the OK button of a row in Edit Mode.
```csharp
protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
{
  ScriptManager.RegisterStartupScript(this, this.GetType(), "SetDirty", "setDirty(true);setEditing(false);", true);
}
```
So, how do I know that the Edit button will be called LinkButton1? Well by default when a CommandField is added to a GridView there is no way of knowing – so you have to convert the field into a Template field instead.

![field editor]({{ '/assets/images/dirtycheck_templatefield.jpg' | relative_url }})

With this code in place clicking on the Edit button sets the page in Edit mode and the ‘Unsaved Changes’ dialog is not displayed. If they make changes to the data fields and click OK then the flags are reset accordingly. Now we just need to handle the situation where the user clicks on the Cancel button of a row in Edit mode. Adding the following code to the RowCancellingEdit event sorts that out:
```csharp
protected void riskAssessmentDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
{
    ScriptManager.RegisterStartupScript(this, this.GetType(), "SetEditing", "setEditing(false);", true;
}
```
So there you have it, one method of utilising Dirty Checking in ASP.NET page utilising the .NET GridView control. It may not be the only, or the best way but it solved the problem that we encountered. If you spot any mistakes or have any suggestions then feel free to leave a comment.