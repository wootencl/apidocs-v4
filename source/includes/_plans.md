## Plans
> Example fetching all plan information:

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" https://platform.pokitdok.com/api/v4/plans/
```

```python
pd.plans()
```

```csharp
client.plans();
```

```ruby
pd.plans
```

```java
pd.plans();
```

> example fetching information for plans in Texas:

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" https://platform.pokitdok.com/api/v4/plans/?state=TX
```

```python
pd.plans(state='TX')
```

```csharp
client.plans(
	new Dictionary<string, string> {
		{ "state", "TX" }
	}
);
```

```ruby
pd.plans({state: 'TX'})
```

```java
HashMap<String, String> query = new HashMap<String, String>();
query.put("state", "TX");

pd.plans(query);
```

> example fetching information for PPO plans in South Carolina:

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" https://platform.pokitdok.com/api/v4/plans/?state=SC&plan_type=PPO
```

```python
pd.plans(state='SC', plan_type='PPO')
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
pd.plans({state: 'SC', plan_type: 'PPO'})
```

```java
HashMap<String, String> query = new HashMap<String, String>();
query.put("state", "TX");
query.put("plan_type", "PPO");

pd.plans(query);
```

> The plans endpoint will return an array of plan objects dependent on your query. Here is an example of response json for one plan object:

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
    },
    {
      "adults": 1,
      "age": 27,
      "children": 0,
      "cost": 321.77
    },
    {
      "adults": 1,
      "age": 30,
      "children": 0,
      "cost": 348.48
    },
    {
      "adults": 1,
      "age": 40,
      "children": 0,
      "cost": 392.39
    },
    {
      "adults": 1,
      "age": 50,
      "children": 0,
      "cost": 548.36
    },
    {
      "adults": 1,
      "age": 60,
      "children": 0,
      "cost": 833.29
    },
    {
      "adults": 1,
      "age": 21,
      "children": 1,
      "cost": 502.0
    },
    {
      "adults": 1,
      "age": 30,
      "children": 1,
      "cost": 543.45
    },
    {
      "adults": 1,
      "age": 40,
      "children": 1,
      "cost": 587.36
    },
    {
      "adults": 1,
      "age": 50,
      "children": 1,
      "cost": 743.33
    },
    {
      "adults": 1,
      "age": 21,
      "children": 2,
      "cost": 696.97
    },
    {
      "adults": 1,
      "age": 30,
      "children": 2,
      "cost": 738.42
    },
    {
      "adults": 1,
      "age": 40,
      "children": 2,
      "cost": 782.33
    },
    {
      "adults": 1,
      "age": 50,
      "children": 2,
      "cost": 938.3
    },
    {
      "adults": 1,
      "age": 21,
      "children": 3,
      "cost": 891.94
    },
    {
      "adults": 1,
      "age": 30,
      "children": 3,
      "cost": 933.39
    },
    {
      "adults": 1,
      "age": 40,
      "children": 3,
      "cost": 977.3
    },
    {
      "adults": 1,
      "age": 50,
      "children": 3,
      "cost": 1133.27
    },
    {
      "adults": 0,
      "age": 21,
      "children": 1,
      "cost": 194.97
    },
    {
      "adults": 2,
      "age": 21,
      "children": 0,
      "cost": 614.06
    },
    {
      "adults": 2,
      "age": 30,
      "children": 0,
      "cost": 696.96
    },
    {
      "adults": 2,
      "age": 40,
      "children": 0,
      "cost": 784.78
    },
    {
      "adults": 2,
      "age": 50,
      "children": 0,
      "cost": 1096.72
    },
    {
      "adults": 2,
      "age": 60,
      "children": 0,
      "cost": 1666.58
    },
    {
      "adults": 2,
      "age": 21,
      "children": 1,
      "cost": 809.03
    },
    {
      "adults": 2,
      "age": 30,
      "children": 1,
      "cost": 891.93
    },
    {
      "adults": 2,
      "age": 40,
      "children": 1,
      "cost": 979.75
    },
    {
      "adults": 2,
      "age": 50,
      "children": 1,
      "cost": 1291.69
    },
    {
      "adults": 2,
      "age": 21,
      "children": 2,
      "cost": 1004.0
    },
    {
      "adults": 2,
      "age": 30,
      "children": 2,
      "cost": 1086.9
    },
    {
      "adults": 2,
      "age": 40,
      "children": 2,
      "cost": 1174.72
    },
    {
      "adults": 2,
      "age": 50,
      "children": 2,
      "cost": 1486.66
    },
    {
      "adults": 2,
      "age": 21,
      "children": 3,
      "cost": 1198.97
    },
    {
      "adults": 2,
      "age": 30,
      "children": 3,
      "cost": 1281.87
    },
    {
      "adults": 2,
      "age": 40,
      "children": 3,
      "cost": 1369.69
    },
    {
      "adults": 2,
      "age": 50,
      "children": 3,
      "cost": 1681.63
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
