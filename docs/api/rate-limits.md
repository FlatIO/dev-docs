---
title: API Rate Limits
description: Discover how the Rate Limits of the Flat Platform's API.
permalink: api/rate-limits.html
nav: rest
pid: api-rate-limits
---

The [Flat's REST API](index.html) includes a rate-limiting system that allows us to protect our quality of service. You can contact us if you need [extra quota](mailto:developers@flat.io).

For authenticated requests, you can make up to 5,000 requests per hour.
For unauthenticated requests, the rate limit allows you to make up to 500 requests per hour. Unauthenticated requests are associated with your IP address, and not the user or app making requests.
To protect our quality of service, additional rate limits may apply to some API calls or actions.

You can check the returned HTTP headers of any API request to see your current rate limit status:

```bash
curl -i https://api.flat.io/v2/me
HTTP/1.1 200 OK
Date: Sat, 25 Mar 2017 17:06:20 GMT
X-RateLimit-Limit: 5000
X-RateLimit-Remaining: 4999
X-RateLimit-Reset: 1490465178
```

The headers tell you everything you need to know about your current rate limit status:

Header name | Description
------------|------------
`X-RateLimit-Limit` | The maximum number of requests that the consumer is permitted to make per hour.
`X-RateLimit-Remaining` | The number of requests remaining in the current rate limit window. This value can be negative if you try to go over the allowed quota.
`X-RateLimit-Reset` | The time at which the current rate limit window resets in [UTC epoch seconds](http://en.wikipedia.org/wiki/Unix_time).

If you need the time in a different format, any modern programming language can get the job done. For example, if you open up the console on your web browser, you can easily get the reset time as a JavaScript Date object.

```javascript
new Date(1490465178 * 1000).toString()
'Sat Mar 25 2017 19:06:18 GMT+0100 (CET)'
```

Once you go over the rate limit you will receive an error response:

```bash
curl -i https://api.flat.io/v2/me
HTTP/1.1 403 Forbidden
X-RateLimit-Limit: 5000
X-RateLimit-Remaining: 0
X-RateLimit-Reset: 1490465829

{
  "message": "API rate limit exceeded for xx.xxx.xxx.xx",
  "code": "API_RATE_LIMIT_EXCEEDED"
}
```
