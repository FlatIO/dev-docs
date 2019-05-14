---
title: Flat REST API Errors
permalink: api/errors.html
nav: rest
pid: api-errors
---

In the event of an error, the response will include the relevant HTTP Status Code and a JSON object in the body with information about the error.

| Property | Value |
|:---------|:------|
| `code` | Error code returned by the API (e.g. `CLIENT_ERROR`) |
| `message` | Human readable message which describes the error |
| `id` | An unique identifier (UUID) for the error. This field will be present for internal and backend errors. |

## Detailed reference on errors

You can find more info about the specific errors returned for each endpoint in our [API reference](https://flat.io/developers/api/reference/).

If you're having trouble with API errors, please [contact us for help](mailto:developers@flat.io). In case of a internal or backend error if you have the corresponding error unique `id` corresponding to the error, please send it to us, that can make issue diagnosis and response significantly faster.
