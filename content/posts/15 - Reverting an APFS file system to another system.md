---
title: "Reverting an APFS file system to another system"
slug: "reverting-an-apfs-file-system-to-another-system"
date: 2020-08-18
tags: ["macos"]
draft: false
type: "posts"
content_dir: "/post-contents/15-reverting-an-apfs-file-system-to-another-system/"
---
If you've ever formatted one of your storage devices file system to APFS and afterwards tried to convert it back to another file system, say ExFat, it's not doable with our good-old friend Disk Utility.

{{< img src="disk-utility-erase-apfs-unable.jpg" title="Unable to format an APFS drive in Disk Utility" >}}

It seems as if once you commit to APFS, Apple doesn't want you to leave. Hmm, that's not like Apple to lock you into their ecosystem. 😝

{{< img src="meme-you-shall-always-use-apfs.jpg" title="You shall always use APFS!" >}}

Be that as it may, it's not impossible to revert back but let's dig in and find out what's going on.

## Why all the cloak and dagger?

Compared to the older file systems, APFS is designed differently. Meaning that it has a new thing called a `container` which is the base storage unit for APFS.

Each container is able to export one or more volumes(the actual drives you see in the Finder).

## So, tell me how?

OK, enough talk; let's get to the action.

If you want to convert an APFS formatted storage device to another format, you will have to go with using the Terminal. Disk Utility doesn't provide any options in that regard. At least, none that I could fin.  However, if you're unfamiliar with Terminal, be not afraid, it's quite straight-forward.

First up, as usual, you should find the disk ID of your storage device. Hence, type the following command and find out the ID.

	diskutil list

Afterwards, if you were to try the regular command to format a storage device, you would go with something like this:

	diskutil eraseDisk ExFat Transporter /dev/disk[ID]

Which should get it done but instead it throws out the following error:

> You cannot manually format an existing APFS Container disk

It turns out that we first have to delete the `container` of the APFS so that things are back to business as usual:

	diskutil apfs deleteVolume /dev/disk[NUMBER]s[NUMBER]

{{< img src="meme-delete-the-container.jpg" title="Delete the container!" >}}

If you have multiple APFS `containers` in that storage device, you have to delete all of them before formatting the device into another format.

I know the command `deleteVolume` is a bit misleading when we're deleting the container but as the documentation states:

> deleteVolume        (Remove an APFS Volume from its APFS Container)

OK, now we're free. Now you can do whatever you want. It's actually possible to go back to Disk Utility and continue our endeavour there but I prefer the Terminal and since we're already here, let's just fire up the following command:

	diskutil eraseDisk ExFat Transporter /dev/disk[ID]

Oh, by the way, if you want to see other options, you can type `diskutil apfs`. Since, you know, if Apple hides something else.

## Why Apple, Why?

Yeah, but why? I mean, seriously Apple. Why have you done this?

I get that APFS has a different structure and you had your reasons to build it but why not provide the same functionality in Disk Utility. As I mentioned above, I prefer working in Terminal but this easily causes confusion all around. I see no technical reason why Disk Utility can't do this.

## Resources

- [http://osxdaily.com/2016/08/30/erase-disk-command-line-mac/]()
- [https://discussions.apple.com/thread/8144143]()
- [https://www.macobserver.com/tips/deep-dive/macos-sierra-delete-apfs-partition-right-way/]()
- [https://www.howtogeek.com/327328/apfs-explained-what-you-need-to-know-apples-new-file-system/]()
- [https://www.imore.com/apfs]()
- [https://apple.stackexchange.com/questions/300147/hfs-vs-apfs-what-are-the-pros-cons-of-converting-hdds-to-apfs]()
