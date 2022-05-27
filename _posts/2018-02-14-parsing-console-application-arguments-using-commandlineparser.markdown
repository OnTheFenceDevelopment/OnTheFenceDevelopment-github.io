---
layout: post
title:  'Parsing Console Application Arguments using CommandLineParser'
date:   2018-02-14 00:00:00
tags:   visual-studio utilities nuget personal-encryptor-cli
---
When we open Visual Studio and click File > New we are greeted with a huge list of project templates to choose from. Now and then we may opt for a simple Console Application for a quick one off utility, e.g. post processing some .csv files or images.

Similarly we have all used command line utilities which require numerous arguments and switches to ‘tune’ exactly what we want it to do, e.g. git or tar.

Well I’m looking to create a Command Line utility that will allow users to encrypt and decrypt textual messages.

Why? I hear you ask – well check out [my thoughts on the UK Governments attempts to get WhatsApp to create a backdoor]({% post_url 2018-02-10-whatsapp-a-haven-for-paedophiles-and-terrorists %}).

The utility will allow users to

- Generate Public/Private Key Pairs
- Encrypt textual messages, packaging them for sending to the intended recipient
- Decrypt packaged messages
<!--more-->
Each action will require/allow a number of parameters to be set to specified key bit lengths, key names, output locations and of course the message to be encrypted or decrypted.

Something like this:

```C:\Encryptor generateKeys -n Daves -o C:\UsersDaveMyKeys```

which would create a key pair files called `DavesPrivateKey.xml` and `DavesPublicKey.xml` in `C:\UsersDaveMyKeys`

But what is the best way to do this?

We could handle it in the Program.Main method by locating arguments and setting their values, like this

{% gist d08bb935661c91d3a11dac50daacbb09 %}

But that’s a bit nasty and relies on each parameter having a value and that it’s been specified in the correct way to allow casting etc. There has to be a better way .. well there is and it comes in the form of a nuget package called, suitably enough, <a href='https://www.nuget.org/packages/commandlineparser/' target='_blank'>CommandLineParser</a>.

Now, I didn’t find the documentation (the ReadMe.md on the <a href='https://github.com/commandlineparser/commandline' target='_blank'>projects Github page</a>) that helpful and it took a lot of trial and error to work out how to use it for my needs. When I got to grips with it though – I was impressed.

After installing the CommandLineParser via nuget I needed to create a new class to define each operation, i.e. GenerateKeys, Encrypt and Decrypt.

Each class is decorated with a ‘Verb’ attribute – this defines the action – while the properties are decorated with ‘Option’ attributes.

{% gist 30640f89914a961bf0d2f81995e36c19 %}

So the above code defines the Generate Keys action and provides options for Key Length, Name and Output Folder. Notice that the Key Length will default to 2048 bits if not specified by the user. It is also possible to make options mandatory and the operation will fail if they are not specified.

When the Console Application project was created a Program.cs class was added containing a single method called Main. I’ve modified the signature to return an integer instead of a void as I think it is good practice to return exit codes from command line utility.

{% gist 2725e47e2482535a681e2b794901fcc0 %}

To test the configuration I can right-click on the project file, open the Properties page and click on the ‘Debug’ option. Enter suitable values into the ‘Command Line Arguments’ as below

![project debug options](/assets/images/commandlineparser_debugoptions.png)

and then run the application (I had a breakpoint on the return statement within the GenerateKeyPair method).

![command running](/assets/images/commandlineparser_running.png)

If the parser fails for any reason then it will automatically generate the required output and error ‘gracefully’.

Try dropping the value for one of the options and rerunning the application – below I dropped the DavesMessage value from the -n parameter:

![command error](/assets/images/commandlineparser_running_error.png)

Obviously I want to add another couple of Option configurations and this is easy enough to do – take a look at the <a href='https://github.com/commandlineparser/commandline_sampleapp/tree/master/sampleapps/quickstart_verbs' target='_blank'>sample app in the github repo</a>, in particular the Program.cs file, to see how this is done. Alternatively you can keep track of this application when it hits GitHub as I will be open sourcing the code.