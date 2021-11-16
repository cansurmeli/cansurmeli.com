---
title: "Reduce PDF Storage Size While Retaining Quality on macOS"
slug: "reduce-PDF-storage-size-while-retaining-quality-on-macos"
date: 2021-11-16
tags: ["macOS", "productivity"]
draft: false
content_dir: "/post-contents/16-reduce-PDF-storage-size-while-retaining-quality-on-macos/"
type: "posts"
---

> As the title implies, this post is macOS-specific so be aware!

PDFs are great! Who doesn't like them. On second thought, perhaps they're just great for viewing and not editing but that's not the point of this post anyway. I would like to show you how you can reduce the storage space occupied by a PDF file while retaining its quality.

## Why have high quality PDFs

I prefer to keep my PDFs high quality. You never know when you might need them. It could be a simple document to a government agency or something more valuable like an old letter from an old family member. Storage is cheap and practically indefinite these days. Plus, we keep getting higher quality screens. That's my side of the story.

## When and Why to Shrink PDF storage Size

As soon as I'm about to send someone a PDF over e-mail that the utmost quality is not paramount, I shrink my PDFs.

You might say there are upload services but:

- they can go out of business(e.g. Firefox Send),
- time limit for storing the file online: you never know when the other side will download it,
- as idiomatic as it can be, some people have trouble downloading them(especially government agencies)
- or finally, they are dinosaurs and they insist on local copies.

## Shrinking Strategies

You can easily find an online service to shrink your PDFs but:

- they usually require some form of subscription and/or spam you afterwards,
- and you can't trust them with your data(especially with something sensitive like a bank statement, etc.).

Therefore, I prefer to do this operation locally on my Mac. One thing I like about Apple software ecosystem is that how agile their fundamentals are. A part of that ecosystem is Preview.app on macOS. It looks so simple yet powerful.

Apple has a framework called [Quartz](https://developer.apple.com/documentation/quartz) where as the documentation says, it `Allow users to browse, edit, and save images, using slideshows and Core Image filters.`. A part of that framework is Quartz Filter which Preview.app taps into to allow you to do modifications on PDFs.

## How to Utilise Preview.app for PDF Size Shrinking

Luckily, Preview.app already comes with Quartz Filters. Actually, even one of them is for shrinking PDFs but its parameters aren't properly set and hence it does a poor job; the end product is highly compressed that it isn't readable. Therefore, what we have to do is just set those parameters to our liking:

- Go to `/System/Library/Filters`,
- Copy `Reduce File Size.qlfilter` to another location such as your Desktop,
- Now it depends on how many options you want but I decided on three different options for shrinking a PDF at different levels. Therefore, copy that file two times to end up with three files,
- I named the files as such: `Reduce File Size [end product [LEVEL] quality].qfilter`. The naming is important here since you might forget what exactly a filter does so it's better to be descriptive. Each time, exchange `[LEVEL]` with low, medium, or high that in the end you have:
	- `Reduce File Size [end product low quality].qfilter`
	- `Reduce File Size [end product medium quality].qfilter`
	- `Reduce File Size [end product high quality].qfilter`
- Within those files you've just named, you need to change a few values of key-value pairs:
	- `<key>Compression Quality</key>`
		- The quality of the end product. The higher the better. I set them as below:
			- low: 0.25
			- medium: 0.5
			- high: 0.75
	- `<key>ImageSizeMax</key>`
		- Maximum size your images can reach. I set them as below:
			- low: 848
			- medium: 1688
			- high: 3512
	- `<key>Name</key>`
		- Name the same just as the file naming convention you've used above. Note that, later on Preview.app will that this value as the filter name.

If you want, you download my files {{< file name="here" src="filters.zip" >}} with the above modifications already made.

That's it for modifications. Now we have to place out modified filters. It's better not to go to that original location of `//System/Library/Filters`. Let the system be by itself. Instead:
	- go to `~/Library`
	- create a folder named `Filters`,
	- place all of the above filters into this folder.

And, we are done. Now when you open a PDF file in Preview.app, going through `File > Export`, if the `Format` is set to `PDF`, you `Quartz Filter` options will display the modifications you've just made. Select one and end up with smaller PDFs.

Again, if you want to have different/more options, you're more than welcome to change the above parameters or come up with different levels of quality.

# Results

Alright, enough talk. Time for some actual data on the results.

I scanned a three page document on a scanner with the resolution setting at 600 dpi. It ended up taking 18,4 MBs of space. After applying the above method with the `high` option, the same file ended up being 3,5 MB. So, that's a saving of roughly 81%. I'd say that's pretty good since the PDF is still highly readable.

# Resources

- https://apple.stackexchange.com/questions/297417/how-to-decrease-pdf-size-without-losing-quality
- https://www.macworld.com/article/218979/shrink-preview-files-without-ruining-image-quality.html