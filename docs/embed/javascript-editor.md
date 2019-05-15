---
title: Embeddable music notation editor
description: Allow your website visitor and users to edit any sheet music
permalink: embed/javascript-editor.html
nav: embed
pid: embed-editor
---

You can use our [JavaScript SDK](javascript-editor.html) to embed our editor anywhere. Load any MusicXML files or scores hosted on Flat, edit them directly on your webpage or app, then export them to MusicXML or MIDI directly in JavaScript. Our editor is included [in all our embed plans](https://flat.io/embed), including our free community plan.

You can also use our [code generator](https://flat.io/developers/embed/generator) to generate the JavaScript initializing our embeddable editor with the customizations options you want.

Here is a simple example using the same score [from our introduction]({{site.baseurl}}/embed/) as an editable template you can export once edited.

{% include embed-editor-sample.html %}

Here is how the example is done. [You can view and edit this complete example on Code Sandbox](https://codesandbox.io/s/github/FlatIO/embed-demo-editor-simple).

```html
<div id="embed-container"></div>
<button id="export-xml">Export to MusicXML</button>

<script src="https://prod.flat-cdn.com/embed-js/v1.1.0/embed.min.js"></script>
<script>
  var container = document.getElementById('embed-container');
  var embed = new Flat.Embed(container, {
    // The score hosted on Flat we use here as template.
    // You can also use `embed.loadMusicXML(file)` to load your files on the fly
    score: '56ae21579a127715a02901a6',
    embedParams: {
      mode: 'edit',
      appId: '59e7684b476cba39490801c2',
      // Simple customizations
      branding: false,
      controlsPosition: 'top',
    }
  });

  // Export the file when we click on the button
  document.getElementById('export-xml').addEventListener('click', function () {
    embed.getMusicXML({ compressed: true }).then(function (buffer) {
     // Exported MusicXML file in `buffer`
    });
  });
</script>
```

## Real-life example

Another good example of application using this SDK with the editor is [our Google Docs add-ons](https://gsuite.google.com/marketplace/app/flat_for_docs/324260072797). They load some MusicXML templates, then export the score to MusicXML and PNG once the creation is done.