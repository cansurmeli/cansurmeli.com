---
title: "CAT Cable Guide for Humans"
slug: "cat-cable-guide-for-humans"
date: 2016-11-30
tags: ["tech", "IT"]
draft: false
type: "post"
---

# Home Cabling
A while ago, I learned that for some time, building contractor’s were using ethernet cables to build the telephony network running inside the homes. Since RJ11(telephone jack) requires only two copper wires to function, the contractor uses ethernet cables(which have either 6 or 8 copper wires) to build up the telephony network, connects only 2 of those 6 or 8 wires and leaves out the rest hanging. The reasoning behind: well easy, not much of a price difference between regular telephony networking cable and ethernet cable.

So, you just might have a fully functional LAN network running inside your house. All you have to do is change out your jacks on your walls and make the connections. No extra cabling, no punching through walls.

# Wi-Fi vs. LAN Cables
Although I hear you saying, what’s the big deal? Where have you been living? We’ve Wi-Fi. Yes, indeed we do. We can’t do without Wi-Fi. I’m not saying to ditch your Wi-Fi network. It’s mandatory for our smartphones, tablets and other non-wired devices. **BUT it’s always better to go with wires when you can.** For couple of reasons:

 - Wi-Fi signals are hard to distribute in houses. Even [the White House](http://www.theverge.com/2016/2/8/10937580/white-house-wifi-is-bad) doesn’t have a great Wi-Fi coverage for the president. The architecture of buildings greatly affects the signal distribution. You’ll get good reception when you’re close to your router but as you move inside your house the signal will degrade. If your house is mostly out of concrete, this degradation will be far worse and you might even have signal dead zones that Wi-Fi may not even function at all.
 - Even if you successfully distribute Wi-Fi signals, a wired connection will not fluctuate due to temporary signal problems that can be caused by microwave ovens or other equipment operating at the same frequency as Wi-Fi,
 - a wired connection will always give you the fastest data transfer rates. Your router might work at 5 GHz but it requires line of sight to do so and even then still it’s not as fast as a wired connection. Therefore if you have a NAS device connected to your home network, you’ll be better off with a wired connection.

# Rule of Thumb
**As a rule of thumb, go with a wired connection whenever you can and leave out the rest to Wi-Fi.**

Connect your devices such as desktop computer, PS4, XBOX, TV or such with a wired connection. As these devices are more likely to suck in more data(4K video, online gaming, etc.) you’ll be happier with the steady connection a LAN cable provides.

# CAT Cables
So, enough talk about Wi-Fi vs wired connections. When I learned about the home cabling situation, I set on to investigate my house’s telephony network. My cabling quality didn’t come out as I have expected it to be and in the end I had to opt for power line ethernet. But in the process, I had to extensively deal with ethernet cabling standards. Those `cat<number>` words. So after all this, I thought it was appropriate that I share what I learned.

The below is nowhere near a fully fledged guide on network cabling standards. They’re just brief explanations with easy to remember basic information for your peace of mind.

## Cat3
This is dinosaur age cabling. When you see one, get far away as soon as possible.

## Cat4
16 Mbit/s at 20 MHz

Was used briefly in telephone networks and then superseded by Cat5.

## Cat5
10/100 Mbit/s at 100 MHz

Old standard of ethernet cabling. Has 6 separate copper wires running inside. At the moment, busy with dying…

## Cat5e(Cat5 enhanced)
10/100 Mbit/s and 1 Gbit/s(1000 Mbit/s) at 100 MHz

Only difference against Cat5 is that Cat5e is better at keeping signals on different circuits/channels from interfering with each other; hence it can provide 1 Gbit/s for small distances.

## Cat6
10/100 Mbit/s and 1/10 Gbit/s at 250 MHz

Has 8 separate copper wires inside. The cabling has better insulation. Therefore less signal degradation due to crosstalk(phenomenon where a signal from a channel/circuit interferes with another circuit/channel’s signal).

Cat6 can do 1 Gbit/s and 10 Gbit/s at only in 37 to 55m range.

## Cat6a
10/100 Mbit/s and 1/10 Gbit/s at 500 MHz

Because it operates at 500 MHz, 10 Gbit/s can perform at a range of up to 100m.

It’s a lot bulkier than before; about 50%. Although it’s been reduced by 10%, it’s still bulkier. So bigger radius to bend, heavier, doesn’t like zip ties. So forth and so on…

But never mind, this bulkiness becomes utterly obsolete because of the bandwidth requirements of our time. So, go for it. 👍🏻

## Cat6e
Basically, this is just a fairy tale. There is **no standard** for this and not going to be. It’s just some advertisement bullshit for someone in order to squeeze some more money.

## Cat7, Cat8 and beyond
The future. 😱

Quite frankly, this will keep going like the cat-mouse chase as some signal engineers find ways to operate at higher frequencies and longer distances.

Besides, we humans desperately need it since our needs climb like crazy(4K video, ring any bells).

## Sources
- https://en.wikipedia.org/wiki/Category_4_cable
- http://www.cableorganizer.com/articles/what-is-difference-between-cat6-cat6a.html
- http://www.cableorganizer.com/articles/cat5-cat5e-cat6.htm