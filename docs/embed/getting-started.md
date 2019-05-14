---
title: Getting started with our Music engraving Embed
description: Discover how to quickly get started with our Sheet music embed.
permalink: embed/getting-started.html
nav: embed
pid: embed-start
---

The easiest way to get started with our [Sheet Music embed](https://flat.io/developers/embed) is to use our [code generator](https://flat.io/developers/embed/generator). This one will build the basic HTML code for your embed and let you custom the most common [url parameters](url-parameters.html).

You can quickly access to the generator from any sheet music hosted on Flat: click on the "Share" button on the top right of the editor, then click on "Embed". If the score is private, a private sharing link with a `sharingKey` will be generated for the document:

![Get started with our Sheet Music Embed Generator]({{site.baseurl}}/assets/img/share-embed-generator.gif)

You will get a similar code that you can paste to your web page code or blog post code:

```html
<iframe src="https://flat-embed.com/[SCORE_ID]" height="450" width="100%" frameBorder="0" allowfullscreen></iframe>
```

The attribute `allowfullscreen` will allow your visitors to open the score in fullscreen. You can also add extra URL parameters to customize your music score or embed appearance, discover them in [the related documentation](url-parameters.html).
