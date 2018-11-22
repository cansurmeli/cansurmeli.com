---
title: "My Adventures Opening up my iMac"
slug: "my-adventures-opening-up-my-imac"
date: 2015-02-11
tags: ["mac", "hardware"]
draft: false
type: "post"
---

A while ago, I performed a brain surgery on my iMac. I removed the optical disc drive, put a SSD in place and combined the SSD with the already installed HDD in order to create a fusion drive in order to achieve a much much better performance while increasing my storage.

Before I leave you out with my words, I think you should have a look at the time-lapse video of the procedure. It’s a delight to watch.

{{< youtube MarkAJJpXSo >}}

Anyways, had fun? Let’s get to the specifics.

# Why bother?
Before getting into the technical aspects, let's take a look at the reasons behind all this.

My iMac is the mid 2010 model. It’s hardware in terms of processor(3.06 GHz Intel Core i3), memory(16 GB 1333 MHz DDR3) and etc. are decent even though it’s not a fresh out of the line model but it’s storage was bottlenecking the beast inside.

So I decided to look out for a proper option for a SSD, one that would be good for me on performance, capacity & price. I decided on Samsung since it’s quite available in my country and they offer good quality for the price. I opted for Samsung 850 EVO 500 GB. I could’ve got the Samsung 850 PRO 512 GB with an added 12 GB and a little bit more performance but the review I read on Anandtech convinced me that EVO should suffice for my needs. Therefore I discarded paying something like 200$/250$ for an increase that wasn’t quite necessary.

I ordered the EVO with an SSD closure to hold it inside the iMac and started waiting for the cargo to arrive while I was looking over to the iFixit documentation and readying myself.

# Let’s get to it
Finally, the stuff arrived and I made the replacement following iFixit’s most helpful guides and tools. It was a through process; iFixit helps a lot but I should mention that having some previous experience, again thanks to iFixit, is yet another cold beverage in the desert if I might add since these nasty electronic parts are sometimes a little hard to manage. Now I clearly see why China is a favourable place for electronic assemblies. Small hands! :]

# Making the fusion drive happen
After the hardware installation, comes the software preparations for the new beast in the block.

Before hand, I made a OS X 10.10(Yosemite) USB installer. First I used it to adjust the drive for the Fusion Drive. Here are the detailed steps I followed:

- boot from the USB installer,
- switch to the Terminal,
- type `diskutil list`,
- take note of the SSD and the HDD disk IDs, 
	- for the SSD, take the ID of the main partition,
	- for the HDD, take the ID covering ONLY the data part. Leave out the recovery partition if you want to retain it without hassle later on.
- type `diskutil cs create [arbitrary_name] disk0 disk1s2`. This command returns an UUID, copy it for the next step,
- type `diskutil cs createVolume [UUID] jhfs+ [arbitrary_name] 100%`.

This process presents the two separate disks as a whole to the system, aka a fully functional Fusion Drive in my hands.

# OS X installation and more
Now that my iMac’s fancy new brain was ready, I started the OS X installation.

After the installation, I started out from fresh and didn’t started the transfer of my Time Machine backup. I wanted a clean slate. No particular reason here, I’d no problems with my old system but knowing this much about computers, I rightfully so found it appropriate for a fresh OS X since operating systems are complex things and they carry unnecessary weight over time even though Apple does an excellent job at maintaining the integrity of their OS. I merely manually copied my files from my Time Machine backup, the ones not on the cloud, and started installing my apps.

Besides my Time Machine backup, most of my files started downloading from the cloud once I logged in to iCloud and Dropbox anyway. That’s another fancy gesture of these days that stuff just works, as Steve once said. :]

One last suggestion by the way, keep your backup(s) around for a couple of days even after you’ve successfully completed the procedure. We rely heavily on our computers and you never know what you might’ve left out or go wrong.

# A few last words
If you’re computing on a non-SSD system and you’ve some spare time with some basic hardware speciality to deal with all this mess, I strongly recommend what I did. It will truly pay off and you'll get great price for the cost.