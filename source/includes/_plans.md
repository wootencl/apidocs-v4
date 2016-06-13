## Plans
> Example fetching all plan information:

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" https://platform.pokitdok.com/api/v4/plans/
```

```python
client.plans()
```

```csharp
client.plans();
```

```ruby
client.plans
```

```java
client.plans();
```

> example fetching information for plans in Texas:

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" https://platform.pokitdok.com/api/v4/plans/?state=TX
```

```python
client.plans(state='TX')
```

```csharp
client.plans(
	new Dictionary<string, string> {
		{ "state", "TX" }
	}
);
```

```ruby
client.plans({state: 'TX'})
```

```java
HashMap<String, String> query = new HashMap<String, String>();
query.put("state", "TX");

client.plans(query);
```

> example fetching information for PPO plans in South Carolina:

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" https://platform.pokitdok.com/api/v4/plans/?state=SC&plan_type=PPO
```

```python
client.plans(state='SC', plan_type='PPO')
```

```csharp
client.plans(
			new Dictionary<string, string> {
				{ "state", "TX" },
				{ "plan_type", "PPO" }
			}
		);
```

```ruby
client.plans({state: 'SC', plan_type: 'PPO'})
```

```java
HashMap<String, String> query = new HashMap<String, String>();
query.put("state", "TX");
query.put("plan_type", "PPO");

client.plans(query);
```

> The plans endpoint will return an array of plan objects dependent on your query. The following is an incomplete example of response json for one plan object. If you would like a more complete example of the plans endpoint entire response json it is recommended you use the test application.

```json
{
  "benefits_summary_url": "http://www.bcbstx.com/coverage/individual/on-exchange/",
  "county": "Anderson",
  "customer_service_phone": "1-888-697-0683",
  "deductible": {
    "family": 9750.0,
    "individual": 3250.0
  },
  "max_out_of_pocket": {
    "family": 9750.0,
    "individual": 3250.0
  },
  "metallic_level": "gold",
  "plan_id": "33602TX0420001",
  "plan_name": "Blue Choice Gold PPO? 001",
  "plan_type": "PPO",
  "premiums": [
    {
      "adults": 1,
      "age": 21,
      "children": 0,
      "cost": 307.03
    }
  ],
  "public_exchange": true,
  "state": "TX",
  "trading_partner_id": "blue_cross_and_blue_shield_texas"
}
``` 

*Available modes of operation: real-time*

The Plans endpoint provides access to information about insurance plans.
The plans returned are those currently available through the federal exchange.
Additional plans may be added later.

| Endpoint | HTTP Method | Description                       |
|:---------|:------------|:----------------------------------|
| /plans/  | GET         | Search insurance plan information |

The /plans/ endpoint accepts the following parameters:

| Parameter          | Description                                           |
|:-------------------|:------------------------------------------------------|
| trading_partner_id | The trading partner id of the payer offering the plan |
| county             | The county in which the plan is available             |
| state              | The state in which the plan is available              |
| plan_id            | The identifier for the plan                           |
| plan_type          | The type of plan (e.g. EPO, PPO, HMO, POS)            |
| plan_name          | The name of the plan                                  |
| metallic_level     | The metal level of the plan                           |

The /plans/ response contains the following fields:

| Field                        | Type     | Description                                                                           |
|:-----------------------------|:---------|:--------------------------------------------------------------------------------------|
| benefits_summary_url         | {string} | URL to benefit summary information for the plan                                       |
| customer_service_phone       | {string} | The customer service phone number for the plan                                        |
| deductible                   | {object} | The deductible amounts for individual and family coverage (when available)            |
| deductible.individual        | {float}  | The deductible amount for individual coverage (when available)                        |
| deductible.family            | {float}  | The deductible amount for family coverage (when available)                            |
| max_out_of_pocket            | {object} | The maximum out of pocket amounts for individual and family coverage (when available) |
| max_out_of_pocket.individual | {float}  | The maximum out of pocket amount for individual coverage (when available)             |
| max_out_of_pocket.family     | {float}  | The maximum out of pocket amount for family coverage (when available)                 |
| metallic_level               | {string} | The metal level for marketplace plans (e.g.: bronze, silver, gold, and platinum)      |
| plan_id                      | {string} | The ID assigned to the plan by the issuer                                             |
| plan_name                    | {string} | Full name of the insurance plan                                                       |
| plan_type                    | {string} | The type of the plan (e.g.: PPO, HMO, EPO, etc.)                                      |
| premiums                     | {array}  | A list of monthly premium information for the plan (when available)                   |
| premiums.age                 | {int}    | The age of the insurance subscriber                                                   |
| premiums.adults              | {int}    | Number of adults covered on the plan                                                  |
| premiums.children            | {int}    | Number of children covered on the plan                                                |
| premiums.cost                | {float}  | The monthly premium cost for the plan                                                 |
| state                        | {string} | The state where the plan is offered (e.g.: CA, SC, etc.)                              |
| trading_partner_id           | {string} | The trading partner id for the issuer of the plan                                     |
