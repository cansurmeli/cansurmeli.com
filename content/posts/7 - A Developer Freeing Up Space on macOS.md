---
title: "A Developer Freeing Up Space on macOS"
slug: "a-developer-freeing-up-space-on-macos"
date: 2018-07-04
tags: ["macOS"]
draft: false
image_dir: "/images/posts/7-A-Developer-Freeing-Up-Space-on-macOS/"
type: "posts"
---

Even though there are various articles on the web regarding how to free up space on your Mac; those articles are usually for end-users with basic instructions such as delete watched iTunes content, clear out your Trash and etc.

As developers, we have different needs and usage patterns. Therefore if a developer wants to free up space on macOS, he/she needs to look elsewhere.

# Clear Out 3rd Party Stuff
You're probably using a dependency manager such as Carthage. Or making use of Homebrew to sort out your shell needs. If so, you definitely need to check out their garbage!

## Clear Out Carthage's Cache
{{< highlight bash >}}
rm -rf ~/Library/Caches/org.carthage.CarthageKit/
{{< / highlight >}}

## Clear Out Cocoapods' Cache
{{< highlight bash >}}
rm -rf "${HOME}/Library/Caches/CocoaPods"
{{< / highlight >}}

## Clear Out Old Brews
{{< highlight bash >}}
brew cleanup
{{< / highlight >}}

# Unnecessary Languages/Architectures

You could be using multiple keyboard layouts but most probably(i.e. 99.999999%), you're making use of only one single OS/app language. So, a lot of the unnecessary language files are standing there doing nothing but taking up your valuable storage space.

You could visit each and every application you've got and hunt down their language files but why bother; use [Monolingual](https://ingmarstein.github.io/Monolingual/).

With Monolingual, not only you can cleanup unused OS/app languages but also you can get rid of the architectures you're not making use of.

For instance, by removing the languages I'm not using, which was anything but English, I've made a saving of close to 1 GB.

{{< img src="monolingual.png" title="Unnecessary Language File Removal with Monolingual" >}}

However, do be careful when you're deleting the:

- **unused languages:** If your English is set to a non-American English like the British English, do leave both the American and the British English behind as some apps might be defaulting to the American English and if you delete that you might have to deal with weird texts and end up reinstalling some of your software.
- **app architectures:** This is a tad more elaborate and could lead to some apps not launching afterwards. Of course, a reinstall of those apps would solve the situation but approach this deletion **if you know what you're doing**.

> Also, I wish, Apple would've supported this itself by employing app thinning on iOS to macOS as well and improve the process.

# VMware Fusion Junk
As far as I can remember, I've been using VMware Fusion for my virtualisation needs on macOS. There was one or two occasions where I tasted other solutions but I always ended up with VMware.

Anyways, if you're like me and using VMware Fusion, you need to watch it out! The thing is that if you've dynamic allocation set for your VMs' disk spaces(which, most probably, you do), VMware does indeed increase the disk spaces by dynamically allocating the space as the naming suggests BUT it does **NOT** dynamically shrink them. Key point!

Therefore, even if you see space freeing up inside your VMs when you delete stuff on the guest operating system, the VM file size on macOS side won't shrink!

On that note, for your Windows machines, you need to:

- power-off your VM,
- go to it's VMware settings,
- click on `General`,
- click on `Clean Up Virtual Machine`.

Unfortunately, the comfort of a single button click is not available for Linux distributions. For them, you need to perform some shell magic which I won't touch here since it's a bit more length process. Maybe later I'll write about it.

## Managing VM Your Storage
This isn't exactly related to freeing up your storage but I'd really like to point it out. As a best practice, I would advise you to store your VMs not on your Mac's disk but on an external one with at **least USB 3.0 connectivity**. You can even dedicate USB dongles for your most used VMs. Which is highly convenient!

This used to be impossible as peripheral speeds were not enough previously but starting with USB 3.0, read/write speeds **can be** decent enough. I'm saying `can be` here because keep in mind that, if you're going on with the USB dongle option; be aware that as the dongle shrinks the read/write speeds lower as well! For running a VM over USB 3.0 connection, you need the full potential of USB 3.0.

If we're lucky, one day we'll get USB-C dongles which are progressing really slowly. But once we do, that'll be even better!

The reasoning behind this is that VMs can/do get messy pretty quickly. Hence you don't need to store them on your main drive all the time.

Besides, via this approach, you can easily share them among your coworkers and if you're backing up your system(you're, right? 😉), they won't be taking up space(which VMs do take a lot).

# Handle Xcode
Chances are you're most likely a developer on one of Apple's platforms. If that's the case, whether you've a love or hate relationship with Xcode, from time to time, you need to maintain it; clean it up.

Here is a preview of things to come:
{{< img src="xcode-junk.png" title="Xcode's Junk" >}}

## Delete Unnecessary Xcode Simulators
{{< highlight bash >}}
xcrun simctl delete unavailable
{{< / highlight >}}

## Xcode | Archives
Xcode also stores some stuff named archives for some of your projects which are bigger than IPAs because they contain additional data like debug information.

- go to `~/Library/Developer/Xcode/Archives`
- and delete the ones you don't require.

## Xcode | DerivedData
Xcode generates build specific files for each and every project of yours. If you delete those, afterwards, your initial compilation for those projects will be a bit more time consuming. And you might be pulling out your hair when compiling  Swift(which saw dramatic compile time increases in these recent times) **but** as a developer you've probably opened a lot of projects. Some of which you don't need any more. So at least delete these projects' derived data to gain some space:

- go to `~/Library/Developer/Xcode/DerivedData/`,
- delete as to your liking.

## Xcode | Logs
You might have some unnecessary logs lying around. You won't be gaining a lot of space but worth a look:

- go to `~/Library/Developer/Xcode/iOS Device Logs/`,
- delete as to your liking.

## Xcode | Old Device Information
Remember the times when you connect a device and Xcode generates some stuff(that takes forever) to be able to deploy your applications on device? Yeah, Xcode does that a lot and unfortunately, stores all of them. Even the ones generated for older versions of iOS; which you definitely won't be needing anymore.

Therefore:

- Go to `~/Library/Developer/Xcode/iOS DeviceSupport/`,
- And delete the ones belonging to old versions of iOS.

Capping at about 400MB per folder for some, may be it'll be just a couple of gigs getting cleaned up but better than none at the least.

# Daisy Disk
As a person, you might have unnecessary files lying somewhere on your disk. Trust me, it's impossible or really frustrating to hunt them down by browsing via Finder.

For this purpose, I suggest [DaisyDisk](http://daisydiskapp.com). I've used it many times with great pleasure. There's nothing new here. It's a basic disk usage visualisation app but with great macOS support.