---
title: Import API
description: Easy import any MusicXML or MIDI file available the Internet
permalink: import/
pid: import-usage
---

Use our Import API to quickly allow people to edit and import your web content (MusicXML and MIDI) with Flat. Simply add a link to Flat following to specification below.

Want to do it with a script or server-side, create multiple files, or export files? You can do it with our [REST API](../api/).

## Specification

Endpoint: ```GET https://flat.io/score/import-url```

Parameters:

| Name | Description | Required / Default values |
|:-----|:------------|:--------|
| `url` | The full URL of the **MusicXML** or **MIDI** file to import. The file must be publicly accessible and served with [CORS](#cors) | Required |
| `title` | The title of the file you are importing | Optional, default: `New music score` |
| `app` | If you have an [app id](https://flat.io/developers/apps), you can provide it here. Your App name and logo will be displayed on the landing page. | Optional |

## Example

```html
<a href="https://flat.io/score/import-url?url=https%3A%2F%2Fflat.io%2Fexamples%2Fhello-world.xml&title=Hello%20World">
  <img src="https://flat.io/img/assets/edit-with-flat-white.svg" alt="Edit with Flat">
</a>
````

<a href="https://flat.io/score/import-url?url=https%3A%2F%2Fflat.io%2Fexamples%2Fhello-world.xml&title=Hello%20World">
  <img src="https://flat.io/img/assets/edit-with-flat-white.svg" alt="Edit with Flat" style="border:0">
</a>

You can find more graphic assets on [our assets page](../graphic-assets), feel free to [contact us](mailto:developers@flat.io) if don't find the resources that you need.

## CORS

The file is downloaded by the user's browser, so you will need to add correct [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS) when replying to the request:

```
Access-Control-Allow-Origin: *
```

Or:

```
Access-Control-Allow-Origin: $ORIGIN
```

Where `$ORIGIN` is the `Origin` header of the request, i.e. `flat.io` or `[domain].flat.io` for private websites).
