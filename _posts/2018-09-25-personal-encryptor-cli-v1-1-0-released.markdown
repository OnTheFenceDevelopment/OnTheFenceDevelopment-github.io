---
layout: post
title:  'Personal Encryptor CLI v1.1.0 Released'
date:   2018-09-25 00:00:00
tags:   personal-encryptor-cli privacy
---
![privacy logo](/assets/images/privacy.png){:style="float: left; margin-right:10px;"}

It’s been a good seven months since [I released the initial version of the PersonalEncryptorCLI project]({% post_url 2018-02-24-the-personal-encryptor-1-0-released %}) and in that time I’ve had more than a handful of emails asking me about the utility. Most of these were asking if I could/would be creating a Desktop version, i.e. something with a GUI. It seems only geeks like the Command Line – who knew 😉

Well the answer is yes, but I needed to clear the remaining issue that I had identified with version 1.0.0 – the need for the recipient to know the context of the encrypted content, i.e. whether it was a text file, an image or a Word document.

This was due to the initial release of the utility requiring the filename to be specified during the decryption process – including it’s extension. Now, if the user didn’t know that it was a Word document, how would they know to specify a filename with a .docx (or .doc) extension?
<!--more-->
Sure, the sender could include that in the email (or some other mechanism) but this is information leakage and this could potentially assist so-called ‘bad actors’ in determining the contents – regardless of whether they would access the actual contents or not.

Well, today I managed to get a couple of hours to test update the code to include the original filename in the Encrypted Packet (the value being encrypted of course). During the decryption process this value is extracted and used to create the file for the decrypted data to be written to.

There have been a couple of tweaks to the project Readme.md file to handled the changes to the command line options for the decryption operation but it’s fairly trivial – just dropping the filename from the output path parameter.

“But what if I have encrypted packages that were created with the previous version – which don’t contain the filename?”

Don’t fret – I have a few of these too so the code will use a temporary filename in this instance (hopefully you remembered/know what the file was!).

I’ll be decrypting my now-legacy data and re-encrypting with the new version of the utility – you may want to do the same 😉

You can access the <a href='https://github.com/OnTheFenceDevelopment/PersonalEncryptorCLI' target='_blank'>main project page here</a> or <a href='https://github.com/OnTheFenceDevelopment/PersonalEncryptorCLI/releases/tag/v1.1.0' target='_blank'>the new 1.1.0 release here</a>.

Now that the desks are clear – I can turn my attention to the Desktop client which may or may not look something like this:

![personal encryptor mockup](/assets/images/personal_encryptor_mockup.png)