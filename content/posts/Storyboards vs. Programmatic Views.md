---
title: "Storyboards vs. Programmatic Views"
slug: "storyboards-vs-programmatic-views"
date: [TODO]
tags: ["fitness"]
draft: true
---
# Visual Flow with Storyboards
An advantage of Storyboards is that they provide anyone coming to the project an overview of what the view flow is; so that they can easily grasp what's going on.

It's all well and good but don't you have a design file built with Sketch or Adobe XD lying somewhere. Why do we need a similar thing besides our code as well.

# Connections
When you first start iOS development, it will surely be great that you can visually connect your views into your code. Especially if you're coming from the world of Android.

BUT, and it's a big but, once you start mastering iOS, you'll often find it daunting to keep opening the assistant editor.

Also, Xcode does not do a good of tracking your IBOutlets that once you remove something from code, your project may crash which will cause unnecessary hick ups; best case: merely irritation, worst case: you'll think something else crashed and start on a goose chase.

**winner:** programmatic views

# Availability
I totally respect the Interface Builder team. Even though I prefer programmatic views, I respect their work.

However, a big downside of Storyboards and Interface Builder in particular is that not every option for the design elements are available in the right hand side. And the ones that are are sometimes scattered around tabs or you've to put them in as values. Whereas with programmatic views, everything is oen after another. Neat and tidy. Just as everything should be.

![gamora thanks picture]()

# Git Conflicts
Okay, this is a no brainer. If you use Storyboards, you'll have merge conflicts. End of story.

Sure, you can follow the words of the wise people around you which are things like don't let two different people touch the same Storyboard file or adjusting your `.gitattributes` file against those pesky merge conflicts.

But hey, yet again, it's a major pain in the ass. Storyboards and Git just doesn't play nice together and some remedies can/might help but there is no silver bullet.

**winner:** programmatic views

# Convoluted Storyboard Files
When we had merely `.xib` files back in the days, it was a screen per file so that we didn't come across this:

![A well convoluted Storyboard]()

**winner:** a draw

# Mastering
Programmatic views are better; at least in my opinion. But one thing they're not is that they're easy. At least not in the beginning.

Because when you create your view programmatically, you'll require a better understanding of iOS and especially its view life-cycle since we're not writing spaghetti code.

Therefore writing programmatic views can be a bit daunting at first but if you're an iOS master or when you become one, it won't matter.

**winner:** Storyboards

# Conclusion
There you have it; it was a though fight. But the score is [NUMBER] against [NUMBER].

I'd like to mention again that this subject is a highly debatable subject and I just wanted to give you my way of thinking. You might have different needs that accommodate Storyboards better or in the coming years, Apple would do something interesting with Storyboards and makes them much more usable than ever which we would return back to this debate and do it all over again! Who knows.