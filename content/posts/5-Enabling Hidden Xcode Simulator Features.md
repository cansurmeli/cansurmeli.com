---
title: "Enabling Hidden Xcode Simulator Features"
date: 2017-11-16
tags: ["xcode"]
draft: false
---

Apple has some nice little features for the simulator in Xcode to boost your productivity or improve your environment. However, unfortunately, even if they're currently fully functional, they're hidden away. And knowing Apple, they'll most probably keep it that way.

Although, that doesn't mean these features were meant to stay hidden. You can enable them yourself. It used to be that only a single Terminal command of `sudo mkdir /AppleInternal` would enable it but as it has been commented out to me, it seems that Apple put some safe guards against this command. Now, in your root directory, you can create any folder but `AppleInternal`. 😐 In the end, it's still the same command but now it requires a little bit more hoops to get around; namely, you need to go into your recovery partition.

By the way, this hack I'm going to show isn't something I've discovered myself. Can't actually remember who tweeted it(sorry about that 😕) but this is something I grabbed from Twitter some time ago.

# How to
1. Shut down your Mac,
2. Boot into the `Recovery Mode`,
	- When shut, start pressing `CMD + R` and while still pressing power up your machine and keep pressing the button combination until the Apple logo appears so that your Mac boots into the `Recovery Mode`.
4. Click `Utilites` and choose `Terminal`
5. Type `diskutil list` and identify the id of your disk named ` Macintosh HD`
	- it should be something like `/dev/disk2s2`
6. Now we need to mount it: type `diskutil mount /dev/[YOUR_DISK_ID]`. If successful, keep going with the next step. If not, you probably got a message regarding APFS that the disk needs to be unlocked, so type `diskutil apfs unlockVolume /dev/[YOUR_DISK_ID]`
7. Finally you can create the required folder to enable hidden Xcode features: type `mkdir /Volumes/Macintosh\ HD/AppleInternal`

Now you can get out of the `Recovery Mode` and boot your Mac as usual.

As you can see, you merely created a folder in your root directory but what this enables is that now when you launch Xcode, it will be displaying it's build number on top of it's Dock icon. It's a nifty feature when you immediately need to find out if the build number matches with the one on the developer portal; especially at times of post WWDC where betas keep popping out. Saves you the trip of going to the `About Xcode` menu item or showing the launch screen.

![Xcode Dock Icon After AppleInternal](/images/5-Enabling-Hidden-Xcode-Simulator-Features/XcodeDockIconAfterAppleInternal.png)

But it's a somewhat boring feature compared to the rest. If you launch the simulator from now on, you'll see a new bar menu item named `Internal`. If you click it, you'll see that it gives your various options, for instance showing single touches, changing the chrome colour or etc.

![Simulator's Internal Menu Enabled](/images/5-Enabling-Hidden-Xcode-Simulator-Features/SimulatorInternalMenuEnabled.jpg)

Wait, what, we can put the simulator and Xcode side-by-side in full screen mode. 😱😱😱

![Simulator's Internal Menu Full Screen Mode Option](/images/5-Enabling-Hidden-Xcode-Simulator-Features/SimulatorInternalMenuFullScreenMode.jpg)

Go ahead and check that option. From now on, you can fulfil your dream of putting Xcode and the simulator side-by-side.

![Xcode and the Simulator in Full Screen](/images/5-Enabling-Hidden-Xcode-Simulator-Features/XcodeSimulatorFullScreen.jpg)

Happy coding! 😉