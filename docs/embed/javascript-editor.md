---
title: Embeddable music notation editor
description: Allow your website visitor and users to edit any sheet music
permalink: embed/javascript-editor.html
nav: embed
pid: embed-editor
---

You can use our [JavaScript SDK](javascript-editor.html) to embed our editor anywhere. Load any MusicXML files or scores hosted on Flat, edit them directly on your webpage or app, then export them to MusicXML or MIDI directly in JavaScript. Our editor is included [in all our embed plans](https://flat.io/developers/embed), including our free community plan.

You can also use our [code generator](https://flat.io/developers/embed/generator) to generate the JS initializing our embeddable editor with the customizations options you want.

Here is a simple example using the same score [from our introduction]({{site.baseurl}}/embed/) as an editable template you can export once edited. [The source code of this page and example is available on our GitHub](https://github.com/{{ site.github.repository_nwo }}/blob/master/_includes/embed-editor-sample.html).

{% include embed-editor-sample.html %}

Another good example of application using this SDK with the editor is [our Google Docs add-ons](https://gsuite.google.com/marketplace/app/flat_for_docs/324260072797). They load some MusicXML templates, then export the score to MusicXML and PNG once the creation is done.