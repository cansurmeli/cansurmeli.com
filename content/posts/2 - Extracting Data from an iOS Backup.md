---
title: "Extracting Data from an iOS Backup"
slug: "extracting-data-from-an-ios-backup"
date: 2015-08-25
tags: ["ios"]
draft: false
type: "post"
---

My little cousin(about 10 years old) broke her iPad in terms of software; don’t ask me the specifics, she somehow managed it which totally baffles me. Anyways, it was requesting an iTunes connection and had be restored. Given her age, she didn’t properly managed her iPad; meaning her photos were not stored on the cloud or even she didn’t had an up-to-date backup.

She really wanted her photos back and fortunately I found an old backup residing on her family Mac. But since that was an old backup, I didn’t wanted to restore from that. I just wanted to extract the photos inside that backup.

I know that Apple doesn’t allows this, they all want things to just work with a single click! But since the backup file is just a specifically managed boat of data there had to be some app to extract data from it according to my needs. I could gone inside the backup to search but why bother and lose time.

A little detective work came up with the answer: iPhone / iPod Touch Backup Extractor Given the very obvious name, this little app does exactly one job that you expect. Analysis your backup and extracts data out of it on your Mac so that in order to save a couple of files, you don’t have to make a full restore.

App Screenshot

To do so:

launch the app,
if you have only allowed authorised apps(Mac App Store | identified developers) to be launched, then right-click to the app icon and choose Open. This will override this security measure just for this app for the time being.
click `Read Backups’ button on the bottom left corner,
select your backup file,
a list will be shown detailing whatever found,
scroll to the bottom and select iOS Files,
click to the Extract button and choose a location,
in the extracted folder, browse to the following location: iOS Files/Media/DCIM,
and there are all your photos stored in your backup which you can copy them to wherever you want.
Although this process saves your most precious photos, it loses some of their metadata which Photos uses and it’s kind of hard to restore that since there is no official way of doing that. Trying to do that manually would be a nightmare so from now on please keep your backups up-to-date with automatic iCloud back-ups and at the same time upload your entire photo library to iCloud or Dropbox or whatever cloud provider you like. And if you are a little munchkin, please do tell your parents to do so! 😄