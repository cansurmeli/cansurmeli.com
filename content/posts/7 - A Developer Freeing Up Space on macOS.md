---
title: "A Developer Freeing Up Space on macOS"
slug: "a-developer-freeing-up-space-on-macos"
date: 2018-07-04
tags: ["macOS"]
draft: false
content_dir: "/post-contents/7-A-Developer-Freeing-Up-Space-on-macOS/"
type: "posts"
---

Even though there are various articles on the web regarding how to free up space on your Mac; those articles are usually for end-users with basic instructions such as deleting your watched iTunes content, clearing out your Trash and etc.

As developers, we have different needs and usage patterns. Therefore if a developer wants to free up space on macOS, he/she needs to look elsewhere.

Overtime, as a developer myself, I've gathered some tips & tricks that allowed me to save quite a lot valuable storage space. Even though SSD prices are going down, there are a lot of us still using 256 GB of storage(I'm one of them). And, in my opinion, even if you've much more storage space, you should have a clean system. It's not good to keep clutter lying around.

# Clear Out 3rd Party Stuff

You're probably using a dependency manager such as Carthage or making use of Homebrew to sort out your shell needs. If so, you definitely need to check out their garbage because they produce a lot of it.

## Clear Out Carthage's Cache

{{< highlight bash >}}
rm -rf ~/Library/Caches/org.carthage.CarthageKit/
{{< / highlight >}}

## Clear Out Cocoapods' Cache

{{< highlight bash >}}
rm -rf "${HOME}/Library/Caches/CocoaPods"
{{< / highlight >}}

## Clear Out the Old Brews

{{< highlight bash >}}
brew cleanup
{{< / highlight >}}

# Unnecessary Languages/Architectures

You could be speaking multiple languages that you're making use of multiple keyboard layouts throughout your daily workflow but that doesn't mean you instantly change macOS' language.

You stick to one of those languages, most probably English, and the rest of the them just sit there; doing nothing but taking up space. Why not delete them!

You could visit each and every application you've got and hunt down their language files but why bother; use [Monolingual](https://ingmarstein.github.io/Monolingual/).

With Monolingual, not only you can cleanup unused macOS languages but you can also get rid of the architectures you're not making use of.

For instance, by removing the languages I'm not using, which was anything but English, I've made a saving of close to 1 GB.

{{< img src="monolingual.png" title="Unnecessary Language File Removal with Monolingual" >}}

However, do **be careful** when you're deleting the:

- **unused languages:** If your English is set to a non-American English like the British English, do leave both the American and the British English behind as some apps might be defaulting to the American English and if you delete that you might have to deal with weird strings for buttons or menus and end up reinstalling some of your software,
- **app architectures:** This is a tad more elaborate and could lead to some apps not launching afterwards. Of course, a reinstall of those apps would solve the situation but approach this deletion **if you know what you're doing**.

> Also, I wish, Apple would've supported this itself by employing app thinning on iOS to macOS as well and improve the process. Optimisation is always a good idea and there is still a lot that can make use of it.

# VMware Fusion Junk

As far as I can remember, I've been using VMware Fusion for my virtualisation needs on macOS. There was one or two occasions where I tasted the other solutions but they didn't cut it so I always ended up with VMware.

Anyways, if you're like me and using VMware Fusion, you need to watch it out! The thing is that, if you've dynamic allocation set for your VMs' disk spaces(which, most probably, you do), VMware does indeed increase the disk spaces by dynamically allocating the space as the naming suggests BUT it does **NOT** dynamically shrink them. Key point here!

Therefore, even if you see space freeing up inside your VMs as you delete stuff inside them, the VM file size on the macOS side won't shrink!

On that note, for your Windows machines, you need to:

- power-off your VM,
- go to it's VMware settings,
- click on `General`,
- click on `Clean Up Virtual Machine`.

Unfortunately, the comfort of a single button click is not available for Linux distributions; at least, at the time of this writing. For them, you need to perform some shell magic which I won't touch here since it's a bit more of a lengthy process. Maybe I'll touch on it later but for now, you can do some search to come up with a solution.

## Managing VM Your Storage

This isn't exactly related to freeing up the constantly growing garbage on your Mac but I'd really like to point it out that as a best practice, I would advise you to store your VMs not on your Mac's disk but on an external one that has **at least USB 3.0 connectivity**.

The reason? Well, simple. VMs can/do get messy pretty quickly. Speaking about myself, I usually have multiple VMs present and sometimes I duplicate one if I'm going to do some experiments. If you also take into consideration the above behaviour of VMware Fusion, it's a no brainer to store your VMs on an external disk.

This used to be impossible as peripheral speeds were not enough but starting with USB 3.0, read/write speeds are decent enough.

> However, a little remark regarding the connectivity here. If you're going with USB-C, you're fine but if you're going with USB 3.0, you need the full potential of it so do be careful about the disk's or dongle's read/write speeds.

# Handle Xcode

Chances are you're most likely a developer on one of Apple's platforms. If that's the case, whether you've a love or hate relationship with Xcode, from time to time, you need to maintain it.

Here is a preview of things to come:
{{< img src="xcode-junk.png" title="Xcode's Junk" >}}

## Delete Unnecessary Xcode Simulators

If you don't really have a lot of backwards compatibility aims while developing:

{{< highlight bash >}}
xcrun simctl delete unavailable
{{< / highlight >}}

Or, if you want to go manual:

- visit the location `~/Library/Developer/Xcode/Devices`
- and delete the ones you don't need.

However, unfortunately, Apple gives non-human-readable names to those simulator folders, so you do need to visit each folder's `device.plist` file.

Anyways, upon doing so one time, I've reduced the storage of 14 to 15 GBs of simulators to merely 236 MBs!

## Xcode | Archives

Xcode also stores some stuff named archives for some of your projects which are bigger than IPAs because they contain additional data like debug information.

- go to `~/Library/Developer/Xcode/Archives`
- and delete the ones you don't require.

## Xcode | DerivedData

Xcode generates build specific files for each and every project that your hit run on. If you delete those, afterwards, your initial compilation for those projects will be a bit more time consuming. And you might be pulling out your hair while compiling Swift(which saw dramatic compile time increases in recent times) **but** as a developer you've probably opened a lot of projects; some of which you don't need any more. So at least delete those projects' derived data to gain some space:

- go to `~/Library/Developer/Xcode/DerivedData/`,
- and delete to your liking.

## Xcode | Logs

You might have some unnecessary logs lying around. You won't be gaining a lot of space but it's worth a look:

- go to `~/Library/Developer/Xcode/iOS Device Logs/`,
- delete as to your liking.

## Xcode | Old Device Information

Remember the times when you connect a device and Xcode generates some stuff(that takes forever) to be able to deploy your applications on device? Yeah, Xcode does that a lot and unfortunately, stores all of them. Even the ones generated for older versions of iOS; which you definitely won't be needing anymore.

Therefore:

- Go to `~/Library/Developer/Xcode/iOS DeviceSupport/`,
- and delete the ones belonging to old versions of iOS.

Capping at about 400MB per folder for some, may be it'll be just a couple of gigs getting cleaned up but better than none at the least.

# Daisy Disk

Even though I've taken you through a lot of tips and tricks, you still could have unnecessary data lying somewhere on your disk based on your usage. Trust me, it's impossible to hunt them down by browsing via Finder.

Therefore, I highly recommend [DaisyDisk](http://daisydiskapp.com). It's a disk usage visualisation app but with great macOS support. If you're on Catalina where Apple is really pushing on sandboxing(which, they should), you definitely need something that properly supports macOS.

I've used DaisyDisk many times and it helped me trash a lot of garbage bits and bytes.

# Conclusion

Wow, that was a lot of garbage chasing. A bit time-consuming and frustrating but it pays back to have a clean system.

Happy coding.