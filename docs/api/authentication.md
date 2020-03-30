---
title: Flat API Authentication
permalink: api/authentication.html
nav: rest
pid: api-auth
---

The Flat Platform API uses [OAuth 2.0](https://oauth.net/2/) for authentication and authorization. If you never used OAuth2 before, we advise you to read this [great introduction](https://www.digitalocean.com/community/tutorials/an-introduction-to-oauth-2). Our API supports the **Authorization Code** and **Implicit** grants. To simplify the usage of our API for your own account, you can quickly create access tokens in your Flat account (aka. "Personal Access Tokens").

## How to quickly getting started

1. [Create an app](https://flat.io/developers/apps) for your script or project.
2. **Try the API in 5 minutes** with [a Personal Access Token for your Flat account](#personal-access-tokens).
3. If you plan to make the app available for other people, [request some OAuth2 Credentials to our product team](https://docs.google.com/forms/d/e/1FAIpQLSeW4sZuUrcBXEtbecJ8xlWL9anbFCsrpHBgc6C48DOE4zuElQ/viewform).

## Personal Access Tokens

Personal Access Tokens function like OAuth access tokens for your own account. You can generate them from your account in a few seconds:

1. [Create an app](https://flat.io/developers/apps) for your script or project
2. On the left menu, click on "**Flat API > Personal Tokens**"
3. Choose a name and the authorization scopes for your first token.

That's all, you can directly use our API with this token by setting it in the `Authorization` headers of your requests:

```
Authorization: Bearer my-api-personal-access-token
```

Here is an example with cURL:

```bash
curl -H 'Authorization: Bearer <my_api_personal_access_token>' https://api.flat.io/v2/me
```

## OAuth2

**Do you Need some OAuth2 credentials? Please [contact our product team](https://docs.google.com/forms/d/e/1FAIpQLSeW4sZuUrcBXEtbecJ8xlWL9anbFCsrpHBgc6C48DOE4zuElQ/viewform)**. Here is the main information for our OAuh2 API, you can learn more about the scopes and flows in the paragraphs below.

* Authorization URL: `https://flat.io/auth/oauth`
* Token URL: `https://api.flat.io/oauth/access_token`
* Invalidation URL: `https://api.flat.io/oauth/invalidate_token`
* [List of scopes](#scopes)

## Scopes

You will need to choose and include a list of requested scopes during the OAuth flow. At this time we support the following scopes:

| Scope | Description |
|:------|:------------|
| `account.public_profile` | Users' public profiles |
| `account.education_profile` | For education accounts, users' profiles and organization information. |
| `scores.readonly` | Read-only access to all a user's scores. |
| `scores.social` | Post comments and like scores |
| `scores` | Full, permissive scope to access all of a user's scores. |
| `collections.readonly`| Allow read-only access to a user's collections. |
| `collections.add_scores` | Allow to add scores to a user's collections. |
| `collections` | Full, permissive scope to access all of a user's collections. |
| `edu.classes` | Full, permissive scope to manage the classes. |
| `edu.classes.readonly` | Read-only access to the classes. |
| `edu.assignments` | Read-write access to the assignments and submissions. |
| `edu.assignments.readonly` | Read-only access to the assignments and submissions. |
| `edu.admin` | Full, permissive scope to manage all the admin of an organization. |
| `edu.admin.lti` | Access and manage the LTI Credentials for an organization. |
| `edu.admin.lti.readonly` | Read-only access to the LTI Credentials of an organization. |
| `edu.admin.users` | Access and manage the users and invitations of the organization. |
| `edu.admin.users.readonly` | Read-only access to the users and invitations of the organization. |

## Authorization Page

Both **Authorization Code** and **Implicit** OAuth2 grants start with our authorization page. Our Authorization page (`https://flat.io/auth/oauth`) supports all the standard parameters from the **Authorization Code** grant ([RFC6749/4.1](https://tools.ietf.org/html/rfc6749#section-4.1)) and the **Implicit** grant ([RFC6749/4.2](https://tools.ietf.org/html/rfc6749#section-4.2)).

The first step is to build an authorization link where you can redirect your user. Here is a simple example:

```
https://flat.io/auth/oauth?client_id=<client_id>&response_type=(code|token)&state=<state>&scope=account.public_profile+scores&redirect_uri=<redirect_uri>
```

You can find below the different parameters available, including non-standard and optional parameters. All of them can be passed as query string when redirecting the end-user to the authorization page.

Property name  | Required | Values and Description
---------------|----------|-----------------------
`client_id`    | Required | The client id (aka key) from the couple key/secret provided by Flat
`response_type`| Required | We support `code` (**Authorization Code** grant, [RFC6749/4.1.1](https://tools.ietf.org/html/rfc6749#section-4.1.1)) and `token` (**Implicit**, [RFC6749/4.2.1](https://tools.ietf.org/html/rfc6749#section-4.2.1)). It is strongly advised to use the Authorization Code grant for any server-side usage and the Implicit grant for any client-side (e.g. JavaScript) usage.
`scope`        | Required | You must provide a list of scopes listed above and granted for your app, separated with a space.
`redirect_uri` | Required | Determines where the response is sent. The value of this parameter must exactly match the value specified in your App Credentials settings.
`state`        | Optional | An opaque string that is round-tripped in the protocol; that is to say, it is returned as a URI parameter in the Authorization Code grant, and in the URI #fragment in the Implicit grant.
`access_type`  | Optional (available for the Authorization Code grant) | The acceptable values are `online` and `offline`. When specifying `offline`, the API will return a refresh token during the access token exchange.

When redirecting your users to this authorization page, they will see a page that looks like the one below, where they can grant your app to access and use their account:

![Flat OAuth2 Authorization Page]({{site.baseurl}}/assets/img/api-authz-page.png)

## Authorization Code grant

Here is a typical flow of an **Authorization Code grant**. We advise you to use this grant for using our API in **server-side**.

1. You redirected a visitor/user to our [authorization page](#authorization-page) by specifying `response_type=code`, your `client_id` and a `redirect_uri`.
2. This user granted your app on our authorization Page.
3. Flat redirects your user back to your website at the `redirect_uri` you specified. You will receive a `code` query string with an Authorization Code that you can exchange for an access token. This URL will also include a previous `state` you specified in the authorization page URL. (e.g. `https://my-website.example.com/callback?code=<authz-code>&state=<state>`)
4. To exchange this Authorization Code, use our Token API Endpoint, `https://api.flat.io/oauth/access_token` ([RFC6749/4.1.3](https://tools.ietf.org/html/rfc6749#section-4.1.3)).

Here is an exchange request example (server-side):

```bash
curl -i -X POST -H 'Content-Type: application/x-www-form-urlencoded' \
 -d grant_type=authorization_code \
 -d code=<authz-code> \
 -d client_id=<client_id> \
 -d client_secret=<client_secret> \
 -d redirect_uri=<redirect_uri> \
 https://api.flat.io/oauth/access_token
```

And a response for this request:

```
HTTP/1.1 200 OK
Content-Type: application/json

{
  "type": "access",
  "token_type": "bearer"
  "access_token": "<access-token>",
  "issued_at": 1492542537,
  "expires_in": 86400,
  "app": "<app-id>",
  "appStatus": "trusted",
  "user": "<user-id>",
  "scope": "account.public_profile scores"
}
```

The access token is now ready to use, here is an example with cURL:

```bash
curl -H 'Authorization: Bearer <access-token>' https://api.flat.io/v2/me
```

## Implicit grant

Here is a typical flow of an **Implicit grant**. We advise you to use this grant for using our API in **client-side**. We main difference with the Authorization Code grant is that you don't need to exchange a code, you directly get the access token in the URI Hash.

1. You redirected a visitor/user to our [authorization page](#authorization-page) by specifying `response_type=token`, your `client_id`, and a `redirect_uri`.
2. This user granted your app on our authorization Page.
3. Flat redirects your user back to your website at the `redirect_uri` you specified. You will receive the access token in the URI Hash (see example below).

```
https://my-website.example.com/callback#scope=account.public_profile&expires_in=86400&access_token=<access-token>
```

The access token is now ready to use, here is an example with the JavaScript Fetch API:

```javascript
fetch('https://api.flat.io/v2/me', {
  headers: {
    'Authorization': 'Bearer ' + ACCESS_TOKEN
  }
})
.then(function (response) {
  return response.json();
})
.then(function (me) {
  console.log(me);
});
```

## Tokens revocation

This OAuth2 API supports token revocation ([RFC 7009](http://tools.ietf.org/html/rfc7009)) at the following endpoint: `https://api.flat.io/oauth/invalidate_token`.
