---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - python
  - javascript

toc_footers:
  - <a href='https://app.nordiccrypto.com/login'>Sign Up for a Developer Key</a>Please select your exchange on Subscriptions on the web app here before using any endpoint.

includes:
  - errors

search: true
---

# Introduction

Welcome to the Nordic Crypto API! You can use our API to access Nordic Crypto API endpoints, which can get information on various signals, crash alerts, and trade recommendation.

We have language bindings in Shell, Python, and JavaScript! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.


# Authentication

> To authorize, use this code when you request an api endpoint:


```python
  import requests
  headers = {"Authorization" : "meowmeowmeow"}
  r = requests.get('https://api_endpoint_here', headers=headers)
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

```javascript
TBD
```

> Make sure to replace `meowmeowmeow` with your API key.

Nordic Crypto uses API keys to allow access to the API. You can register a new Nordic Crypto API key by logging into our [platform](https://app.nordiccrypto.com/login).

Nordic Crypto expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>

# Coins

## Get Coins

```python
import requests
r = requests.get('https://app.nordiccrypto.com/api/v1.0/coins', headers={'Authorization':'meowmeowmeow'})
print(r.json())

```

```shell
curl "https://app.nordiccrypto.com/api/v1.0/coins"
  -H "Authorization: meowmeowmeow"
```

```javascript
TBD
```

> The above command returns JSON structured like this:

```json
[
  {
    "rank": 1, 
    "url_name": "bitcoin", 
    "coin_name": "Bitcoin", 
    "pair": "USD_BTC", 
    "usd_volume": 3445190000.0, 
    "volume": 3445190000.0, 
    "direction": "SHORT", 
    "days_long": 0,
    "days_short" : 18
  }

]
```

This endpoint retrieves all coins supported.

### HTTP Request

`GET https://app.nordiccrypto.com/api/v1.0/coins`

### Query Parameters

Parameter   | Default | Description
----------- | ------- | -----------
market      | USD     | Use BTC to get all BTC_XXX. Supported markets are: BTC, USDT, USD, ETH
pair        | None    | Set pair. E.g. USD_BTC


<aside class="success">
Set pair=USD_BTC returns the BTC rate in USD.
</aside>



# Alpha 1 Signals

## Get Signals

```python
import requests
r = requests.get('https://app.nordiccrypto.com/api/v1.0/alpha1/signals', headers={'Authorization':'meowmeowmeow'})
print(r.json())

```

```shell
curl "https://app.nordiccrypto.com/api/alpha1/v1.0/alpha1/signals"
  -H "Authorization: meowmeowmeow"
```

```javascript
TBD
```

> The above command returns JSON structured like this:

```json
[
  { 
    "pair": "ETH_OMG", 
    "entry": 0.01617, 
    "current_stop_loss" : 0.015,
    "opened": "2018-10-19", 
    "closed": "OPEN", 
    "pnl": 0.012, 
    "signal": "LONG",
    "exchange_name" : "Bitmart",
    "There is a <LONG> signal...."
  },
  { 
    "pair": "ETH_OMG", 
    "entry": 0.01509, 
    "exit": 0.01573, 
    "opened": "2018-08-28", 
    "closed": "2018-09-15", 
    "pnl": 4.24, 
    "signal": "LONG",
    "exchange_name" : "Bitmart"
  }

]
```

This endpoint retrieves all signals from subscribed instruments. 
You can poll this every minute for testing purposes, although this is a daily signal.

### HTTP Request

`GET https://app.nordiccrypto.com/api/alpha1/v1.0/signals`

### Query Parameters

Parameter   | Default | Description
----------- | ------- | -----------
market      | USD     | Options are XXX = ETH, USDT, BTC for XXX_YYY where Y = coin tickers.
ticker      | None    | Specify a coin ticker to get crash alert from. E.g. BTC
start       | datetime| E.g. 2018-10-31
end         | datetime| E.g. 2018-12-24

<aside class="success">
Set pair=BTC_USD returns the BTC rate in USD.
</aside>

# Crash Alert

## Get crash alerts

```python
import requests
r = requests.get('https://app.nordiccrypto.com/api/v1.0/crashalert', headers={'Authorization':'meowmeowmeow'})
print(r.json())
```

```shell
curl "https://app.nordiccrypto.com/api/v1.0/crashalert"
  -H "Authorization: meowmeowmeow"
```

```javascript
TBD
```

> The above command returns JSON structured like this:

```json
{ 
  "coin": "bitcoin", 
  "pair" : "USD_BTC",
  "crash_alert": "2017-09-08", 
  "open": 4605.16, 
  "high": 4661.0, 
  "low": 4075.18, 
  "close": 4228.75, 
  "volume": 2700890000, 
  "market_cap": 76220200000
}

```

This endpoint retrieves all crash alerts on coins subscribed.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET https://app.nordiccrypto.com/api/v1.0/crashalert<ID>`

### URL Parameters

Parameter   | Default | Description
----------- | ------- | -----------
market      | USD     | Options are XXX = ETH, USDT, BTC for XXX_YYY where Y = coin tickers.
ticker      | None    | Specify a coin ticker to get crash alert from. E.g. BTC
start       | datetime| E.g. 2018-10-31
end         | datetime| E.g. 2018-12-24




# Alpha 3 Trades

## Get a trade recommendation. 

```python
import requests

r = requests.get('https://app.nordiccrypto.com/api/v1.0/alpha3/get_trades', headers={'Authorization':'meowmeowmeow'})
print(r.json())
```

```shell
curl "https://app.nordiccrypto.com/api/alpha3/v1.0/get_trades"
  -H "Authorization: meowmeowmeow"
```

```javascript
TBD
```

> The above command returns JSON structured like this:

```json
[
  {
    "coin_name": "Ethereum",
    "ticker": "ETH",
    "market": "USD",
    "entry_date": "2018-11-01 23:00:00",
    "entry": 198.07,
    "target": 198.997,
    "stop": 197.28
  }
]
```

This endpoint retrieves all trade recommendations currently open.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET https://app.nordiccrypto.com/api/v1.0/alpha3/get_trades`

### URL Parameters

Parameter   | Default | Description
----------- | ------- | -----------
market      | USD     | Options are XXX = ETH, USDT, BTC for XXX_YYY where Y = coin tickers.
ticker      | None    | Specify a coin ticker to get crash alert from. E.g. BTC
start       | datetime| E.g. 2018-10-31
end         | datetime| E.g. 2018-12-24


## Get a pair stats 

```python
import requests

r = requests.get('https://app.nordiccrypto.com/api/v1.0/alpha3/get_stats', headers={'Authorization':'meowmeowmeow'})
print(r.json())
```

```shell
curl "https://app.nordiccrypto.com/api/v1.0/alpha3/get_stats"
  -H "Authorization: meowmeowmeow"
```

```javascript
TBD
```

> The above command returns JSON structured like this:

```json
[
  {
    "Signal": "LONG",
    "ticker": "BTC",
    "market": "USD",
    "pnl": 1.524,
    "avg_loss": -0.0169,
    "avg_win": 0.0217,
    "max_dd": 0.0,
    "winner_ratio": 0.6,
    "risk2reward": 1.28,
    "total_trades": 243
  }
]

```

This endpoint retrieves stats from the alpha3 backtest.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET https://app.nordiccrypto.com/api/v1.0/alpha3/get_stats`

### URL Parameters

Parameter   | Default | Description
----------- | ------- | -----------
market      | USD     | Options are XXX = ETH, USDT, BTC for XXX_YYY where Y = coin tickers.
ticker      | None    | Specify a coin ticker to get crash alert from. E.g. BTC
start       | datetime| E.g. 2018-10-31
end         | datetime| E.g. 2018-12-24


