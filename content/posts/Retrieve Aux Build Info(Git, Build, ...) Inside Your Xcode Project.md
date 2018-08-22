---
title: "Retrieve Aux Build Info(Git, Build, ...) Inside Your Xcode Project"
date: [TODO]
tags: ["iOS"]
draft: true
---
It can and will probably be quite advantageous to have access to additional build information regarding your iOS/macOS project inside your Xcode environment. For example, when was the build taken exactly, which branch does it belong to, etc.

With such knowledge, one can integrate them into his/her logging system or if you've some hidden debug mode in your app like I do, you can display such information there for the use of the tester.

Unfortunately, Apple doesn't have something in place to reflect such information. The most they do, in this regard, is to provide the version and the build numbers.

This requirement got me thinking and so I set out to tackle it. My initial approach was to do Swift scripting since it's a quite nice feature of Swift I enjoy. Although, I then quickly realized that I can't do Swift scripting inside a iOS/macOS project. Not allowed unfortunately.

Afterwards, I Googled some; I thought maybe there would be a library somewhere or something else but came up empty. Then I set out to [ask it on StackOverflow](https://stackoverflow.com/questions/47795580/retrieve-branch-name-inside-ios-project/47798282#47798282). Luckily a user by the name of [Edmund Dipple](https://twitter.com/elmundio87) came to my help. Thanks a lot for that by the way. :]

## Integrating a Run Script Phase
Even though I've used it many times before, it never occurred to me that I could've used a script during the build phase to execute whatever terminal command I want, insert the results into my `Info.plist` and retrieve them from there just like anything else I do using the `Bundle` class.

So, I did just like that. I followed the [tutorial](https://egeek.me/2013/02/09/xcode-insert-git-build-info-into-ios-app/) by Eugene which Edmund suggested on SE and now I was able to retrieve additional information such as the exact build time or the branch the build was taken from. Isn't that great!

Even though Eugene’s original post is pretty great, I would like to go over it since it’s a bit outdated as it’s from the era of Objective-C and an older version of Xcode.

## Modifying the Script
Although I wanted to modify the script to my liking. Change the syntax a bit here and there and provide some additional information.

When done, Xcode might complain about the file[^hello]
https://stackoverflow.com/questions/2920416/configure-bin-shm-bad-interpreter




:set fileformat=unix

## RESOURCES
- [https://egeek.me/2013/02/09/xcode-insert-git-build-info-into-ios-app/](https://egeek.me/2013/02/09/xcode-insert-git-build-info-into-ios-app/)
- [https://stackoverflow.com/questions/47795580/retrieve-branch-name-inside-ios-project/47798282#47798282](https://stackoverflow.com/questions/47795580/retrieve-branch-name-inside-ios-project/47798282#47798282)