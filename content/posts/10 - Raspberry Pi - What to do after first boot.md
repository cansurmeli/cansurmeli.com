---
title: "Raspberry Pi - What to do after first boot"
slug: "raspberry-pi-what-to-do-after-first-boot"
date: 2018-10-16
tags: ["raspberrypi", "hacking"]
draft: false
content_dir: "/post-contents/10-Raspberry-Pi-What-to-do-after-first-boot/"
type: "posts"
---
When you boot into your Raspberry Pi for the first time, it’s ready to do wonders! But before you do so, you can/should do some adjustments to better manage it.

Over the years, I’ve setup many `Pi`s and here are the things I perform when I first boot into one.

**Before we get started:**

- I'm a CLI person; so, all of the below will be about working via the SSH,
- for the sake of clarity, I've diluted some stuff. Therefore you need some prior knowledge on how to work with the CLI,
- the below are fairly common *nix commands, however, you should keep in mind that I assume you've installed Raspbian and you're on a Mac,
- some steps are not mandatory as mentioned below **BUT** they're much preferred as best practices. Especially if you don't have a lot of experience working with *nix systems, I highly suggest applying them to get familiar with dealing with such systems. One day, you may have to put effort on the cloud and it's better to start with training wheels.

## [mandatory] Start logging

Alright, first things first. Good practices at all times! Therefore keep a log of what you've done with your Pi.

You might see your Pi as a spare time hobby thing but chances are you are going to setup another Pi in the future or you are going to use the procedures you've accomplished on this Pi in another Linux project of yours; since, you know, Linux is everywhere.

As time goes by, you'll forget what you've configured; especially the minor ones. Also there is good chance that you're going to deal with stuff that weren't exactly hard to accomplish but just hard to figure out what to do and it pays to know what you did so that a ten minute configuration doesn't prolong for hours of research. So, be a good lad or gal, and write down exactly what you've configured. Nothing fancy: just a few words and a link to the tutorial if there is one should be sufficient.

If you want a template, you can grab mine. I've also added some dummy content to get you started.

{{< file name="Raspberry Pi Log Sample" src="rPi-Log-Sample.md" >}}

## [mandatory] Change the default password

That should be the very first thing you do when you first boot into your Pi.

Just type `passwd` and change your Pi’s default password to anything else other than `raspberry`.

`Pi`s are mostly installed in homes to do some hacking on the side so you might be the only one to tinker with it but as a good practice, just do it.

## [mandatory] Assign a static IP

Since you’ll be remotely interacting with your Pi, it’ll need a static IP. Otherwise you may have to fish it out every time your Pi boots or your network restarts.

To do so, I would like to point you to [this](http://www.circuitbasics.com/how-to-set-up-a-static-ip-on-the-raspberry-pi/) good resource.

## [mandatory] Update the system

Before you go any further, update your Pi to keep it at it’s best.

Even if you’ve just downloaded Raspbian, it will have some outdated packages lying inside.

{{< highlight bash >}}
apt-get update && sudo apt-get upgrade && sudo apt-get clean
{{< / highlight >}}

## [mandatory] Clone the SD Card

I can't emphasise this enough! Once you've configured your Pi to your needs, you **MUST** clone the SD card.

By cloning the SD card, you'll have a re-usable image. Exactly like the Raspbian image you've downloaded but with all the software you've installed and the configurations you've made.

Therefore, if something goes wrong with your Pi(and chances are that it will), you can easily carry on with the clone you've made rather than a clean slate.

Depending on when you've made your clone, you might have some inconsistencies with your last working Pi state, but trust me, if you've made a lot with your Pi, like me, it's much better to deal with minor inconsistencies than major ones; like a fresh copy of Raspbian. :]

One more thing before we start. The clone you'll be making will be the size of your SD card even though you're not using all of it's capacity. Therefore the cloned image of a 32GB SD card will take up 32 GB of space on your computer.

In order to create a clone of your Pi:

- power off your Pi,
- remove the SD card,
- place the SD card into your Mac,
- launch Terminal,
- type `diskutil list`,
- note the identifier of your SD card(e.g. `disk2`),
- type `sudo dd if=/dev/disk[ID] of=~/Downloads/rpi.dmg`
- give in your password,
- wait.

The amount of time consumed by the cloning operation will depend on your Macs speed and your SD cards size.

And the bummer is that, there is no progress bar during the operation. So, be patient and let the process run its course.

For instance, the clone I've made on my 2017 MBP(2.8 GHz i7 with 16 GB RAM) took roughly 70 minutes.

In order to restore your clone:

- place the SD card into your Mac,
- launch Terminal,
- type `diskutil list`,
- note the identifier of your SD card(e.g. `disk2`),
- type `distil unmountDisk /dev/disk[ID]`,
- type `sudo newfs_msdos -F 16 /dev/disk[ID]` to format your SD card,
- type `sudo dd if=~/Desktop/raspberrypi.dmg of=/dev/disk[ID]`

Again, the above process will also take quite a bit of time depending on your Macs speed and the images size; and there is no progress bar again. So be patient.

One last thing to mention about cloning is to repeat from time to time. Your Pi is not a mission critical thing, so it doesn't need to be cloned in a tight manner but a clone every a few months should do it.

## [optional] Install vim

Raspbian doesn’t come with `vim` pre-installed which is the editor I prefer.

{{< highlight bash >}}
apt-get install vim
{{< / highlight >}}

Also, from this point on, I will be explaining file edits via Vim. If you choose not do so, go with your preferred text editor.

## [optional] Create a custom user

I can’t think of a mandatory technical reason for this one but in order to keep things neat and tidy, I prefer to create a new user account to work on the Pi.

To create a new user, simply execute the following command:

{{< highlight bash >}}
adduser [USERNAME]
{{< / highlight >}}

If you would like to give that newly created user `sudo` privileges, follow the steps below. However, you’ll be editing a system file with the system's default text editor, which is currently set to `nano`. If you prefer `vim` like I do, execute the following command beforehand:

{{< highlight bash >}}
update-alternatives --set editor /usr/bin/vim.tiny
{{< / highlight >}}

On to giving `sudo` privileges to your newly created user:

- `$ sudo visudo`,
- find the line with the title commented out as ` # User privilege specification`,
- copy&paste the line underneath, the one: `root    ALL=(ALL:ALL) ALL`
- change the username in the new line to your newly created username.

And now take your newly created user's `sudo` privileges for a spin:

- type `su - [USERNAME]`  to switch to your newly created user,
- type `sudo ls /`
- enter your password,
	- **if** all goes well and your root directory gets listed, all is fine; carry on to next step,
	- **if not**, go back to your user `pi` and sort things out by carefully going over what's told above.

**Remark**

I would suggest you not to delete the user `pi` since some software makes use of it!

## [optional] Password-less login

It's more secure and convenient to login with public-key authentication.

First make sure that you're logged in as your newly created user. Afterwards:

{{< highlight bash >}}
cd ~
mkdir .ssh
chmod 700 .ssh
touch .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
{{< / highlight >}}

Then on your local machine:

{{< highlight bash >}}
cd ~/.ssh
ssh-keygen -t rsa -b 4096
{{< / highlight >}}

Follow the on-screen instructions.

Once done, copy the contents of the newly created key's public part and paste it into the `authorized_keys` file on your Pi. For example, on macOS, to copy the contents:

{{< highlight bash >}}
cat [KEY_NAME].pub | pbcopy
{{< / highlight >}}

## [optional] Adjust your SSH defaults

Let's do some basic adjustments to how `sshd` functions. This will be a quick recap and if you want more detail on what relates to what, do search the web or checkout the resources down below.

First, open the file that holds the configuration for `sshd`:

{{< highlight bash >}}
vim /etc/ssh/sshd_config
{{< / highlight >}}

Afterwards, change the following parameters in the file as suggested below:

{{< highlight bash >}}
- AuthenticationMethods publickey
- PubkeyAuthentication yes
- PermitEmptyPasswords no
- Port [YOUR_DESIRED_PORT NUMBER]
- ClientAliveInterval 300
- ClientAliveCountMax 0
- Banner /etc/issue
- IgnoreRhosts yes
- HostbasedAuthentication no
{{< / highlight >}}

Once you're done, have `sshd` acknowledge the changes by restarting it:

{{< highlight bash >}}
service ssh restart
{{< / highlight >}}

**Remark**

About port number designations:

- 0 - 1023: well known ports assigned to common protocols. Therefore do not mess around with these,
- 1024 - 49151: registered ports assigned by ICANN to a specific service. Might be alright for internal use but who knows, it might still conflict with some software of yours,
- 49152 - 65535: dynamic and/or private ports. Ideal for custom ports designations.

## [optional] Install ZSH

Bash is a great shell, although I prefer to work with Zshell(zsh) because it's much more capable:

- extensive auto-complete,
- further customisations

Hence, to install it and make it your default:

{{< highlight bash >}}
apt-get install zsh
chsh -s $(which zsh)
{{< / highlight >}}

## [optional] Change it's hostname

If you (will) have multiple Pis on your network or just want to differentiate your single Pi's name, you should change it's hostname.

For the hostname, you can only use:

- uppercase/lowercase letters from `a` to `z`,
- digits from `0` to `9`,
- and the dash(`-`).

There are two files managing the hostname of your Pi. For the first one:

{{< highlight bash >}}
vim /etc/hostname
{{< / highlight >}}

It should only contain a name, so change it to whatever you like.

For the second file(which is only there for some software):

{{< highlight bash >}}
vim /etc/hosts
{{< / highlight >}}

Find the line starting with `127.0.0.1` and change the hostname to your preferred one.

## Ideas

Now that your Pi’s got the fundamentals, the world is yours! 😜

You can do a lot with a Pi but here are some everyday ideas to make it useful in your home environment:

- [Pi Hole](https://pi-hole.net) (network wide ad-blocking)
- [VNC Server](https://pimylifeup.com/raspberry-pi-vnc-server/) (remote desktop)
- [Kodi](https://www.raspberrypi.org/documentation/usage/kodi/) (media center running on Raspbian)
- [AirPlay Receiver](https://pimylifeup.com/raspberry-pi-airplay-receiver/) (bring those old stereo equipment of yours to life without Apple's tax 😉)
- [iStat Server](https://bjango.com/istatserver/) (monitor your Pi's stats)
- [NAS Server](https://pimylifeup.com/raspberry-pi-nas/) (share a disk across your network)

**Remark**

For the purposes of turning your Pi into a media center, you've a few options out there other than Kodi; such as [OpenElec](https://openelec.tv)(formerly XMBC) or [OSMC](https://osmc.tv)(successor to Raspbmc). But those are **separate operating systems** built on top of other OSs. Meaning that if you choose one of them your Pi will serve merely as a media center and nothing else!

Personally, I prefer to go with the combination of Raspbian and Kodi since it allows me to do other things. Your preference may differ.

You can also go with the path of installing Raspbian on an SD card and OpenElec or OSMC on another and swap them out when needed, however, that's nowhere near convenient.

If you want some more information on turning a Pi hardware into a media center, [here](https://www.smarthomebeginner.com/media-center-softwares-for-raspberry-pi/) is a good resource.

## Resources

- [Initial Server Setup with CentOS 7](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-centos-7)
- [Renaming your Raspberry Pi - the 'hostname'](https://thepihut.com/blogs/raspberry-pi-tutorials/19668676-renaming-your-raspberry-pi-the-hostname)
- [How to change your SSH Port on the Raspberry Pi](http://kamilslab.com/2016/12/10/how-to-change-your-ssh-port-on-the-raspberry-pi/)
- [Top 20 OpenSSH Server Best Security Practices](https://www.cyberciti.biz/tips/linux-unix-bsd-openssh-server-best-practices.html)
