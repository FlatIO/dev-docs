---
title: Sheet music Embed URL parameters
description: Quickly customize our music notation engraving embed with the different URL parameters available and add your own sheet music viewer on your website.
permalink: embed/url-parameters.html
pid: embed-url
---

When [embedding sheet music](index.html) in your website or blog, you can easily customize and control to appearance, the display and the features available for your visitors and users.

The easiest way is by adding different URL parameters of our iframe, you can find the different options available for you below.

Please note that all the options referenced here are not included in our free embed, some of them may require the usage of an API key or a paying plan (e.g. for custom branding). If you are not using the embed right now or need additional options not listed below, feel free to [contact us](https://flat.io/support), we will work with you to make it works for you!

| Query Parameter | Summary | Values |
|:----------------|:--------|:-------|
| `appId` | Your application identifier (aka API key) | [Get yours](https://flat.io/support) |
| `sharingKey` | The score sharing key when the privacy mode is `privateLink` |  |

## Layout and Music notation Engraving parameters

These URL query strings control the engraving display of your music scores. You can get more details by clicking on the parameter name.

| Query Parameter | Summary | Values |
|:----------------|:--------|:-------|
| [`layout`](#change-the-music-engraving-layout-mode-layout) | Display the score in responsive, page or track mode | `responsive`, `page` or `track` (default = `responsive`) |
| [`zoom`](#change-zoom-scaling-zoom) | Default zoom value | `auto` or `0.1` to `3` (default = `auto`)|

## Loading modules

Our embed product works in modules and doesn't load all the components at once. The main reason is that, for example, not every visitor or user will print the sheet music displayed in the embed. This substantially lightweight the embed size and improve the loading speed. However, you can specify these parameters if you want to preload the components that will be used for sure.

| Query Parameter | Summary | Values | Auto |
|:----------------|:--------|:-------|:----:|
| `jsapi` | Load Embed JavaScript API | `true` or `false` (default = `false`) | No |
| `pdf` | Load PDF Export & Print | `true` or `false` (default = `false`) | Yes |
| `musicxml` | Load MusicXML conversion engine | `true` or `false` (default = `false`) | Yes |

## Controls & Theme customization

If you want to customize the controls, including changing their main colors or hide some of them, you can add the following options in your URL.

The following features require an Embed API Key to be used.

| Query Parameter | Summary | Values |
|:----------------|:--------|:-------|
| [`theme*`](#embed-theme) | Change the embed theme | [Read more](#embed-theme) |
| [`branding`](#remove-flat-branding-branding) | Display or hide Flat logo | `true` or `false` (default = `true`)|
| [`controlsDisplay`](#display-or-hide-the-controls-controlsdisplay) | Display or hide main controls | `true` or `false` (default = `true`)|
| [`controlsFloating`](#change-controls-floating-mode-controlsfloating) | Stack the controls or let them float | `true` or `false` (default = `true`)|
| [`controlsMetronome`](#display-or-hide-metronome-control-controlsmetronome) | Display or hide the metronome | `true` or `false` (default = `true`)|
| [`controlsPlay`](#display-or-hide-playback-control-controlsplay) | Display or hide the play/stop button | `true` or `false` (default = `true`)|
| [`controlsFullscreen`](#display-or-hide-fullscreen-control-controlsfullscreen) | Display or hide the fullscreen button | `true` or `false` (default = `true`)|
| [`controlsPanel`](#display-or-hide-side-panel-control-controlspanel) | Display or hide the side panel button | `true` or `false` (default = `true`)|
| [`controlsVolume`](#display-or-hide-volume-side-panel-controls-controlsvolume) | Display or hide the volume controls | `true` or `false` (default = `true`)|
| [`controlsZoom`](#display-or-hide-zoom-side-panel-controls-controlszoom) | Display or hide the zoom control | `true` or `false` (default = `true`)|
| [`controlsPrint`](#display-or-hide-print-control-controlsprint) | Display or hide the print button | `true` or `false` (default = `true`)|

## Audio & Video sources

On any score on hosted on Flat, you can link one or multiple audio/video sources. These ones can be hosted on YouTube, SoundCloud or Vimeo. You can easily synchronize them using our user interface or [REST API](https://flat.io/developers/api/reference/#operation/addScoreTrack).

| Query Parameter | Summary | Values |
|:----------------|:--------|:-------|
| `audioSource` | Audio source to use when loading the embed | `playback`, `default` (the track marked as default, or playback if none), or the [unique identifier of the track to use](https://flat.io/developers/api/reference/#operation/listScoreTracks) (default value = `playback`) |
| [`videoPosition`](#video-position-videoposition) | Display position of the video in the embed | `top`, `left`, `float`, `hidden` (default = `hidden`) |

## Playback options

The following features require an Embed API Key to be used.

| Query Parameter | Summary | Values |
|:----------------|:--------|:-------|
| `playbackMetronome` | Metronome mode | `count-in`, `inactive`, `active` (default = `inactive`)|
| `playbackVolumeMaster` | Master volume | `0` to `1` (default = `1`)|

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

### Remove Flat branding (`branding`)

To remove the Flat logo from the controls, set the parameter `branding` to `false`.

![No Flat branding]({{site.baseurl}}/assets/img/embed-branding.png)

### Display or hide the controls (`controlsDisplay`)

If you implements your own controls or don't need them, you can disable the ones in the embed by setting the parameter `controlsDisplay` to `false`

![Embed controls]({{site.baseurl}}/assets/img/embed-controls.png)

### Change controls floating mode (`controlsFloating`)

By default the controls float at the bottom of the embed, which is a pretty cool way to have an iframe without a border that is well integrated with the parent page. When the visitor clicks on the fullscreen icon, the controls are stacked at the bottom of the screen. This last version can be used in the non-fullscreen display by setting this parameter to `false`.

![Embed stacked]({{site.baseurl}}/assets/img/embed-stacked.png)

### Display or hide Metronome control (`controlsMetronome`)

This control is displayed by default, you can hide it by settings this parameter to `false`.

![Metronome control]({{site.baseurl}}/assets/img/embed-metronome-ctrl.png)

### Display or hide Playback control (`controlsPlay`)

This control is displayed by default, you can hide it by settings this parameter to `false`.

![Playback control]({{site.baseurl}}/assets/img/embed-play-ctrl.png)

### Display or hide Fullscreen control (`controlsFullscreen`)

This control is displayed by default, you can hide it by settings this parameter to `false`.

![Fullscreen control]({{site.baseurl}}/assets/img/embed-fullscreen-ctrl.png)

### Display or hide Side Panel control (`controlsPanel`)

This control is displayed by default, you can hide it by settings this parameter to `false`.

![Side Panel control]({{site.baseurl}}/assets/img/embed-panel-ctrl.png)

### Display or hide Volume side-panel controls (`controlsVolume`)

This side panel is enabled by default, you can disable it by settings this parameter to `false`.

![Volume control]({{site.baseurl}}/assets/img/embed-volume-ctrl.png)

### Display or hide Zoom side-panel controls (`controlsZoom`)

This side panel is enabled by default, you can disable it by settings this parameter to `false`.

![Zoom control]({{site.baseurl}}/assets/img/embed-zoom-ctrl.png)

### Display or hide Print control (`controlsPrint`)

This control is displayed by default, you can hide it by settings this parameter to `false`.

![Print control]({{site.baseurl}}/assets/img/embed-print-ctrl.png)

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

Please note that these parameters need to be encoded if needed (e.g. `themeControlsBackground=%23B71C1C`).

Demo: Let's say that we want to hide the Flat branding, stack the controls and display them with different reds (controls background and main voice cursor). We can use the following options as query strings:

* [```branding=false```](#remove-flat-branding-branding)
* [```controlsFloating=false```](#change-controls-floating-mode-controlsfloating)
* ```themeControlsBackground=#B71C1C```
* ```themeIconsPrimary=#E53935```
* ```themeCursorV0=#E53935```

![Embed themes demo]({{site.baseurl}}/assets/img/embed-colors.png)

### Video position (`videoPosition`)

When using an [audio or video source](#audio--video-sources), you can customize the position of the player: `top`, `left`, `float`, `hidden`.

### `top`

![Video on the top of the score]({{site.baseurl}}/assets/img/embed-video-top.png)

### `left`

![Video on the left of the score]({{site.baseurl}}/assets/img/embed-video-left.png)

### `float`

![Video floating of the score]({{site.baseurl}}/assets/img/embed-video-float.png)
