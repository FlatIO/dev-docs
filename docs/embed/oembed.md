---
title: Sheet music oEmbed
description: Simply use our music notation engraving interactive embed in your web pages with the oEmbed standard.
permalink: embed/oembed.html
nav: embed
pid: embed-oembed
---

[oEmbed](http://oembed.com/) is an open standard to easily embed content from oEmbed providers into your site. The Flat oEmbed endpoint serves our embed code for any Flat Score URL:

* ```https://flat.io/score/*```
* ```https://*.flat.io/score/*```

This oEmbed endpoint work with any score shared as **Public** or **Private with sharing link** (scores with the privacy `public` or `privateLink` in our REST API).

## Endpoint

Flat's oEmbed is available at the following URL:

```
https://flat.io/services/oembed
```

JSON Example:

```bash
$ curl "https://flat.io/services/oembed?format=json&url=https%3A%2F%2Fflat.io%2Fscore%2F56ae21579a127715a02901a6"
{
    "version": "1.0",
    "type": "rich",
    "provider_name": "Flat",
    "provider_url": "https://flat.io",
    "author_url": "https://flat.io/flat",
    "author_name": "Flat Team",
    "width": 800,
    "height": 400,
    "title": "House of the Rising Sun",
    "html": "<iframe src=\"https://flat.io/embed/56ae21579a127715a02901a6?\" allowfullscreen height=\"400\" width=\"800\" frameBorder=\"0\"></iframe>",
    "thumbnail_url": "https://flat.io/api/v2/scores/56ae21579a127715a02901a6/revisions/last/thumbnail.png"
}
```

XML Example:

```bash
$ curl "https://flat.io/services/oembed?format=xml&url=https%3A%2F%2Fflat.io%2Fscore%2F56ae21579a127715a02901a6"
<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<oembed>
  <version>1.0</version>
  <title>House of the Rising Sun</title>
  <type>rich</type>
  <width>800</width>
  <height>400</height>
  <html>&lt;iframe src=&#34;https://flat.io/embed/56ae21579a127715a02901a6?&#34; allowfullscreen height=&#34;400&#34; width=&#34;800&#34; frameBorder=&#34;0&#34;&gt;&lt;/iframe&gt;</html>
  <author_name>Flat Team</author_name>
  <author_url>https://flat.io/flat</author_url>
  <provider_name>Flat</provider_name>
  <provider_url>https://flat.io</provider_url>
  <thumbnail_url>https://flat.io/api/v2/scores/56ae21579a127715a02901a6/revisions/last/thumbnail.png</thumbnail_url>
</oembed>
```

## oEmbed Parameters

We support all the following standard parameters:

| Parameters | Required | Description | Default value |
|:-----------|:---------|-------------|---------------|
| `url` | required | The URL of the sheet music to be embedded ||
| `format` | optional | The returned format (`json` and `xml` are supported) | `json` |
| `maxwidth` | optional | The maximum width of a rendered score in whole pixels. This value must be at least `100`, otherwise the width will be 100px. | `800` |
| `maxheight` | optional | The maximum height of a rendered score in whole pixels. This value must be at least `100`, otherwise the width will be 100px. | `400`

## Custom [Embed URL Parameters](url-parameters.html)

If extra query parameters are specified in the oEmbed request or in the URL you are retrieving embedding information from, they will be passed to the final embed URL. This allows you to easily use all of your [Embed URL Parameters](url-parameters.html).

```
https://flat.io/services/oembed?format=json&url=https%3A%2F%2Fflat.io%2Fscore%2F56ae21579a127715a02901a6&layout=track
https://flat.io/services/oembed?format=json&url=https%3A%2F%2Fflat.io%2Fscore%2F56ae21579a127715a02901a6%3Flayout%3Dtrack
```
