# Overview

The PokitDok API allows you to perform X12 transactions, find healthcare providers, and get information on health care 
procedure pricing. The API uses JavaScript Object Notation ([JSON](http://json.org/)) for requests and responses and 
also allows batch processing of [ASC X12](http://x12.org/) 5010 compatible [EDI](http://www.x12.org/about/faqs.cfm#a1) 
files. All API traffic is encrypted over HTTPS and authentication is handled with OAuth2.

The API is designed according to REST (Representational State Transfer) principles. The available API calls are 
organized into Resources. These resources are represented by endpoints that clients can invoke to describe and modify 
their state. All resources have the same available top level parameters available for finer grained access.

```shell
#Here's an example of accessing a resource directly, using the "cURL" utility.
curl -i https://platform.pokitdok.com/api/v4/providers/?limit=20
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
{
    "meta": {
        "activity_id": "53d94ff156c02c67a0070096",
        "application_mode": "production",
        "rate_limit_cap": 1000,
        "rate_limit_reset": 1372700873,
        "rate_limit_amount": 122,
        "credits_billed": 1,
        "credits_remaining": 10000,
        "processing_time": 80,
        "next": "https://platform.pokitdok.com/api/v4/providers/?offset=20",
        "previous": null
    },
    "data": [{
        ...
    }]
}
```

The above is a truncated example that gets a list of providers from the Providers resource, and uses some common keyword 
arguments in the process.
