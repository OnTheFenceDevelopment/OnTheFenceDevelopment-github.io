---
layout: post
title:  'Save Blushes with Git Hooks'
date:   2025-04-24 00:00:00
tags:   git source-control productivity
---
We've all done it - we've committed a file, pushed it to the repository and it's broken the build .... I know, shock, horror huh!? 

Now I'm not suggesting that experienced developers are committing code that doesn't even build - I mean, we all check that much right ..... right? But do we always remember to run the unit tests? 

No, we don't, and what happens next - we have to run the tests locally, find the issue, fix it and then go through the cycle again. While you make be able to squash these 'fixing build' commits out of the history but that build failure will always be there (unless you're the DevOps admin of course).

But what if there was a way that you could avoid having to remember to do these simple, but easily forgotten, tasks. Well, that's where git hooks come in.
<!--more-->

The git hooks I'm going to describe in this post are just simple scripts that can be executed before or after certain git operations, e.g. pre/post commit, pre/post push. Other hooks exist but lets keep the scope a little tight for now.

I've only really used the `pre` hooks before because I'm trying to catch issues before it's too late - I've not needed to do anything after a commit or push has been successfully completed.

### Pre-Commit
Before I commit I want to make sure that te code still builds so I'd like to perform a Clean and Build - afterall, what's the point of committing something that doesn't work 🤷‍♂️?

The first thing to do is to create a file called `pre-commit` (with no file extension) within the hidden `.git` folder inside your solution folder and within the `hooks` sub-folder, .i.e `.git\hooks`.

The file should have the following content:

```bash
#!/bin/bash
dotnet clean; dotnet build

if [ $? -ne 0 ]; then
    echo "Build failed - Please fix errors and commit again"
    exit $?
fi

echo "Build Succeeded"
exit 0
```

> If you are working on a non-Windows system you will need to ensure the file is executable. This can be achieved via the terminal using `chmod +x pre-commit` but other methods exist.

If I make a change to a file that results in the build failing, e.g. removing a semi-colon from line 5 below, and then attempt to commit the change I will get an error.

[![Rider IDE with a Program.cs file containing an error and console error messages confirming that the commit has failed](/assets/images/pre-commit-failing-build.png)](/assets/images/pre-commit-failing-build.png){:target="_blank"}

Now you may be thinking "his code may well build but he's still forgetting to run his unit tests" - well, no I haven't - I just don't want to do it every time I commit my changes. I think it's more useful to run my unit tests when I'm pushing my changes to the remote repository and that's what we'll look at next.

### Pre-Push
It shouldn't surprise you that adding a script to run before a push pretty much follow the same process as above, just within a file called `pre-push`, saved in the same location as `pre-commit` (flagged as being executable if required).

My `pre-push` file looks like this;

```bash
#!/bin/bash
dotnet test;

if [ $? -ne 0 ]; then
    echo "One or more tests have failed - Please fix errors and commit again"
    exit $?
fi

echo "Tests Succeeded"
exit 0
```
In the screenshot below you'll see a standard `UnitTest1.cs` file that Rider created for me along with a default test - although I've configured this to fail using `Assert.Fail()`.

I've committed this file without any problems as the code still builds just fine and now I just need to push it to the `origin` - which will trigger the unit tests to be executed.

[![Rider IDE with a Unit Test file configured to fail](/assets/images/pre-push-tests-failing.png)](/assets/images/pre-push-tests-failing.png){:target='_blank'}

BOOM! The push has failed due to the failing test.

[![Rider IDE console showing the output of the test run confirming that one has failed](/assets/images/pre-push-tests-failing-console.png)](/assets/images/pre-push-tests-failing-console.png){:target='_blank'}

All I need to do is change the `Assert.Fail()` to `Assert.Pass()`, commit the change is push it.

[![Rider IDE git window showing commit history with a toast message confirming the successful push](/assets/images/pre-push-tests-fixed-console.png)](/assets/images/pre-push-tests-fixed-console.png){:target='_blank'}

### Conclusion
With all the buzz these days being around AI assistants I think we sometimes forget the tools that have been with us all along. Git Hooks are a fundamental feature of git and easily overlooked. 
With just a little configuration we have enabled a mechanism to ensure we cannot commit code that doesn't build or push tests that do not pass - saving our blushes by minimising the possibility of breaking the build.