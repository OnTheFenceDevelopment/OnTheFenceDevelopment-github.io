---
layout: post
title:  'Tuples are Evil and Should be Treated as Such'
date:   2015-04-13 00:00:00
tags:   csharp
---
While working on a particular area of the a clients code (C#) I came across method with a signature similar to the following:
```csharp
public Tuple<bool, decimal, decimal, decimal, int, int> 
    CheckState(int aParameter)
```
At first glace you may think that there is nothing wrong with this but think about it – what does that bool actually represent? What about the second of the decimal values? Well, the developer had obviously thought about this and had added a comment above the signature – but it only specified 5 values, not the 6 that are in the Tuples definition (that’s because code comments lie).
<!--more-->
But the problems with Tuples don’t stop with not being able to see what the method is returning – oh no. What happens when you are on the other side of the method – calling it and consuming the response?
```csharp
var stateResult = CheckState(1);

bool isValid = stateResult.Item1;
decimal highValue = stateResult.Item2;
decimal lowValue = stateResult.Item3;
decimal alarmValue = stateResult.Item4;
int inPort = stateResult.Item5;
int outPort = stateResult.Item6;
```
What is not obvious from this is that when you are using Visual Studio the Intellisence is not going to help you out here – Item1, what is that again? Ok, you may be able to see it’s a bool but how much does that help you? What about the decimal values? Which is which?

Obviously the developer who put this together needed to return a handful of values but why oh why did he use a Tuple instead of creating a simple POCO/DTO?
```csharp
public class StateResult
{
    public bool IsValid {get; set;}
    public decimal HighValue {get; set;}
    public decimal LowValue {get; set;}
    public decimal AlarmValue {get; set;}
    public int InPort {get; set;}
    public int OutPort {get; set;}
}
```
The method signature now becomes:

public StateResult CheckState(int aParameter)

While the usage would now be:
```csharp
var stateResult = CheckState(1);
bool isValue = stateResult.IsValid;
decimal highValue = stateResult.HighValue;
decimal lowValue = stateResult.LowValue;
decimal alarmValue = stateResult.AlarmValue;
int inPort = stateResult.InPort;
int outPort = stateResult.OutPort;
```
For the sake a less than a dozen lines of code it has become more readable, almost self-describing, easier to use and to maintain.

So the next time you think about using a Tuple – remember, the next developer may know where you live and may own an axe 😉