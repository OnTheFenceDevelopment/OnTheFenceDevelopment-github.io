---
layout: post
title:  'The Personal Encryptor 1.0 Released'
date:   2018-02-24 00:00:00
tags:   development open-source pluralsight training encryption personal-encryptor-cli privacy
---
![privacy image](/assets/images/privacy.png){:style="float: left; padding-right: 10px"}

Following on from [my post about the UK Governments campaign to erode our privacy]({% post_url 2018-02-10-whatsapp-a-haven-for-paedophiles-and-terrorists %}) by demanding that tech companies put back doors in their encrypted products, I have created a simple utility to demonstrate how easy it is for a reasonably competent developer to create their own using standard development tools and libraries.

Now, I’m not expecting the UK Government to take a blind bit of notice but the fact is that encryption is out there, it’s only mathematics after all, and it’s not going away. You cannot feasibly make maths illegal – although the US did classify encryption as a weapon until 2000 (and to some degree still does).

Anyway, following [my commitment to watch at least one Pluralsight course a month during 2018]({% post_url 2018-02-03-so-what-will-2018-be-the-year-of %}) I opted for <a href='https://app.pluralsight.com/library/courses/practical-cryptography-dotnet/table-of-contents' target='_blank'>Practical Cryptography in .NET by Stephen Haunts</a> to give myself some suitable background.
<!--more-->
The course was a minute under four hours and took me a couple of evenings to get through, Cryptography is not the most stimulating subject but Stephen did his best to key the information flowing. At times I did feel frustrated at how he seemed to labour some points but the upshot is that by doing this the information did seem to get through and stick. During the course he slowly increased the complexity, developing and enhancing C# code to demonstrate the principles.

It is this code which I have used as a base to create the ‘Personal Encryptor’ (hereafter referred to as PE) – a command line application that can be used to generate encryption keys, encrypt and, of course, decrypt data into files that can be safely sent over the Internet. Only someone with the required public and private keys will be able to decrypt the file and view the original data.

I’ll probably put another post together shortly diving a bit deeper into the functionality and explain the contents of the output file – but I highly recommend you watch the above course as Stephen know the subject inside out and does a great job of explaining it.

## Why would I need/want to encrypt a file?

Imagine the following scenario;

Alice and Bob want to exchange private messages with each other; maybe they are planning  a surprise birthday party or sharing ideas about a new business venture. Whatever the messages contain, they are Alice and Bobs business and nobody elses.

1. Alice and Bob both download the PE application and copy it to a location on their Windows PC (Mac version coming soon).
2. They then use the utility to generate a Public and Private key pair – which will create two XML files.
3. They each send each other their PUBLIC keys (this is just an XML file and can be freely sent over the Internet or via Email).
4. Both Alice and Bob copy their PRIVATE keys to a safe location (maybe a secure USB key – or a normal USB key which is stored in a safe)

Now Alice wants to encrypt a file, a PowerPoint presentation for their new product, and send it to Bob

1. Alice uses the PE application to encrypt the file using Bobs PUBLIC key.
2. The PE application Digitally Signs the encrypted data using Alices PRIVATE key.
3. A text file is created containing the encrypted data and everything needed to verify the contents has not been tampered with and to confirm that Alice encrypted it.
4. Alice then emails the file to Bob as she normally would if she was sending a photo of her cat!

Bob receives the message and downloads the encrypted file to his computer.

1. Bob uses PE to decrypt the file by specifying the location of his PRIVATE key and Alice’s PUBLIC key.
2. The PE utility will check the digital signature using Alice’s PUBLIC key to confirm that it was signed with her PRIVATE key.
3. It will then check the integrity of the package to ensure that it has not been tampered with in transit
4. If all is well then the PE application will decrypt the file and write the contents out to a location that Bob has specified.
5. Bob can now ~~endure~~ enjoy Alice’s PowerPoint presentation.

Of course if Alice (or Bob) just wanted to encrypt a file for their own personal use and not for sharing it is perfectly feasibly to provide their own Private AND Public keys to encrypt the data. These keys will be required to decrypt the data.

And that’s it, privacy restored/reclaimed.

I can now safely download my Lastpass vault in plain text, encrypt it and save it to any cloud drive I like, secure in the knowledge that, as long as my private key remains under my control, nobody can decrypt it to access it’s contents. Nothing illegal there – these are passwords to legitimate sites (Amazon, Pluralsight, Microsoft, Apple etc) and need to be protected. A valid use of The Personal Encryptor.

## Going Forward

Yes, at the moment it requires the users to have some familiarity with the Command Line but this project was always intended to be a proof of concept. The original aim was to explore encryption to enable me to implement it in an existing mobile Chat application.

Creating a simple GUI would certainly be possible – a simple Winforms or WPF application to collect file paths and call out to the command line utility shouldn’t take too long for a competent developer to write. That said, I’m probably going to focus my attention elsewhere.

While using the Microsoft libraries is perfectly valid in my opinion, I am aware that many people will wince just a little bit. With this in mind I intend to investigate using the <a href='https://download.libsodium.org/doc/' target='_blank'>libSodium Crypto Library</a> which <a href='https://en.wikipedia.org/wiki/Steve_Gibson_(computer_programmer)' target='_blank'>Steve Gibson</a> is such a fan of – so that’s good enough for me.

You can <a href='https://github.com/OnTheFenceDevelopment/PersonalEncryptorCLI/releases' target='_blank'>download the latest version of the Personal Encryptor application by clicking here</a>. Alternatively you can <a href='https://github.com/OnTheFenceDevelopment/PersonalEncryptorCLI' target='_blank'>download the full source from Github</a>.