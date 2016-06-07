## Files
> Example sending a batch file of eligibility requests to the MOCKPAYER trading partner

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" -XPOST -F file=@eligibility_requests.270 -F trading_partner_id=MOCKPAYER  https://platform.pokitdok.com/api/v4/files/
```

```python
pd.files('MOCKPAYER', 'eligibility_requests.270')
```

```csharp
client.files(
			"MOCKPAYER",
			"../../tests/files/general-physician-office-visit.270"
		);
```

```ruby
pd.files('MOCKPAYER', 'eligibility_requests.270')
```

```java
pd.files("MOCKPAYER", "eligibility_requests.270");
```

> Example response:

```json
{
  "units_of_work": 1,
  "_type": "PlatformActivityModel",
  "name": "batch file",
  "remaining_transitions": [
    "process",
    "complete"
  ],
  "_uuid": "7c3effe8-a370-481c-bd2e-2ef280acd5ed",
  "state": {
    "name": "queued",
    "title": "In queue waiting to start"
  },
  "trading_partner_id": "MOCKPAYER",
  "id": "57572ba50640fd4672d85a96",
  "transition_path": [
    "store",
    "queue",
    "process",
    "complete"
  ],
  "history": [
    {
      "record_dt": "2016-06-07T20:16:37.242258",
      "name": "init",
      "title": "Initializing"
    },
    {
      "record_dt": "2016-06-07T20:16:37.245216",
      "name": "stored",
      "title": "Batch transactions stored for later processing"
    }
  ]
}
```

*Available modes of operation: batch/async*

All endpoints that result in the transmission of X12 transaction sets to our trading partners accept parameters via a JSON representation. This keeps applications developers from having to interact directly with raw X12 files.  The Files endpoint, however, accepts raw ASC X12 EDI files for transmission to our trading partners.

The content-type header of a POST request informs the endpoint what is being sent.  Normal, JSON API requests use a content type of "application/edi-x12", "text/plain", or "application/octet-stream" to indicate that a file is being sent.

The Files endpoint is included for legacy purposes, and it is highly recommended to consider
using one of the other endpoints that accepts JSON request payloads.

| Endpoint | HTTP Method | Description                                                         |
|:---------|:------------|:--------------------------------------------------------------------|
| /files/  | POST        | Submit an X12 file to the specified trading partner for processing. |
