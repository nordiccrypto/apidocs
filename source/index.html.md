---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - python
  - javascript

toc_footers:
  - <a href='https://app.nordiccrypto.com/login'>Sign Up for a Developer Key</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Nordic Crypto API! You can use our API to access Nordic Crypto API endpoints, which can get information on various signals, crash alerts, and trade recommendation.

We have language bindings in Shell, Python, and JavaScript! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.


# Authentication

> To authorize, use this code:


```python
import kittn

api = kittn.authorize('meowmeowmeow')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
```

> Make sure to replace `meowmeowmeow` with your API key.

Nordic Crypto uses API keys to allow access to the API. You can register a new Nordic Crypto API key by logging into our [platform](https://app.nordiccrypto.com/login).

Nordic Crypto expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>

# Signals

## Get Signals

```python
import requests
r = requests.get('https://app.nordiccrypto.com/api/v1.0/buysell', auth=('meowmeowmeow', ''))
print(r.json())

```

```shell
curl "https://app.nordiccrypto.com/api/v1.0/buysell"
  -u meowmeowmeow:
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
```

> The above command returns JSON structured like this:

```json
[
  { 
    "Coin": "ETH_OMG", 
    "pl_entry": 0.01617, 
    "pl_exit": 0.0, 
    "start": "2018-10-27", 
    "end": "2018-10-28"
  }
]
```

This endpoint retrieves all signals from subscribed instruments. 
You can poll this every minute for testing purposes, although this is a daily signal.

### HTTP Request

`GET https://app.nordiccrypto.com/api/v1.0/buysell`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
coin | None | If not set the result will include all coins subscribed. 


<aside class="success">
Set coin=USD_BTC returns the BTC rate in USD.
</aside>

# Trades

## Get a trade recommendation

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve


