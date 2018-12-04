---
title: "Install Swift on Debian"
slug: "install-swift-on-debian"
date: 2018-07-02
tags: ["swift", "linux"]
draft: false
type: "posts"
---

Recently, I had to use Swift on Debian for a small project of mine.

There are various installation procedures on the web for installing Swift on Linux but they're mostly for Ubuntu. Since things change with every Linux distribution, I want to share what I did.

The following procedure will cover installing `Swift 4.1.2` on `Debian Jessie`.

- Make sure your Debian system is up-to-date,

{{< highlight bash >}}
apt-get update && sudo apt-get upgrade
{{< / highlight >}}


- Install the dependencies required by Swift,

{{< highlight bash >}}
apt-get install clang libicu-dev
{{< / highlight >}}

- Check that you've `alien` installed. We'll need it later on,

{{< highlight bash >}}
sudo apt-get install alien
{{< / highlight >}}

- Download Swift with whatever you want. I prefer `wget`. Since we're on Debian Jessie, you should opt for the Ubuntu 14.04 download of Swift 4.1.2 since Ubuntu 14.04 supports Debian Jessie.

{{< highlight bash >}}
wget https://swift.org/builds/swift-4.1.2-release/ubuntu1404/swift-4.1.2-RELEASE/swift-4.1.2-RELEASE-ubuntu14.04.tar.gz
{{< / highlight >}}

- Uncompress the tarball

{{< highlight bash >}}
tar -xvzf swift-4.1.2-RELEASE-ubuntu14.04.tar.gz
{{< / highlight >}}
		
- Enter into the uncompressed directory

{{< highlight bash >}}
cd swift-4.1.2-RELEASE-ubuntu14.04
{{< / highlight >}}

- Compress the `usr` directory into a `tar.gz`

{{< highlight bash >}}
tar -cvzf swift-4.1.2.tar.gz usr
{{< / highlight >}}

- Use `alien` to generate a `.deb` package,

{{< highlight bash >}}
alien -v swift-4.1.2.tar.gz
{{< / highlight >}}

- Install your newly created `.deb` package

{{< highlight bash >}}
dpkg -i swift_4.1.2_all.deb
{{< / highlight >}}

That's it. Now you can enter into Swift by typing `swift` into your shell prompt or compile your Swift files with `swiftc`.
		