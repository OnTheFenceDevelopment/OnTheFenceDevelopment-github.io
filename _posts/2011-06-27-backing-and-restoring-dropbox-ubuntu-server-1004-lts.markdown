---
layout: post
title:  'Backing up and Restoring to Dropbox on Ubuntu Server 10.04 LTS'
date:   2011-06-27 00:00:00
tags:   linux ubuntu dropbox
---
In my previous couple of posts I’ve been configuring Dropbox on my Virtual Private server running a headless installation of Ubuntu 10.04. The main reason for this was to enable me to use it for storing backups without having to rely in the Dropbox Web API which has proven to be somewhat flaky – or at least that’s my experience. With the Dropbox daemon now installed, configured and running all I need now is a script to perform the actual backups and save in the appropriate location. Initially I’ll do this using bash script but it is my intention to look at using Python when I have some time on my hands.
<!--more-->
**Investigations**

The first thing I need to to is backup the MySQL database which can be achieved quite easily via the mysqldump command.

```
mysqldump -u'username' -p'password' onthefence_blog > otfd_db_backup.sql
```
>Note that there are no spaces between the -u/-p switches and their values (which are enclosed in single quotes) – this is deliberate!

This will create a script, called otfd_backup.sql, which will contain the SQL to create all of the tables and insert the data into them. In short, a script that you can run to totally recreate the database. There are <a href='http://dev.mysql.com/doc/refman/5.6/en/mysqldump.html' target='_blank'>a multitude of options</a> that can be specified but for my purposes I don’t really need any of them.

So with the database backed up I now need to take a snapshot of the blog itself, i.e. the WordPress installation. I decided to create a compressed tarball using the following command:

```
tar -czf otfd_blog_backup.tar.gz /var/www/onthefence_blog
```

So those are my commands, but now I need to put these into a script that I can configure to be run via a cron schedule. I also wanted to be able to add datestamps to the generated files and to email myself either a success or a failure message along with a log file containing additional details.

To create a datestamp is a simple matter of creating a variable with the formatted date which can be injected into filenames and the log file.

```
echo "On The Fence Development Backup" > otfd_blog_backup_$today.log
```

The $today reference will be replaced with the dynamic value generated above.

Next on the list was to send an email depending on the success or failure of the backup – [I’ve already configured Exim4 and Mutt]({% post_url 2011-06-09-migrating-blog-virtual-private-server-exim4-email-support %})  to handle the emailing from the server so all I need to do is to check the success or failure of each command and take the appropriate action. If either of the main commands fail then an email needs to be sent with details of the problem to allow me to take the appropriate action.

When a command is run the resulting exit code can be checked via the `$?` variable. In addition to this anything sent to the stderr stream, i.e. an error, can be redirected to the log file by adding `2>>otfd_blog_backup_$today.log` to the end of the command line.

**Developing the Script**

The resulting mysqldump section of the script looks like this:
```bash
echo "Backing up MySQL Database" >> otfd_blog_backup_$today.log
mysqldump onthefen > [path to dropbox folder]/onthefence_$today.sql 2>>otfd_blog_backup_$today.log

if [ $? != 0 ]; then
        echo "Blog Database Backup Failed." >> otfd_blog_backup_$today.log
        # Need to Send out EMail
        echo "On The Fence Development Blog Backup Failed" | mutt -s "Blog Backup Failed" someone@somewhere.com -a otfd_blog_backup_$today.txt
        exit 1
fi
```
If there is a problem running the mysqldump command then the error message is sent to the log file, which is then added as an attachment to a notification email. I also exit the script (which an exit code of 1) as there is little point completing the backup if any part of it fails.

The tarball command looks pretty similar although I have decided to cd into the `/var/www` folder before running the command. This is to prevent the var and www folders from appearing in the archive itself as I just wanted the main installation folder, not it’s parents. A personal preference but I think it’s cleaner to just backup what you actually want to be able to restore.

```bash
# Now Create a Tarball of the Blog Folder
echo "Creating Tarball of Blog Folder" >> otfd_blog_backup_$today.log
cd /var/www
tar -czf onthefence_$today.tar.gz onthefence 2>>otfd_blog_backup_$today.log

if [ $? != 0 ]; then
        echo "Blog Tarball Generation Failed." >> otfd_blog_backup_$today.log
        # Need to Send Out EMail
        echo "On The Fence Development Blog Backup Failed" | mutt -s "Blog Backup Failed" someone@somewhere.com -a otfd_blog_backup_$today.txt
        exit 1
fi
```

If the execution makes it passed both of these checks then I’m assuming that the backup has been successful and send an email, with the log file attached, to myself.

after making the script executable I created a simple cron job which runs at 00:01 on a Sunday morning – so far everything seems to be working well.

[I’ve attached the full script (with my specific details removed) here.]({{'/assets/downloads/otfd_backup.txt' | relative_url }})

**Restoring from the backup**

As I’ve already posted – [a backup is only a backup when you can restore from it]({% post_url 2011-04-05-when-backup-not-backup %}). So, can I recreate my blog on a new server using the files that I’ve produces above? Well, yes I can and it’s remarkably easy to do so.

I’ve got another VPS which I use for testing and have also configured it to run the Dropbox daemon on the same account as the live server – so the backups created above will be synced to the test server and I can access them quite easily.

After copying the backup files out of the Dropbox folder I extracted the tarball and then moved it to the `/var/www` folder

```
tar -zxvf otfd_blog_backup_26.06.2011.tar.gz
mv onthefence /var/www
```

Next I needed to create a database in MySQL along with a user with the appropriate permissions and the same username/password as on the live server (although I could change the values in the wp-config.php file in the WordPress install).

```
mysql> CREATE DATABASE onthefence_blog;
mysql> CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
mysql> GRANT ALL ON onthefence_blog.* TO 'user'@'localhost' IDENTIFIED BY 'password';
mysql> FLUSH PRIVILEGES;
mysql> exit
```

With the database created I imported the backup using the following command (and entering my password when promoted):

```
mysql -u my_username -p database_name < path_to_dump_file
```

I then navigated to **http://testserverip/onthefence_blog** and low and behold there was my blog. It should be noted the clicking on any of the links actually took me to the page on the live site but this is due to WordPress storing the domain name against each post within the database. The fact is it’s restored, up and running.

Now I could create a script for the restoration as well but frankly it’s so straightforward I don’t see too much value in doing so – I have a list of more pressing things to look at first.!

Next job, now that I can backup the contents of my server, get my Subversion server up and running and schedule the backups on a nightly basis but only if there have been commits since the last one.