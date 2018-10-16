---
title: "Install Swift on Debian"
slug: "install-swift-on-debian"
date: 2018-07-02
tags: ["swift", "linux"]
draft: false
---

Recently, I had to use Swift on Debian for a small project of mine.

There are various installation procedures on the web for installing Swift on Linux but they're mostly for Ubuntu. Since things change with every Linux distribution, I want to share what I did.

The following procedure will cover installing Swift 4.1.2 on Debian Jessie.

1. Make sure your Debian system is up-to-date,

		$ sudo apt-get update && sudo apt-get upgrade

2. Install the dependencies required by Swift

		$ sudo apt-get install clang libicu-dev

3. Check that you've `alien` installed. We'll need it later on,

		$ sudo apt-get install alien

4. Download Swift with whatever you want. I prefer `wget`. Since we're on Debian Jessie, you should opt for the Ubuntu 14.04 download of Swift 4.1.2 since Ubuntu 14.04 supports Debian Jessie.

		$ wget https://swift.org/builds/swift-4.1.2-release/ubuntu1404/swift-4.1.2-RELEASE/swift-4.1.2-RELEASE-ubuntu14.04.tar.gz

5. Uncompress the tarball

		$ tar -xvzf swift-4.1.2-RELEASE-ubuntu14.04.tar.gz
		
6. Enter into the uncompressed directory

		$ cd swift-4.1.2-RELEASE-ubuntu14.04
		
7. Compress the `usr` directory into a `tar.gz`

		$ tar -cvzf swift-4.1.2.tar.gz usr
		
8. Use `alien` to generate a `.deb` package,

		$ sudo alien -v swift-4.1.2.tar.gz
		
9. Install your newly created `.deb` package

		$ sudo dpkg -i swift_4.1.2_all.deb
		
That's it. Now you can enter into Swift by typing `swift` into your shell prompt or compile your Swift files with `swiftc`.
		