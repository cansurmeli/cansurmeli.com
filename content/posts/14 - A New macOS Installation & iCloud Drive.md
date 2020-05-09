---
title: "iCloud Drive Showing Up Empty After a New macOS Installation"
slug: "icloud-drive-showing-up-empty-after-a-new-macos-installation"
date: 2020-05-09
tags: ["macos"]
draft: false
type: "posts"
---
I know, I know. There are better options out there but if you're in the Apple ecosystem, it pays to use Apple's own services. With a single sign-in, all your data(apps, contacts, calendar, e-mail, files, music, etc.) is there. At least, it's supposed to be. More on that later.

From time to time, I would like to have a fresh macOS installation:

- nuke everything,
- start with a fresh copy of macOS,
- do not restore from any backups,
- re-install everything,
- and transfer your files.

I particularly suggest it. If you're a developer as well, and even more so, tinker with your system a lot like me, this strategy will benefit you dearly. Since people like us always try new stuff, even if you keep a tight ship, your system will get dirty regardless and you might see unnecessary slowdowns here and there.

## The Problem

Anyways, let's come to the point. I'm not going to tell you how you can install a fresh copy of macOS, that's readily available on the internet but point out to a particular issue if you do a fresh install and are using iCloud Drive.

Luckily, Apple is great at developing services.(huge sarcasm here). Whenever I did a fresh install, afterwards, all my iCloud Drive files required 6-8 hours or more to appear. It should be noted here that I'm saying `appear` and not `download` because after each and every fresh install, it takes that much time for iCloud to sort out it's blackbox operations and merely list my files. However, a funny side note is that other iCloud related data, such as Photos, music or whatever, all showed up from the beginning.

## Diagnosis

This is clearly an Apple related issue that for some weird reason, the iCloud daemon has to go through/process all of your files. And it will list them only when this through process is finished and not before. If you type `brctl log -w` into your Terminal, you can observe the sync progress.

If you search the web, you'll [come up](https://apple.stackexchange.com/questions/313716/icloud-drive-wont-sync-on-mac) with other people that share your pain and some of them even make suggestions on how to reduce/mitigate the problem but after extensive tries, those didn't worked for me.

## What to do?

The first thing you should do is not to panic. Your files are safe 'n sound. Just go to [icloud.com](https://www.icloud.com) and see it for yourself.

The second thing you should do is not to toggle your system preference for iCloud Drive. Doing so will restart this poorly-developed background process that you will have to wait even more.

All in all, your data is safe and there isn't anything you can do about it. Just hold still.

If you urgently need something, make do with the web interface of your iCloud Drive on [icloud.com](https://www.icloud.com/iclouddrive) or if you can cope with it, now is a good time to look for another storage provider.
