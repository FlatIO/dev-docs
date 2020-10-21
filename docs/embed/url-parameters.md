---
title: Sheet music Embed URL parameters
description: Quickly customize our music notation engraving embed with the different URL parameters available and add your own sheet music viewer on your website.
permalink: embed/url-parameters.html
nav: embed
pid: embed-url
---

When [embedding sheet music](index.html) in your website or blog, you can easily customize and control to appearance, the display and the features available for your visitors and users.

The easiest way is by adding different URL parameters of our iframe, you can find the different options available for you below.

Please note that most of the customizations below are ony available in our [Embed Starter and Pro plans](https://flat.io/embed), or may  require the usage of an [API key](https://flat.io/developers/apps). If you need additional options not listed below, feel free to [contact us](mailto:developers@flat.io), we will make sure our embed works for you!

| Query Parameter | Summary | Values |
|:----------------|:--------|:-------|
| `appId` | Your application identifier (aka API key) | [Get yours](https://flat.io/embed) |
| `sharingKey` | The score sharing key when the privacy mode is `privateLink` |  |

## Layout and Music notation Engraving parameters

These URL query strings control the engraving display of your music scores. You can get more details by clicking on the parameter name.

| Query Parameter | Summary | Values |
|:----------------|:--------|:-------|
| [`layout`](#change-the-music-engraving-layout-mode-layout) | Display the score in responsive, page or track mode | `responsive`, `page` or `track` (default = `responsive`) |
| [`zoom`](#change-zoom-scaling-zoom) | Default zoom value | `auto` or `0.1` to `3` (default = `auto`)|
| [`parts`](#specify-the-parts-to-display-parts) | Specify the parts to display | all the parts |
| [`drawOnlyFirstPage`](#only-display-the-first-page-drawonlyfirstpage) | Only display the first `page` | `false` |
| [`hideNonTab`](#only-display-the-tablature-of-the-parts-hidenontab) | Only display the tablatures | `false` |
| [`hideTempo`](#do-not-display-tempo-marks-hidetempo) | Do not display tempo marks | `false` |
| [`displayFirstLinePartsNames`](#hide-part-names-displayfirstlinepartsnames) | Hide part names | `true` |
| [`displayOtherLinesPartsNames`](#Hide-non-first-part-names-displayotherlinespartsnames) | Hide non first line part names | `false` |

## Controls & Theme customization

If you want to customize the controls, including changing their main colors or hide some of them, you can add the following options in your URL.

| Query Parameter | Summary | Values |
|:----------------|:--------|:-------|
| [`theme*`](#embed-theme) | Change the embed theme | [Read more](#embed-theme) |
| [`branding`](#remove-flat-branding-branding) | Display or hide Flat logo | `true` or `false` (default = `true`)|
| [`controlsDisplay`](#display-or-hide-the-controls-controlsdisplay) | Display or hide main controls | `true` or `false` (default = `true`)|
| [`controlsPosition`](#change-controls-position-controlsposition) | Controls position | `bottom` or `top` (default = `bottom`)|
| [`controlsPlay`](#display-or-hide-playback-control-controlsplay) | Display or hide the playback controls | `true` or `false` (default = `true`)|
| [`hideFlatPlayback`](#hide-flat-playback-hideflatplayback) | Hide Flat playback | `true` or `false` (default = `false`)|
| [`controlsFullscreen`](#display-or-hide-fullscreen-control-controlsfullscreen) | Display or hide the fullscreen button | `true` or `false` (default = `true`)|
| [`controlsPanel`](#display-or-hide-the-extra-controls-button-controlspanel) | Display or hide the extra controls button | `true` or `false` (default = `true`)|
| [`controlsZoom`](#display-or-hide-zoom--controls-controlszoom) | Display or hide the zoom control | `true` or `false` (default = `true`)|
| [`controlsPrint`](#display-or-hide-print-control-controlsprint) | Display or hide the print button | `true` or `false` (default = `true`)|
| [`controlsParts`](#display-or-hide-the-parts-list-controlsparts) | Display or hide the parts list | `true` or `false` (default = `false`)|
| [`toolsetId`](#editor-toolset) | Editor Toolset | [The toolset id to use (see below)](#editor-toolset) |

## Audio & Video sources

On any score on hosted on Flat, you can link one or multiple audio/video sources. These ones can be hosted on YouTube, SoundCloud or Vimeo. You can easily synchronize them using our user interface or [REST API](https://flat.io/developers/api/reference/#operation/addScoreTrack).

| Query Parameter | Summary | Values |
|:----------------|:--------|:-------|
| `audioSource` | Audio source to use when loading the embed | `playback`, `default` (the track marked as default, or playback if none), or the [unique identifier of the track to use](https://flat.io/developers/api/reference/#operation/listScoreTracks) (default value = `playback`) |
| [`videoPosition`](#video-position-videoposition) | Display position of the video in the embed | `top`, `bottom`, `left`, `float`, `hidden` (default = `hidden`) |
| `playbackMetronome` | Metronome mode | `count-in`, `inactive`, `active` (default = `inactive`) |

## Playback & MIDI options

| Query Parameter | Summary | Values |
|:----------------|:--------|:-------|
| `playbackMetronome` | Metronome mode | `count-in`, `inactive`, `active` (default = `inactive`)|
| `playbackVolumeMaster` | Master volume | `0` to `1` (default = `1`)|
| `MIDI` | Enable MIDI Output Controls | `true` or `false` (default = `false`)|

## Parameters details and demos

### Change the music engraving layout mode (`layout`)

We support three different engraving modes:

* `responsive`

![Layout Responsive mode]({{site.baseurl}}/assets/img/embed-layout-responsive.png)

* `page`

![Layout Page mode]({{site.baseurl}}/assets/img/embed-layout-page.png)

* `track` (default)

![Layout page mode]({{site.baseurl}}/assets/img/embed-layout-track.png)

### Change zoom scaling (`zoom`)

You can use different zoom values:

* `auto` (default): If you use a [`page` layout mode](#change-the-music-engraving-layout-mode-layout), the page will always fit the width of the embed, and be resize if you resize the embed. In [`track` layout mode](#change-the-music-engraving-layout-mode-layout), this is equivalent to `1`.
* `0.1` to `3`: A scaling value, where `1` is the regular size and `3` multiples the size by 3.

Example with `zoom=3` (i.e. Zoom x3):

![Embed zoom]({{site.baseurl}}/assets/img/embed-zoom.png)

### Specify the parts to display (`parts`)

By default, the embed will display all the parts of your embedded documents. You can choose the parts to display by default, by providing the list of the parts with a `parts` parameter.

This parameter supports multiple formats for the parts references, which must be separated by a comma:

* Parts UUIDs,
* Part indexes (idx), starting at `0` for the first part,
* Part names (e.g. `Piano`),
* Part Abbreviation (e.g. `Pno.`)

Examples of valid inputs:

* `parts=0,3,4`
* `parts=Violin,Viola`

You can also use the [`controlsParts` option](#display-or-hide-the-parts-list-controlsparts) to display a component that will allow your users to choose the part(s) to display.

### Only display the first `page` (`drawOnlyFirstPage`)

If you want to only draw the first page of the score, for example, to create a preview of a score. Please note that the complete file will still be completely loaded in the embed. To protect it, we advise you to use a dedicated preview file with only 1 page or little more available to display.

Here is a demo with this option and the following parameters:

* ```drawOnlyFirstPage=true```
* ```branding=false```
* ```controlsPosition=top```
* ```controlsPrint=false```

![Only display the first page]({{site.baseurl}}/assets/img/embed-drawOnlyFirstPage.png)

### Only display the tablature of the parts (`hideNonTab`)

If you want to only display the tablatures of the parts, and hide the music notations staves, you can enable the `hideNonTab` option.

![Only TAB]({{site.baseurl}}/assets/img/embed-hideNonTab.png)

### Do not display tempo marks (`hideTempo`)

If you want to hide the tempo marks, you can enable the `hideTempo` option. 

![No tempo marks]({{site.baseurl}}/assets/img/embed-hideTempo.png)

### Hide part names (`displayFirstLinePartsNames`)

If you want to hide the part (instrument) names, you can set the `displayFirstLinePartsNames` option to false.

![Do not display part names]({{site.baseurl}}/assets/img/embed-hideAllPartName.png)

### Hide non first part names (`displayOtherLinesPartsNames`)

If you want to only display part (instrument) names on the first system, you can set the `displayOtherLinesPartsNames` option to false.

![Do not display part names]({{site.baseurl}}/assets/img/embed-hideOtherPartName.png)

### Remove Flat branding (`branding`)

To remove the Flat logo from the controls, set the parameter `branding` to `false`.

![No Flat branding]({{site.baseurl}}/assets/img/embed-branding.png)

### Display or hide the controls (`controlsDisplay`)

If you implements your own controls or don't need them, you can disable the ones in the embed by setting the parameter `controlsDisplay` to `false`.

![Embed controls]({{site.baseurl}}/assets/img/embed-controls.png)

### Change controls position (`controlsPosition`)

By default the controls are displayed at the `bottom` of the embed. You can choose the display them at the top by setting the parameter `controlsPosition` to `top`.

![Embed controls at the top]({{site.baseurl}}/assets/img/embed-ctrl-top.png)

### Display or hide Playback control (`controlsPlay`)

This control is displayed by default, you can hide it by setting this parameter to `false`.

![Playback control]({{site.baseurl}}/assets/img/embed-play-ctrl.png)

### Hide Flat playback (`hideFlatPlayback`)

If you want to display only the alternative audio sources (mp3/video/soundcloud), set this one to true. 

![Hide Flat Playback]({{site.baseurl}}/assets/img/embed-hideFlatPlayback.png)

### Display or hide Fullscreen control (`controlsFullscreen`)

This control is displayed by default, you can hide it by setting this parameter to `false`.

![Fullscreen control]({{site.baseurl}}/assets/img/embed-fullscreen-ctrl.png)

### Display or hide the extra controls button (`controlsPanel`)

This control is displayed by default, you can hide it by setting this parameter to `false`.

![Side Panel control]({{site.baseurl}}/assets/img/embed-panel-ctrl.png)

### Display or hide the Zoom controls (`controlsZoom`)

This side panel is enabled by default, you can disable it by setting this parameter to `false`.

![Zoom control]({{site.baseurl}}/assets/img/embed-fullscreen-ctrl.png)

### Display or hide Print control (`controlsPrint`)

This control is displayed by default, you can hide it by setting this parameter to `false`.

![Print control]({{site.baseurl}}/assets/img/embed-fullscreen-ctrl.png)

### Display or hide the Parts List (`controlsParts`)

This component can be displayed by setting this parameter to `true`, and having a score with at least two parts.

![Print control]({{site.baseurl}}/assets/img/embed-parts-ctrl.png)

### Editor Toolset

When using our embeddable editor, you might want to only make specific tools available to your end-users. Toolsets configurations are linked to your Flat developer account and can be managed in the [Embed Generator page](https://flat.io/developers/embed/generator):

* Select the score to embed (or one of your testing scores if you want to use [`loadMusicXML()` from our SDK](/developers/docs/embed/javascript.html#loadmusicxmlscore-mixed-promisevoid-error))
* Click on "**Editor**" under the "**Embed mode**"
* Under the customizations features, you will be able to select and manage your toolsets:

![Select a toolset]({{site.baseurl}}/assets/img/embed-toolset-input.png)

You can then create and update your own configurations. They will be previewed on the generator page, making it easy to test and experiment our embed with your custom toolsets.

![Select a toolset]({{site.baseurl}}/assets/img/embed-toolset-panel-edit.png)

Once you selected a toolset, its identifier (`toolsetId`) will be displayed in the generated code or iframe URL at the bottom of the page.

**Notes about toolsets**:

  * Using a toolset **will enable or disable the tools across the embed**: toolbars, interfaces on the top of the score, mouse, keyboard shortcuts, and JavaScript API methods.
  * Since the configurations are saved in your developer account, when updating the configuration on the generator page, **the updated configuration will also be applied in your existing embeds where you are using the same `toolsetId`**.

### Embed theme

You can completely change the embed theme by changing the different color options available:

| Parameter | Element | Values |
|-----------|---------|--------|
| `themeIconsPrimary` | Icons primary color (e.g. play button) | [color (hex, rgba() or hsla()](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value) |
| `themeControlsBackground` | Controls bar background | [color (hex, rgba() or hsla()](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value) |
| `themeControlsIcons` | Controls icons color (e.g. metronome) | [color (hex, rgba() or hsla()](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value) |
| `themeSlider` | Playback slider color | [color (hex)](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value) |
| `themeCursorV0` | Cursor 1st Voice color | [color (hex)](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value) |
| `themeCursorV1` | Cursor 2nd Voice color | [color (hex)](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value) |
| `themeSelection` | Selection color | [color (hex)](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value) |
| `themeScoreBackground` | Background of score | `white` or `transparent` |

Please note that these parameters need to be encoded if needed (e.g. `themeControlsBackground=%23B71C1C`).

Demo: Let's say that we want to hide the Flat branding, display the controls different reds (controls background and main voice cursor). We can use the following options as query strings:

* [```branding=false```](#remove-flat-branding-branding)
* ```themeControlsBackground=#B71C1C```
* ```themeIconsPrimary=#E53935```
* ```themeCursorV0=#E53935```

![Embed themes demo]({{site.baseurl}}/assets/img/embed-colors.png)

The `transparent` background option (`themeScoreBackground`) can be used when your page has a light background that is not white and that you are using the [`page` layout mode](#change-the-music-engraving-layout-mode-layout):

![Non-white background]({{site.baseurl}}/assets/img/embed-transparent-background.png)

### Video position (`videoPosition`)

When using an [audio or video source](#audio--video-sources), you can customize the position of the player: `top`, `bottom`, `left`, `float`, `hidden`.

### `top`

![Video on the top of the score]({{site.baseurl}}/assets/img/embed-video-top.png)

### `left`

![Video on the left of the score]({{site.baseurl}}/assets/img/embed-video-left.png)

### `float`

![Video floating of the score]({{site.baseurl}}/assets/img/embed-video-float.png)
