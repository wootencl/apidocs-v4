## Activities
> Example fetching activities for the current application:

```shell
#retrieve an index of activities
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" https://platform.pokitdok.com/api/v4/activities/
```

```python
#retrieve an index of activities
client.activities()
```

```ruby
#retrieve an index of activities
client.activities
```

```csharp
//retrieve an index of activities
client.activities();
```

```java
//retrieve an index of activities
client.activities();
```

> Example response:

```json
[
  {
    "units_of_work": 1,
    "_type": "PlatformActivityModel",
    "name": "activities",
    "remaining_transitions": [
      "process",
      "complete"
    ],
    "_uuid": "c0aadbbc-c51f-472f-9bfe-4dc2789c2d70",
    "state": {
      "name": "init",
      "title": "Initializing"
    },
    "trading_partner_id": "PokitDok",
    "id": "5745bbdd0640fd3a8186d5d6",
    "transition_path": [
      "process",
      "complete"
    ]
  }
]
```

> Example fetching information for a specific activity:

```shell
#check on a specific activity
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" https://platform.pokitdok.com/api/v4/activities/5317f51527a27620f2ec7533
```

```python
#check on a specific activity
client.activities(activity_id='5362b5a064da150ef6f2526c')
```

```ruby
#check on a specific activity
client.activities({activity_id: '5362b5a064da150ef6f2526c'})
```

```csharp
//check on a specific activity
client.activities("5362b5a064da150ef6f2526c");
```

```java
//check on a specific activity
HashMap<String, String> params = new HashMap<String, String>();
params.add("activity_id", "5362b5a064da150ef6f2526c");
client.activities(params);

```

> Example response:

```json
{
  "units_of_work": 1,
  "_type": "PlatformActivityModel",
  "name": "activities",
  "_uuid": "4c309a6b-1330-40d7-850b-19246a753162",
  "state": {
    "name": "completed",
    "title": "Completed"
  },
  "trading_partner_id": "PokitDok",
  "id": "5745e9920640fd7aa95935f5",
  "transition_path": [
    "process",
    "complete"
  ],
  "history": [
    {
      "record_dt": "2016-05-25T18:06:11.239000",
      "name": "init",
      "title": "Initializing"
    },
    {
      "record_dt": "2016-05-25T18:06:11.239000",
      "name": "processing",
      "title": "Processing transactions"
    }
  ]
}
```

> Example to cancel an existing activity:

```shell
#cancel an existing activity
curl -XPUT -i -H "Content-Type: application/json"
-H "Authorization: Bearer $ACCESS_TOKEN"
-d '{"transition": "cancel"}' https://platform.pokitdok.com/api/v4/activities/5317f51527a27620f2ec7533
```

```python
#cancel an existing activity
url = '/activities/574749250640fd22d719e13f'
client.put(url, data={'transition': 'cancel'})
```

```ruby
# Currently not supported in this language.
```

```csharp
//cancel an existing activity
string endpoint = "/activities/574da3720640fd092ca61b24";
string method = "PUT";
Dictionary<string, object> data = new Dictionary<string, object> { 
  { "transition", "cancel" }
};
client.request(endpoint, method, data);
```

```java
// Currently not supported in this language.
```

> Example response: 

```json
{
  "_type": "PlatformActivityModel",
  "_uuid": "bca3cca7-ad83-43a0-8ca6-adcb1222487a",
  "history": [
    {
      "name": "init",
      "record_dt": "2016-05-26T19:06:13.798000",
      "title": "Initializing"
    },
    {
      "name": "scheduled",
      "record_dt": "2016-05-26T19:07:07.693892",
      "title": "Scheduled for next available transmission to Trading Partner"
    },
    {
      "name": "canceled",
      "record_dt": "2016-05-26T19:07:07.695615",
      "title": "Canceled"
    }
  ],
  "id": "574749250640fd22d719e13f",
  "name": "claims",
  "parameters": {
    "async": true,
    "billing_provider": {
      "address": {
        "address_lines": [
          "8311 WARREN H ABERNATHY HWY"
        ],
        "city": "SPARTANBURG",
        "state": "SC",
        "zipcode": "29301"
      },
      "first_name": "Jerome",
      "last_name": "Aya-Ay",
      "npi": "1467560003",
      "tax_id": "123456789",
      "taxonomy_code": "207Q00000X"
    },
    "claim": {
      "claim_frequency": "original",
      "direct_payment": "y",
      "information_release": "informed_consent",
      "place_of_service": "office",
      "plan_participation": "assigned",
      "provider_signature": true,
      "service_lines": [
        {
          "charge_amount": "60.0",
          "diagnosis_codes": [
            "487.1"
          ],
          "procedure_code": "99213",
          "service_date": "2014-06-01",
          "unit_count": "1.0",
          "unit_type": "units"
        }
      ],
      "total_charge_amount": "60.0",
      "value_information": [
        {
          "value": "99999999999999999",
          "value_type": "service_furnished_location_number"
        }
      ]
    },
    "client_id": "9P10N4H2F7ZbaAU6RYct",
    "correlation_id": "6bdf5dc0-6840-4466-a802-18056fe41aee",
    "generate_pdf": false,
    "payer": {
      "id": "MOCKPAYER",
      "organization_name": "MOCKPAYER"
    },
    "receiver": {
      "id": "MOCKRECEIVER",
      "organization_name": "MOCKRECEIVER"
    },
    "submitter": {
      "email": "support@pokitdok.com",
      "id": "POKITDOKTEST",
      "organization_name": "POKITDOK TESTING"
    },
    "subscriber": {
      "address": {
        "address_lines": [
          "123 N MAIN ST"
        ],
        "city": "SPARTANBURG",
        "state": "SC",
        "zipcode": "29301"
      },
      "birth_date": "1977-01-01",
      "first_name": "John",
      "gender": "male",
      "last_name": "Doe",
      "member_id": "W000000001",
      "payer_responsibility": "primary"
    },
    "trading_partner_id": "MOCKPAYER",
    "transaction_code": "chargeable"
  },
  "state": {
    "name": "canceled",
    "title": "Canceled"
  },
  "trading_partner_id": "MOCKPAYER",
  "transition_path": [
    "schedule",
    "generate",
    "store",
    "transmit",
    "wait",
    "receive",
    "process",
    "complete"
  ],
  "units_of_work": 1
}
```

*Available modes of operation: real-time*

The Activities endpoint is used to track the life cycle of a transaction.  Results returned will follow the states through which an Activity flows in the PokitDok platform. Long-running operations are performed asynchronously. Upon initiating those operations via an API endpoint, activity tracking information is returned to the caller, which can be used to query the status of the activity later on.
Throughout processing, activities may transition through the following states:

State             | Description
------------------|--------------------------------------------------------------------------------------
init              | The activity is initializing.
queued            | The activity is in queue waiting to start/resume.
scheduled         | The activity is scheduled for the next available transmission to the trading partner.
generating        | The activity is generating X12 transactions.
processing        | The activity is processing X12 transactions that have been received.
fallback          | The activity is enacting fallback action.
transmitting      | The activity is transmitting X12 transactions to the trading partner.
waiting           | The activity is waiting on a trading partner response.
receiving         | The activity is receiving X12 transactions from a trading partner.
paused            | The activity is paused.
notifying         | The activity is notifying the client application about activity results if a callback url was defined in the request.
stored            | The activity has stored uploaded batch transactions for later processing.
completed         | The activity has received acknowledgement by the trading partner. Completed activities may receive additional         responses.
canceled          | The activity was canceled by the client application.
failed            | The activity was unable to process successfully.
rejected          | The activity has been rejected by the trading partner for reasons outlined in the response.
rejected_reviewed | The activity has been rejected by the trading partner and reviewed for errors by the PokitDok team.


Information concerning the activity’s progression through the system is available via the API Dashboard, as well as the endpoints listed below.

Available Activity Endpoints:


Endpoint | HTTP Method | Description
-------- | ----------- | -----------
/activities/ | GET | List current activities. A query string parameter ‘parent_id’ may also be used with this API to get information about sub-activities that were initiated from a batch file upload.
/activities/{id} | GET | Return detailed information about the specified activity. API applications will receive an activity ID in the API response for all operations that are asynchronous.
/activities/{id} | PUT | Used for canceling pending activities that a client application no longer wishes to execute.


The /activities/ response includes the following fields:

<a name="activities_response"></a>

Field | Type | Description
----- | ---- | -----------
callback_url | {string} | The URL that will be invoked to notify the client application that this Activity has completed. You must use https for callback URLs used by your application. For added security, a callback URL can be defined in the application.
history | {array} | Historical status of the progress of this Activity.
id | {string} | ID of this Activity.
name | {string} | Activity name.
trading_partner_id | {string} | Unique id for the intended trading partner, as specified by the [Trading Partners](#trading-partners) endpoint. 
parent_id | {string} | Id only present on sub-activities that were initiated via a batch file upload of activities.
parameters | {dict} | The parameters that were originally supplied to the activity.
remaining_transitions | {array} | The list of remaining state transitions that the activity has yet to go through.
result | {dict} | The result of the activity processing.  This will be populated with the latest response from a trading partner.
result_history | {array} | A list of result values that have been received from a trading partner.  This list will be present when a request results in more than one response from a trading partner.  The most recent response will always be available in the result field for convenience.
state | {dict} | Current state of this Activity.
transition_path | {array} | The list of state transitions that will be used for this Activity.
units_of_work | {int} | The number of 'units of work' that the activity is operating on. This will typically be 1 for real-time requests like /eligibility/. When uploading batch X12 files via the /files/ endpoint, this will be the number of ‘transactions’ within that file. For example, if a client application POSTs a file of 20 eligibility requests to the /files/ API, the units_of_work value for that activity will be 20 after the X12 file has been analyzed. If an activity does show a value greater than 1 for units_of_work, the client application can fetch detailed information about each one of the activities processing those units of work by using the /activities/?parent_id=<activity_id> API.

