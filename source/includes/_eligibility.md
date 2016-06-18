## Eligibility
> Example eligibility request to determine general health benefit coverage:

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" -H "Content-Type: application/json" -XPOST -d '{
    "member": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "last_name": "Doe",
        "id": "W000000000"
    },
    "provider": {
        "first_name": "JEROME",
        "last_name": "AYA-AY",
        "npi": "1467560003"
    },
    "trading_partner_id": "MOCKPAYER"
}' https://platform.pokitdok.com/api/v4/eligibility/
```

```python
pd.eligibility({
    "member": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "last_name": "Doe",
        "id": "W000000000"
    },
    "provider": {
        "first_name": "JEROME",
        "last_name": "AYA-AY",
        "npi": "1467560003"
    },
    "trading_partner_id": "MOCKPAYER"
})
```

```csharp
 client.eligibility (
			new Dictionary<string, object> {
			 	{"member", new Dictionary<string, object> {
					{"id", "W000000000"},
					{"birth_date", "1970-01-01"},
					{"first_name", "Jane"},
					{"last_name", "Doe"}
					}},
				{"provider", new Dictionary<string, object> {
					{"npi", "1467560003"},
					{"last_name", "AYA-AY"},
					{"first_name", "JEROME"}
					}},
				{"service_types", new string[] { "health_benefit_plan_coverage" }},
				{"trading_partner_id", "MOCKPAYER"}
		});
```

```ruby
pd.eligibility({
    "member": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "last_name": "Doe",
        "id": "W000000000"
    },
    "provider": {
        "first_name": "JEROME",
        "last_name": "AYA-AY",
        "npi": "1467560003"
    },
    "trading_partner_id": "MOCKPAYER"
})
```

```java
StringBuffer buf = new StringBuffer();

buf.append("{");
buf.append("    \"member\": {");
buf.append("        \"birth_date\": \"1970-01-01\",");
buf.append("        \"first_name\": \"Jane\",");
buf.append("        \"last_name\": \"Doe\",");
buf.append("        \"id\": \"W000000000\"");
buf.append("    },");
buf.append("    \"provider\": {");
buf.append("        \"first_name\": \"JEROME\",");
buf.append("        \"last_name\": \"AYA-AY\",");
buf.append("        \"npi\": \"1467560003\"");
buf.append("    },");
buf.append("    \"trading_partner_id\": \"MOCKPAYER\"");
buf.append("}");

JSONObject query = (JSONObject) JSONValue.parse(buf.toString());
Map<String, Object> results = pd.eligibility(query);
```

> Example eligibility request to determine general health benefit coverage when a member has a specific group number value assigned:

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" -H "Content-Type: application/json" -XPOST -d '{
    "member": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "last_name": "Doe",
        "id": "W000000000",
        "group_number": "123456"
    },
    "provider": {
        "first_name": "JEROME",
        "last_name": "AYA-AY",
        "npi": "1467560003"
    },
    "trading_partner_id": "MOCKPAYER"
}' https://platform.pokitdok.com/api/v4/eligibility/
```

```python
pd.eligibility({
    "member": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "last_name": "Doe",
        "id": "W000000000",
        "group_number": "123456"
    },
    "provider": {
        "first_name": "JEROME",
        "last_name": "AYA-AY",
        "npi": "1467560003"
    },
    "trading_partner_id": "MOCKPAYER"
})
```

```csharp
client.eligibility(
    new Dictionary<string, object> {
        {"member", new Dictionary<string, string> {
                {"birth_date", "1970-01-01"},
                {"first_name", "Jane"},
                {"last_name", "Doe"},
                {"id", "W000000000"},
                {"group_number", "123456"}
            }},
        {"provider", new Dictionary<string, string> {
                {"first_name", "JEROME"},
                {"last_name", "AYA-AY"},
                {"npi", "1467560003"}
            }},
        {"trading_partner_id", "MOCKPAYER"}
    }
);
```

```java
StringBuffer buf = new StringBuffer();

buf.append("{");
buf.append("    \"member\": {");
buf.append("        \"birth_date\": \"1970-01-01\",");
buf.append("        \"first_name\": \"Jane\",");
buf.append("        \"last_name\": \"Doe\",");
buf.append("        \"id\": \"W000000000\",");
buf.append("        \"group_number\": \"123456\"");
buf.append("    },");
buf.append("    \"provider\": {");
buf.append("        \"first_name\": \"JEROME\",");
buf.append("        \"last_name\": \"AYA-AY\",");
buf.append("        \"npi\": \"1467560003\"");
buf.append("    },");
buf.append("    \"trading_partner_id\": \"MOCKPAYER\"");
buf.append("}");

JSONObject query = (JSONObject) JSONValue.parse(buf.toString());
Map<String, Object> results = pd.eligibility(query);
```

> Example eligibility request when operating on behalf of a member and a specific provider is not yet known:

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" -H "Content-Type: application/json" -XPOST -d '{
    "member": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "last_name": "Doe",
        "id": "W000000000"
    },
    "trading_partner_id": "MOCKPAYER"
}' https://platform.pokitdok.com/api/v4/eligibility/
```

```python
pd.eligibility({
    "member": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "last_name": "Doe",
        "id": "W000000000"
    },
    "trading_partner_id": "MOCKPAYER"
})
```

```csharp
client.eligibility(
    new Dictionary<string, object> {
        {"member", new Dictionary<string, string> {
                {"birth_date", "1970-01-01"},
                {"first_name", "Jane"},
                {"last_name", "Doe"},
                {"id", "W000000000"}
            }},
        {"trading_partner_id", "MOCKPAYER"}
    }
);
```

```java
StringBuffer buf = new StringBuffer();

buf.append("{");
buf.append("    \"member\": {");
buf.append("        \"birth_date\": \"1970-01-01\",");
buf.append("        \"first_name\": \"Jane\",");
buf.append("        \"last_name\": \"Doe\",");
buf.append("        \"id\": \"W000000000\"");
buf.append("    },");
buf.append("    \"trading_partner_id\": \"MOCKPAYER\"");
buf.append("}");

JSONObject query = (JSONObject) JSONValue.parse(buf.toString());
Map<String, Object> results = pd.eligibility(query);
```

> Some trading partners support eligibility requests using specific service type codes. Here's an example using a service type code to request eligibility information:

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" -H "Content-Type: application/json" -XPOST -d '{
    "member": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "last_name": "Doe",
        "id": "W000000000"
    },
    "provider": {
        "first_name": "JEROME",
        "last_name": "AYA-AY",
        "npi": "1467560003"
    },
    "service_types": "emergency_services",
    "trading_partner_id": "MOCKPAYER"
}' https://platform.pokitdok.com/api/v4/eligibility/
```

```python
pd.eligibility({
    "member": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "last_name": "Doe",
        "id": "W000000000"
    },
    "provider": {
        "first_name": "JEROME",
        "last_name": "AYA-AY",
        "npi": "1467560003"
    },
    "service_types": "emergency_services",
    "trading_partner_id": "MOCKPAYER"
})
```

```csharp
client.eligibility(
    new Dictionary<string, object> {
        {"member", new Dictionary<string, string> {
                {"birth_date", "1970-01-01"},
                {"first_name", "Jane"},
                {"last_name", "Doe"},
                {"id", "W000000000"}
            }},
        {"provider", new Dictionary<string, string> {
                {"first_name", "JEROME"},
                {"last_name", "AYA-AY"},
                {"npi", "1467560003"}
            }},
        {"service_types", "emergency_services"},
        {"trading_partner_id", "MOCKPAYER"}
    }
);
```

```ruby
pd.eligibility({
    "member": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "last_name": "Doe",
        "id": "W000000000"
    },
    "provider": {
        "first_name": "JEROME",
        "last_name": "AYA-AY",
        "npi": "1467560003"
    },
    "service_types": "emergency_services",
    "trading_partner_id": "MOCKPAYER"
})
```

```java
StringBuffer buf = new StringBuffer();

buf.append("{");
buf.append("    \"member\": {");
buf.append("        \"birth_date\": \"1970-01-01\",");
buf.append("        \"first_name\": \"Jane\",");
buf.append("        \"last_name\": \"Doe\",");
buf.append("        \"id\": \"W000000000\"");
buf.append("    },");
buf.append("    \"provider\": {");
buf.append("        \"first_name\": \"JEROME\",");
buf.append("        \"last_name\": \"AYA-AY\",");
buf.append("        \"npi\": \"1467560003\"");
buf.append("    },");
buf.append("    \"service_types\": \"emergency_services\",");
buf.append("    \"trading_partner_id\": \"MOCKPAYER\"");
buf.append("}");

JSONObject query = (JSONObject) JSONValue.parse(buf.toString());
Map<String, Object> results = pd.eligibility(query);
```

> Some trading partners support eligibility requests using a CPT code. Here's an example using a CPT code to request eligibility information:

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" -H "Content-Type: application/json" -XPOST -d '{
    "member": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "last_name": "Doe",
        "id": "W000000000"
    },
    "provider": {
        "first_name": "JEROME",
        "last_name": "AYA-AY",
        "npi": "1467560003"
    },
    "cpt_code": "81291",
    "trading_partner_id": "MOCKPAYER"
}' https://platform.pokitdok.com/api/v4/eligibility/
```

```python
pd.eligibility({
    "member": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "last_name": "Doe",
        "id": "W000000000"
    },
    "provider": {
        "first_name": "JEROME",
        "last_name": "AYA-AY",
        "npi": "1467560003"
    },
    "cpt_code": "81291",
    "trading_partner_id": "MOCKPAYER"
})
```

```csharp
client.eligibility(
    new Dictionary<string, object> {
        {"member", new Dictionary<string, string> {
                {"birth_date", "1970-01-01"},
                {"first_name", "Jane"},
                {"last_name", "Doe"},
                {"id", "W000000000"}
            }},
        {"provider", new Dictionary<string, string> {
                {"first_name", "JEROME"},
                {"last_name", "AYA-AY"},
                {"npi", "1467560003"}
            }},
        {"cpt_code", "81291"},
        {"trading_partner_id", "MOCKPAYER"}
    }
);
```

```ruby
pd.eligibility({
    "member": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "last_name": "Doe",
        "id": "W000000000"
    },
    "provider": {
        "first_name": "JEROME",
        "last_name": "AYA-AY",
        "npi": "1467560003"
    },
    "cpt_code": "81291",
    "trading_partner_id": "MOCKPAYER"
})
```

```java
StringBuffer buf = new StringBuffer();

buf.append("{");
buf.append("    \"member\": {");
buf.append("        \"birth_date\": \"1970-01-01\",");
buf.append("        \"first_name\": \"Jane\",");
buf.append("        \"last_name\": \"Doe\",");
buf.append("        \"id\": \"W000000000\"");
buf.append("    },");
buf.append("    \"provider\": {");
buf.append("        \"first_name\": \"JEROME\",");
buf.append("        \"last_name\": \"AYA-AY\",");
buf.append("        \"npi\": \"1467560003\"");
buf.append("    },");
buf.append("    \"cpt_code\": \"81291\",");
buf.append("    \"trading_partner_id\": \"MOCKPAYER\"");
buf.append("}");

JSONObject query = (JSONObject) JSONValue.parse(buf.toString());
Map<String, Object> results = pd.eligibility(query);
```

> Example eligibility request using custom application data for easy handling of asynchronous responses:

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" -H "Content-Type: application/json" -XPOST -d '{
    "member": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "last_name": "Doe",
        "id": "W000000000"
    },
    "provider": {
        "first_name": "JEROME",
        "last_name": "AYA-AY",
        "npi": "1467560003"
    },
    "trading_partner_id": "MOCKPAYER",
    "application_data": {
        "patient_id": "ABC1234XYZ",
        "location_id": 123,
        "transaction_uuid": "93f38f1b-b2cd-4da1-8b55-c6e3ab380dbf"
    }
}' https://platform.pokitdok.com/api/v4/eligibility/
```

```python
pd.eligibility({
    "member": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "last_name": "Doe",
        "id": "W000000000"
    },
    "provider": {
        "first_name": "JEROME",
        "last_name": "AYA-AY",
        "npi": "1467560003"
    },
    "trading_partner_id": "MOCKPAYER",
    "application_data": {
        "patient_id": "ABC1234XYZ",
        "location_id": 123,
        "transaction_uuid": "93f38f1b-b2cd-4da1-8b55-c6e3ab380dbf"
    }
})
```

```csharp
client.eligibility(
    new Dictionary<string, object> {
        {"member", new Dictionary<string, string> {
                {"birth_date", "1970-01-01"},
                {"first_name", "Jane"},
                {"last_name", "Doe"},
                {"id", "W000000000"}
            }},
        {"provider", new Dictionary<string, string> {
                {"first_name", "JEROME"},
                {"last_name", "AYA-AY"},
                {"npi", "1467560003"}
            }},
        {"trading_partner_id", "MOCKPAYER"},
        {"application_data", new Dictionary<string, object> {
                {"patient_id", "ABC1234XYZ"},
                {"location_id", 123},
                {"transaction_uuid", "93f38f1b-b2cd-4da1-8b55-c6e3ab380dbf"}
            }}
);
```

```ruby
pd.eligiblity({
    "member": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "last_name": "Doe",
        "id": "W000000000"
    },
    "provider": {
        "first_name": "JEROME",
        "last_name": "AYA-AY",
        "npi": "1467560003"
    },
    "trading_partner_id": "MOCKPAYER",
    "application_data": {
        "patient_id": "ABC1234XYZ",
        "location_id": 123,
        "transaction_uuid": "93f38f1b-b2cd-4da1-8b55-c6e3ab380dbf"
    }
})
```

```java
StringBuffer buf = new StringBuffer();

buf.append("{");
buf.append("    \"member\": {");
buf.append("        \"birth_date\": \"1970-01-01\",");
buf.append("        \"first_name\": \"Jane\",");
buf.append("        \"last_name\": \"Doe\",");
buf.append("        \"id\": \"W000000000\"");
buf.append("    },");
buf.append("    \"provider\": {");
buf.append("        \"first_name\": \"JEROME\",");
buf.append("        \"last_name\": \"AYA-AY\",");
buf.append("        \"npi\": \"1467560003\"");
buf.append("    },");
buf.append("    \"trading_partner_id\": \"MOCKPAYER\",");
buf.append("    \"application_data\": {");
buf.append("        \"patient_id\": \"ABC1234XYZ\",");
buf.append("        \"location_id\": 123,");
buf.append("        \"transaction_uuid\": \"93f38f1b-b2cd-4da1-8b55-c6e3ab380dbf\"");
buf.append("    }");
buf.append("");

JSONObject query = (JSONObject) JSONValue.parse(buf.toString());
Map<String, Object> results = pd.eligibility(query);
```

> Example eligibility response when the trading partner is unable to respond at this time:

```json
{   
    "coverage": {
        "active": false
        },
    "follow_up_action": "resubmission_allowed",
    "provider": {
        "first_name": "JEROME",
        "last_name": "AYA-AY",
        "npi": "1467560003"
    },
    "reject_reason": "unable_to_respond_now",
    "subscriber": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "gender": "unknown",
        "id": "W000000000",
        "last_name": "Doe"
    },
    "trading_partner_id": "MOCKPAYER",
    "valid_request": true
}
```

> Example eligibility response when the trading partner is unable to find the member specified in the
eligibility request:

```json
{
    "coverage": {
        "service_date": "2014-06-26"
    },
    "follow_up_action": "correct_and_resubmit",
    "provider": {
        "first_name": "JEROME",
        "last_name": "AYA-AY",
        "npi": "1467560003"
    },
    "reject_reason": "subscriber_insured_not_found",
    "subscriber": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "id": "W000000000",
        "last_name": "Doe"
    },
    "trading_partner_id": "MOCKPAYER",
    "valid_request": false
}
```

> Example eligibility response when the trading partner is able to find a member based on the eligibility request, but the specified birth date does not match their records:

```json
{
    "coverage": {
        "service_date": "2014-06-26"
    },
    "follow_up_action": "correct_and_resubmit",
    "provider": {
        "first_name": "JEROME",
        "last_name": "AYA-AY",
        "npi": "1467560003"
    },
    "reject_reason": "patient_birth_date_mismatch",
    "subscriber": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "id": "W000000000",
        "last_name": "Doe"
    },
    "trading_partner_id": "MOCKPAYER",
    "valid_request": false
}
```

> Example eligibility response when the trading partner cannot process eligibility requests using
a CPT code:

```json
{
    "coverage": {
        "service_date": "2014-06-26"
    },
    "follow_up_action": "resubmission_not_allowed",
    "provider": {
        "first_name": "JEROME",
        "last_name": "AYA-AY",
        "npi": "1467560003"
    },
    "reject_reason": "unable_to_respond_now",
    "subscriber": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "id": "W000000000",
        "last_name": "Doe"
    },
    "trading_partner_id": "MOCKPAYER",
    "valid_request": false
}
```

> Sample eligibility response for a successfully executed eligibility request:

```json
{    "summary": {
         "deductible": {
             "individual": {
                  "in_network": {
                      "applied": {
                          "currency": "USD",
                          "amount": "16.43"
                     },
                      "limit": {
                          "currency": "USD",
                          "amount": "3000"
                      },
                      "remaining": {
                          "currency": "USD",
                          "amount": "2983.57"
                      }
                    },
                  "out_of_network": {
                       "applied": {
                          "currency": "USD",
                          "amount": "16.43"
                      },
                      "limit": {
                          "currency": "USD",
                          "amount": "6000"
                      },
                      "remaining": {
                          "currency": "USD",
                          "amount": "5983.57"
                      }
                  }
              },
              "family": {
                 "in_network": {
                      "applied": {
                          "currency": "USD",
                          "amount": "43.91"
                      },
                      "limit": {
                          "currency": "USD",
                          "amount": "6000"
                      },
                      "remaining": {
                          "currency": "USD",
                          "amount": "5956.09"
                      }
                 },
                  "out_of_network": {
                      "applied": {
                          "currency": "USD",
                          "amount": "43.91"
                      },
                      "limit": {
                          "currency": "USD",
                          "amount": "12000"
                      },
                      "remaining": {
                          "currency": "USD",
                          "amount": "11956.09"
                      }
                  }
              }
          },
          "out_of_pocket": {
              "individual": {
                  "in_network": {
                      "applied": {
                          "currency": "USD",
                          "amount": "16.43"
                      },
                      "limit": {
                          "currency": "USD",
                          "amount": "3000"
                      },
                      "remaining": {
                          "currency": "USD",
                          "amount": "2983.57"
                      }
                  },
                  "out_of_network": {
                      "applied": {
                          "currency": "USD",
                          "amount": "16.43"
                      },
                      "limit": {
                          "currency": "USD",
                          "amount": "12500"
                      },
                      "remaining": {
                          "currency": "USD",
                          "amount": "12483.57"
                      }
                  }
              },
              "family": {
                  "in_network": {
                      "applied": {
                          "currency": "USD",
                          "amount": "43.91"
                      },
                     "limit": {
                          "currency": "USD",
                          "amount": "6000"
                      },
                      "remaining": {
                          "currency": "USD",
                          "amount": "5956.09"
                      }
                 },
                  "out_of_network": {
                      "applied": {
                          "currency": "USD",
                          "amount": "43.91"
                      },
                      "limit": {
                          "currency": "USD",
                          "amount": "25000"
                      },
                      "remaining": {
                          "currency": "USD",
                          "amount": "24956.09"
                      }
                  }
              }
          }
      },

    "coverage": {
        "coinsurance": [
            {
                "benefit_percent": 0.0,
                "authorization_required": "yes",
                "coverage_level": "employee_and_spouse",
                "in_plan_network": "yes",
                "messages": [],
                "service_type_codes": [
                    "98"
                ],
                "service_types": [
                    "professional_physician_visit_office"
                ]
            },
            {
                "benefit_percent": 0.5,
                "coverage_level": "employee_and_spouse",
                "in_plan_network": "no",
                "messages": [],
                "service_type_codes": [
                    "98"
                ],
                "service_types": [
                    "professional_physician_visit_office"
                ]
            }
        ],
        "copay": [
            {
                "authorization_required": "yes",
                "copayment": {
                    "amount": "0",
                    "currency": "USD"
                },
                "coverage_level": "employee_and_spouse",
                "in_plan_network": "yes",
                "messages": [
                    {
                        "message": "PRIMARY OFFICE"
                    }
                ],
                "service_type_codes": [
                    "98"
                ],
                "service_types": [
                    "professional_physician_visit_office"
                ]
            },
            {
                "copayment": {
                    "amount": "0",
                    "currency": "USD"
                },
                "coverage_level": "employee_and_spouse",
                "in_plan_network": "not_applicable",
                "messages": [
                    {
                        "message": "GYN OFFICE VS"
                    },
                    {
                        "message": "GYN VISIT"
                    },
                    {
                        "message": "SPEC OFFICE"
                    },
                    {
                        "message": "SPEC VISIT"
                    },
                    {
                        "message": "PRIME CARE VST"
                    },
                    {
                        "message": "Plan Requires PreCert"
                    },
                    {
                        "message": "Commercial"
                    },
                    {
                        "message": "Plan includes NAP"
                    },
                    {
                        "message": "Pre-Existing may apply"
                    }
                ],
                "service_type_codes": [
                    "98"
                ],
                "service_types": [
                    "professional_physician_visit_office"
                ]
            }
        ],
        "deductibles": [
            {
                "benefit_amount": {
                    "amount": "6000",
                    "currency": "USD"
                },
                "coverage_level": "family",
                "eligibility_date": "2013-01-01",
                "in_plan_network": "yes",
                "messages": [],
                "time_period": "calendar_year"
            },
            {
                "benefit_amount": {
                    "amount": "5956.09",
                    "currency": "USD"
                },
                "coverage_level": "family",
                "in_plan_network": "yes",
                "messages": [],
                "time_period": "remaining"
            },
            {
                "benefit_amount": {
                    "amount": "3000",
                    "currency": "USD"
                },
                "coverage_level": "individual",
                "eligibility_date": "2013-01-01",
                "in_plan_network": "yes",
                "messages": [],
                "time_period": "calendar_year"
            },
            {
                "benefit_amount": {
                    "amount": "2983.57",
                    "currency": "USD"
                },
                "coverage_level": "individual",
                "in_plan_network": "yes",
                "messages": [],
                "time_period": "remaining"
            },
            {
                "benefit_amount": {
                    "amount": "12000",
                    "currency": "USD"
                },
                "coverage_level": "family",
                "eligibility_date": "2013-01-01",
                "in_plan_network": "no",
                "messages": [],
                "time_period": "calendar_year"
            },
            {
                "benefit_amount": {
                    "amount": "11956.09",
                    "currency": "USD"
                },
                "coverage_level": "family",
                "in_plan_network": "no",
                "messages": [],
                "time_period": "remaining"
            },
            {
                "benefit_amount": {
                    "amount": "6000",
                    "currency": "USD"
                },
                "coverage_level": "individual",
                "eligibility_date": "2013-01-01",
                "in_plan_network": "no",
                "messages": [],
                "time_period": "calendar_year"
            },
            {
                "benefit_amount": {
                    "amount": "5983.57",
                    "currency": "USD"
                },
                "coverage_level": "individual",
                "in_plan_network": "no",
                "messages": [],
                "time_period": "remaining"
            }
        ],
        "eligibility_begin_date": "2012-02-01",
        "group_description": "MOCK INDIVIDUAL ADVANTAGE PLAN",
        "group_number": "000000000000013",
        "level": "employee_and_spouse",
        "out_of_pocket": [
            {
                "benefit_amount": {
                    "amount": "3000",
                    "currency": "USD"
                },
                "coverage_level": "individual",
                "in_plan_network": "yes"
            },
            {
                "benefit_amount": {
                    "amount": "2983.57",
                    "currency": "USD"
                },
                "coverage_level": "individual",
                "in_plan_network": "yes",
                "time_period": "remaining"
            },
            {
                "benefit_amount": {
                    "amount": "6000",
                    "currency": "USD"
                },
                "coverage_level": "family",
                "in_plan_network": "yes"
            },
            {
                "benefit_amount": {
                    "amount": "5956.09",
                    "currency": "USD"
                },
                "coverage_level": "family",
                "in_plan_network": "yes",
                "time_period": "remaining"
            },
            {
                "benefit_amount": {
                    "amount": "12500",
                    "currency": "USD"
                },
                "coverage_level": "individual",
                "in_plan_network": "no"
            },
            {
                "benefit_amount": {
                    "amount": "12483.57",
                    "currency": "USD"
                },
                "coverage_level": "individual",
                "in_plan_network": "no",
                "time_period": "remaining"
            },
            {
                "benefit_amount": {
                    "amount": "25000",
                    "currency": "USD"
                },
                "coverage_level": "family",
                "in_plan_network": "no"
            },
            {
                "benefit_amount": {
                    "amount": "24956.09",
                    "currency": "USD"
                },
                "coverage_level": "family",
                "in_plan_network": "no",
                "messages": [],
                "time_period": "remaining"
            }
        ],
        "plan_begin_date": "2013-02-15",
        "plan_number": "0000000",
        "service_date": "2013-08-10",
        "service_type_codes": [
            "98"
        ],
        "service_types": [
            "professional_physician_visit_office"
        ]
    },
    "payer": {
        "id": "MOCKPAYER",
        "name": "MOCK PAYER INC"
    },
    "provider": {
        "first_name": "JEROME",
        "last_name": "JEROME AYA-AY",
        "npi": "1467560003"
    },
    "service_type_codes": [
        "98"
    ],
    "service_types": [
        "professional_physician_visit_office"
    ],
    "subscriber": {
        "address": {
            "address_lines": [
                "123 MAIN ST"
            ],
            "city": "SAN MATEO",
            "state": "CA",
            "zipcode": "94401"
        },
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "id": "W000000000",
        "last_name": "Doe"
    },
    "trading_partner_id": "MOCKPAYER",
    "valid_request": true
}
```

> Sample medicare_national eligibility response for a member with Medicare Part D coverage.
  Notice that medicare members with part D coverage will have pharmacy.is_eligible set to true and
  the pharmacy.plan_number will contain their medicare part D plan number:

```json
{
    "coverage": {
        "active": true,
        "coinsurance": [
            {
                "benefit_percent": 0.2,
                "service_type_codes": [
                    "98"
                ],
                "service_types": [
                    "health_benefit_plan_coverage"
                ]
            },
            {
                "benefit_percent": 0.0,
                "service_type_codes": [
                    "98"
                ],
                "service_types": [
                    "alcoholism",
                    "smoking_cessation",
                    "home_health_care"
                ]
            }
        ],
        "deductibles": [
            {
                "benefit_amount": {
                    "amount": "1288",
                    "currency": "USD"
                },
                "insurance_type": "medicare_part_a",
                "service_type_codes": [
                    "30"
                ],
                "service_types": [
                    "health_benefit_plan_coverage"
                ],
                "time_period": "episode"
            },
            {
                "benefit_amount": {
                    "amount": "1288",
                    "currency": "USD"
                },
                "insurance_type": "medicare_part_a",
                "service_type_codes": [
                    "30"
                ],
                "service_types": [
                    "health_benefit_plan_coverage"
                ],
                "time_period": "remaining"
            },
            {
                "benefit_amount": {
                    "amount": "0",
                    "currency": "USD"
                },
                "insurance_type": "medicare_part_a",
                "service_type_codes": [
                    "45",
                    "42"
                ],
                "service_types": [
                    "hospice",
                    "home_health_care"
                ],
                "time_period": "episode"
            },
            {
                "benefit_amount": {
                    "amount": "166",
                    "currency": "USD"
                },
                "coverage_level": "individual",
                "in_plan_network": "unknown",
                "insurance_type": "medicare_part_b",
                "service_type_codes": [
                    "30"
                ],
                "service_types": [
                    "health_benefit_plan_coverage"
                ],
                "time_period": "calendar_year"
            },
            {
                "benefit_amount": {
                    "amount": "166",
                    "currency": "USD"
                },
                "coverage_level": "individual",
                "in_plan_network": "unknown",
                "insurance_type": "medicare_part_b",
                "service_type_codes": [
                    "30"
                ],
                "service_types": [
                    "health_benefit_plan_coverage"
                ],
                "time_period": "remaining"
            },
            {
                "benefit_amount": {
                    "amount": "0",
                    "currency": "USD"
                },
                "coverage_level": "individual",
                "in_plan_network": "unknown",
                "insurance_type": "medicare_part_b",
                "service_type_codes": [
                    "AJ",
                    "67",
                    "42"
                ],
                "service_types": [
                    "alcoholism",
                    "smoking_cessation",
                    "home_health_care"
                ],
                "time_period": "calendar_year"
            }
        ],
        "insurance_type": "medicare_part_b",
        "non_covered": [
            {
                "benefit_amount": {
                    "amount": "0",
                    "currency": "USD"
                },
                "service_type_codes": [
                    "54",
                    "41"
                ],
                "service_types": [
                    "long_term_care",
                    "routine_preventive_dental"
                ]
            }
        ],
        "other_payers": [
            {
                "coordination_of_benefits": "primary_payer",
                "name": "UNITEDHEALTHCARE INSURANCE COMPANY",
                "service_type_codes": [
                    "88"
                ],
                "service_types": [
                    "pharmacy"
                ]
            }
        ],
        "plan_begin_date": "2016-01-01",
        "plan_end_date": "2016-12-31",
        "service_type_codes": [
            "30",
            "UC",
            "DM",
            "BV",
            "BU",
            "BT",
            "AL",
            "AK",
            "AJ",
            "AI",
            "A8",
            "A6",
            "A4",
            "98",
            "86",
            "83",
            "76",
            "73",
            "69",
            "67",
            "53",
            "52",
            "51",
            "50",
            "42",
            "40",
            "39",
            "38",
            "37",
            "36",
            "33",
            "3",
            "28",
            "27",
            "26",
            "25",
            "24",
            "23",
            "2"
        ],
        "service_types": [
            "health_benefit_plan_coverage",
            "urgent_care",
            "medical_equipment",
            "obstetrical_gynecological",
            "obstetrical",
            "gynecological",
            "vision_optometry",
            "drug_addiction",
            "alcoholism",
            "substance_abuse",
            "psychiatric_outpatient",
            "psychotherapy",
            "psychiatric",
            "professional_physician_visit_office",
            "emergency_services",
            "infertility",
            "dialysis",
            "diagnostic_medical",
            "maternity",
            "smoking_cessation",
            "hospital_ambulatory_surgical",
            "hospital_emergency_medical",
            "hospital_emergency_accident",
            "hospital_outpatient",
            "home_health_care",
            "oral_surgery",
            "prosthodontics",
            "orthodontics",
            "dental_accident",
            "dental_crowns",
            "chiropractic",
            "consultation",
            "adjunctive_dental_services",
            "maxillofacial_prosthetics",
            "endodontics",
            "restorative",
            "periodontics",
            "diagnostic_dental",
            "surgical"
        ]
    },
    "pharmacy": {
        "benefits_manager": {
            "name": "UNITEDHEALTHCARE INSURANCE COMPANY",
            "phone": "8778423210",
            "url": "www.AARPMedicareRx.com"
        },
        "is_eligible": true,
        "plan_number": "S5820 003"
    },
    "service_type_codes": [
        "30",
        "UC",
        "DM",
        "BV",
        "BU",
        "BT",
        "AL",
        "AK",
        "AJ",
        "AI",
        "A8",
        "A6",
        "A4",
        "98",
        "86",
        "83",
        "76",
        "73",
        "69",
        "67",
        "53",
        "52",
        "51",
        "50",
        "42",
        "40",
        "39",
        "38",
        "37",
        "36",
        "33",
        "3",
        "28",
        "27",
        "26",
        "25",
        "24",
        "23",
        "2"
    ],
    "service_types": [
        "health_benefit_plan_coverage",
        "urgent_care",
        "medical_equipment",
        "obstetrical_gynecological",
        "obstetrical",
        "gynecological",
        "vision_optometry",
        "drug_addiction",
        "alcoholism",
        "substance_abuse",
        "psychiatric_outpatient",
        "psychotherapy",
        "psychiatric",
        "professional_physician_visit_office",
        "emergency_services",
        "infertility",
        "dialysis",
        "diagnostic_medical",
        "maternity",
        "smoking_cessation",
        "hospital_ambulatory_surgical",
        "hospital_emergency_medical",
        "hospital_emergency_accident",
        "hospital_outpatient",
        "home_health_care",
        "oral_surgery",
        "prosthodontics",
        "orthodontics",
        "dental_accident",
        "dental_crowns",
        "chiropractic",
        "consultation",
        "adjunctive_dental_services",
        "maxillofacial_prosthetics",
        "endodontics",
        "restorative",
        "periodontics",
        "diagnostic_dental",
        "surgical"
    ],
    "subscriber": {
        "address": {
            "address_lines": [
                "123 MAIN ST",
                "APT 123"
            ],
            "city": "ENGLEWOOD",
            "state": "NJ",
            "zipcode": "07631"
        },
        "birth_date": "1940-01-01",
        "first_name": "JANE",
        "gender": "female",
        "id": "000000000A",
        "last_name": "DOE",
        "middle_name": "M"
    },
    "summary": {
        "deductible": {
            "individual": {
                "in_network": {
                    "applied": {
                        "amount": "0.00",
                        "currency": "USD"
                    },
                    "limit": {
                        "amount": "166",
                        "currency": "USD"
                    },
                    "remaining": {
                        "amount": "166",
                        "currency": "USD"
                    }
                },
                "out_of_network": {
                    "applied": {
                        "amount": "0.00",
                        "currency": "USD"
                    },
                    "limit": {
                        "amount": "166",
                        "currency": "USD"
                    },
                    "remaining": {
                        "amount": "166",
                        "currency": "USD"
                    }
                }
            }
        },
        "out_of_pocket": {
            "individual": {
                "in_network": {
                    "applied": {
                        "amount": "0.00",
                        "currency": "USD"
                    },
                    "limit": {
                        "amount": "0",
                        "currency": "USD"
                    },
                    "remaining": {
                        "amount": "0",
                        "currency": "USD"
                    }
                },
                "out_of_network": {
                    "applied": {
                        "amount": "0.00",
                        "currency": "USD"
                    },
                    "limit": {
                        "amount": "0",
                        "currency": "USD"
                    },
                    "remaining": {
                        "amount": "0",
                        "currency": "USD"
                    }
                }
            }
        }
    },
    "trading_partner_id": "medicare_national",
    "valid_request": true
}
```

*Available modes of operation: batch/async or real-time*

The Eligibility endpoint makes it easy to verify a member's insurance information in real-time. You can check
co-insurance, copay, deductible and out of pocket amounts for a member along with other benefit information.

Use the [Trading Partners](#trading-partners) endpoint to determine available trading_partner_id values for use with the
Eligibility API.

| Endpoint      | HTTP Method | Description                                                  |
|:--------------|:------------|:-------------------------------------------------------------|
| /eligibility/ | POST        | Determine eligibility via an X12 270 Request For Eligibility |


All eligibility requests must include a valid Provider NPI. Some trading partners require that the submitting provider’s
NPI be registered or be a participating provider with that health plan to successfully check eligibility.

The Eligibility endpoint allows you to request eligibility for service types. The service_type parameter
allows you to specify particular service(s), however, if no service type is specified the
request will be made for general benefit coverage (health_benefit_plan_coverage). Some trading partners may not support specific service type inquiries. A full listing of possible service_types values is included [below](#service-type).

Some trading partners allow combinations of the below parameters to return a successful eligibility response.  PokitDok will be adding details on available search options per trading partner in the near future.

The /eligibility/ endpoint accepts the following parameters:

| Parameter                  | Description                                                                                                                                                                                                     |
|:---------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| cpt_code                   | The CPT code that should be used to request specific eligibility information. Note: requests based on CPT code are not supported by all trading partners.                                                       |
| payer                      | The payer associated with a request. Uses the payer [object](#eligibility-payer).                                                                                                                               |
| member.birth_date          | The named insured’s birth date as specified on their policy. May be omitted if member.id is provided.                                                                                                           |
| member.first_name          | The named insured’s first name as specified on their policy.                                                                                                                                                    |
| member.middle_name         | The named insured’s middle name as specified on their policy.                                                                                                                                                   |
| member.suffix              | The named insured’s suffix.                                                                                                                                                                                     |
| member.id                  | The named insured’s member identifier. May be omitted if member.birth_date is provided.                                                                                                                         |
| member.last_name           | The named insured’s last name as specified on their policy.                                                                                                                                                     |
| member.plan_start_date     | The date that plan coverage started for the member.                                                                                                                                                             |
| member.group_number        | Group number for the member.                                                                                                                                                                                    |
| provider.first_name        | The provider’s first name when the provider is an individual.                                                                                                                                                   |
| provider.middle_name       | The provider’s middle name when the provider is an individual.                                                                                                                                                  |
| provider.last_name         | The provider’s last name when the provider is an individual.                                                                                                                                                    |
| provider.suffix            | The provider’s name suffix.                                                                                                                                                                                     |
| provider.pin               | The personal identification number of the provider.                                                                                                                                                             |
| provider.npi               | The NPI for the provider.                                                                                                                                                                                       |
| provider.organization_name | The provider’s name when the provider is an organization. first_name and last_name should be omitted when sending organization_name.                                                                            |
| service_types              | The service type(s) the eligibility request is being made against. Defaults to health_benefit_plan_coverage. A full listing of possible service_types values is included [below](#service-type).                |
| service_type_codes         | The service type codes the eligibility request is being made against. A full listing of possible service_type_codes values is included [below](#service-type).                                                   |
| procedure_id               | The unique identifier of the procedure.                                                                                                                                                                         |
| procedure_id_qualifier     | The qualifier associated with the procedure id (e.g. cpt). A full list of possible values is included [below](#procedure-id-qualifier).                                                                         |
| transaction_code           | The purpose of the eligibility transaction. Defaults to request. Other possibility is cancellation.                                                                                                             |
| trading_partner_id         | Unique id for the intended trading partner, as specified by the [Trading Partners](#trading-partners) Endpoint.                                                                                                 |


Eligibility and benefit responses vary depending on the trading partner and the plan in which a member is enrolled. Some trading partners may not provide deductible, out-of-pocket, copayment, coinsurance or other specific plan information. PokitDok will return all information received from the trading partner in the eligibility response.

PokitDok adds a Summary section in the eligibility response for convenience as a quick overview of a member's deductible and out-of-pocket information.  This should not be seen as a total replacement for the detailed deductible and out-of-pocket information in the coverage section of the eligibility response.  The Summary section contains deductible and out-of-pocket values for overall health benefit plan coverage as well as any additional service types for which deductible and out-of-pocket information is received.  When a value of $0 is returned in the Summary section, users should reference the Coverage section to determine if the trading partner returned a zero value or if the information was not provided in the response.

The /eligibility/ response contains the following fields:

| Field                                               | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|:----------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| coverage.active                                     | A boolean value that is true when the member has active coverage. It is false when membership information could not be returned or when inactive coverage is indicated by the trading partner.                                                                                                                                                                                                                                                                                        |
| coverage.coverage_details                           | Additional information relating to the coverage.                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| coverage.coverage_details.status                    | The status of the coverage.                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| coverage.coverage_details.group_or_policy_number    | The group or policy number associated with the coverage.                                                                                                                                                                                                                                                                                                                                                                                                                              |
| coverage.coverage_details.plan_description          | The product name or special program name for the insurance plan. This is often the brand or marketing name for the plan.                                                                                                                                                                                                                                                                                                                                                              |
| coverage.coverage_details.insurance_type            | The type of insurance coverage. Possible values include: hmo, ppo, pos, cobra, commercial, medicaid, medicare_part_a, medicare_part_b, other                                                                                                                                                                                                                                                                                                                                          |
| coverage.coverage_details                           | Additional information relating to the coverage.                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| coverage.coverage_details.service_types             | The service type(s) the eligibility request is being made against. Defaults to health_benefit_plan_coverage. A full listing of possible service_types values is included [below](#service-type).                                                                                                                                                                                                                                                                                      |
| coverage.coverage_details.service_type_codes        | The service type codes the eligibility request is being made against. A full listing of possible service_type_codes values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                        |
| coverage.plan_benefit_description                   | Additional information relating to the coverages benefit's plan.                                                                                                                                                                                                                                                                                                                                                                                                                      |
| coverage.plan_benefit_description.messages.message  | Messages associated with the coverages benefit's plan.                                                                                                                                                                                                                                                                                                                                                                                                                                |
| coverage.plan_benefit_description.coverage_level    | The coverage level that applies to the coverages benefit's plan. Possible values include: employee_only, employee_and_spouse, employee_and_children, family, individual                                                                                                                                                                                                                                                                                                               |
| coverage.plan_benefit_description.service_types     | The service type(s) the eligibility request is being made against. Defaults to health_benefit_plan_coverage. A full listing of possible service_types values is included [below](#service-type).                                                                                                                                                                                                                                                                                      |
| coverage.plan_benefit_description.service_type_codes| The service type codes the eligibility request is being made against. A full listing of possible service_type_codes values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                        |
| coverage.group_or_policy_number                     | The group or policy number associated with the coverage.                                                                                                                                                                                                                                                                                                                                                                                                                              |
| coverage.healthcare_facilities                      | Healthcare facility payer information (used when coordination of benefits is needed). Like TPA/IPA.                                                                                                                                                                                                                                                                                                                                                                                   |
| coverage.healthcare_facilities.address              | The address of the healthcare facility. Uses the address [object](#eligibility-address).                                                                                                                                                                                                                                                                                                                                                                                              |
| coverage.healthcare_facilities.name                 | The name of the healthcare facility.                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| coverage.healthcare_facilities.phone                | The phone number of the healthcare facility.                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| coverage.healthcare_facilities.email                | The email of the healthcare facility.                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| coverage.healthcare_facilities.url                  | The the url associacted with the healthcare facility.                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| coverage.healthcare_facilities.fax                  | The fax of the healthcare facility.                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| coverage.healthcare_facilities.facility_type        | The type of healthcare facility.                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| coverage.healthcare_facilities.service_types        | The service type(s) the eligibility request is being made against. Defaults to health_benefit_plan_coverage. A full listing of possible service_types values is included [below](#service-type).                                                                                                                                                                                                                                                                                      |
| coverage.healthcare_facilities.service_type_codes   | The service type codes the eligibility request is being made against. A full listing of possible service_type_codes values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                        |
| coverage.coinsurance                                | List of co-insurance information for the member.                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| coverage.coinsurance.service_types                  | The service type(s) the eligibility request is being made against. Defaults to health_benefit_plan_coverage. A full listing of possible service_types values is included [below](#service-type).                                                                                                                                                                                                                                                                                      |
| coverage.coinsurance.service_type_codes             | The service type codes the eligibility request is being made against. A full listing of possible service_type_codes values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                        |
| coverage.coinsurance.authorization_required         | Whether or not authorization is required. List of possible values can be seen [below](#authz-req).                                                                                                                                                                                                                                                                                                                                                                                    |
| coverage.coinsurance.procedure_id                   | The unique identifier of the procedure.                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| coverage.coinsurance.procedure_id_qualifier         | The qualifier associated with the procedure id (e.g. cpt). A full list of possible values is included [below](#procedure-id-qualifier).                                                                                                                                                                                                                                                                                                                                               |
| coverage.coinsurance.messages.message               | Messages associated with the coverages coinsurance.                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| coverage.coinsurance.delivery                       | Object containing service delivery information. Uses the delivery [object](#eligibility-delivery).                                                                                                                                                                                                                                                                                                                                                                                    |
| coverage.coinsurance.benefit_percent                | A percentage that represents the patient's portion of the responsibility for a benefit. (e.g. 0.2 when the patient's portion of the responsibility is 20% )                                                                                                                                                                                                                                                                                                                           |
| coverage.coinsurance.coverage_level                 | The coverage level that applies to this co-insurance information. Possible values include: employee_only, employee_and_spouse, employee_and_children, family, individual                                                                                                                                                                                                                                                                                                              |
| coverage.coinsurance.in_plan_network                | Indicates whether or not the co-insurance information applies to in or out of network. providers. If the co-insurance information is not dependent upon network status, not_applicable may be returned to indicate the value is the same for in and out of network providers.                                                                                                                                                                                                         |
| coverage.coinsurance.service_types                  | A list of service types that apply to this co-insurance information. A full list of possible values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                                               |
| coverage.limitations.benefit_amount                 | Monetary amount for the benefit limitation. Uses the monetary amount [object](#eligibility-monetary-amount).                                                                                                                                                                                                                                                                                                                                                                          |
| coverage.limitations.delivery                       | Object containing service delivery information. Uses the delivery [object](#eligibility-delivery).                                                                                                                                                                                                                                                                                                                                                                                    |
| coverage.limitations.messages.message               | Messages associated with the coverage's limitations.                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| coverage.limitations.service_type_codes             | The service type codes the eligibility request is being made against. A full listing of possible service_type_codes values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                        |
| coverage.limitations.procedure_id                   | The unique identifier of the procedure.                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| coverage.limitations.procedure_id_qualifier         | The qualifier associated with the procedure id (e.g. cpt). A full list of possible values is included [below](#procedure-id-qualifier).                                                                                                                                                                                                                                                                                                                                               |
| coverage.limitations.coverage_level                 | The coverage level that applies to this limitation. This can be at family or individual levels.                                                                                                                                                                                                                                                                                                                                                                                       |
| coverage.limitations.in_plan_network                | Indicates whether or not the limitation applies to in or out of network providers. If the limitation is not dependent upon network status, not_applicable may be returned to indicate the value is the same for in and out of network providers.                                                                                                                                                                                                                                      |
| coverage.limitations.service_types                  | A list of service types that apply to this limitation. A full list of possible values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                                                             |
| coverage.contacts                                   | List of contacts related to the member's coverage. This may include contact information for the payer as well as vendors or third party administrators.                                                                                                                                                                                                                                                                                                                               |
| coverage.contacts.name                              | The name of this contact.                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| coverage.contacts.id                                | The primary identifier for this contact.                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| coverage.contacts.email                             | email address that may be used for this contact.                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| coverage.contacts.phone                             | phone number for this contact.                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| coverage.contacts.url                               | URL for this contact. This is typically a link to the contact's web site.                                                                                                                                                                                                                                                                                                                                                                                                             |
| coverage.contacts.contact_type                      | The type of entity related to this contact information. Possible values include: vendor, third_party_administrator, plan_sponsor, payer, primary_payer, secondary_payer, tertiary_payer, utilization_management_organization                                                                                                                                                                                                                                                          |
| coverage.contacts.address                           | The contact's address information. Uses the address [object](#eligibility-address).                                                                                                                                                                                                                                                                                                                                                                                                   |
| coverage.contacts.service_types                     | A list of service types that apply to this contact information. A full list of possible values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                                                    |
| coverage.contacts.service_type_codes                | The service type codes the eligibility request is being made against. A full listing of possible service_type_codes values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                        |
| coverage.contacts.procedure_id                      | The unique identifier of the procedure.                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| coverage.contacts.procedure_id_qualifier            | The qualifier associated with the procedure id (e.g. cpt). A full list of possible values is included [below](#procedure-id-qualifier).                                                                                                                                                                                                                                                                                                                                               |
| coverage.copay                                      | List of co-payment information for the member.                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| coverage.copay.copayment                            | Monetary amount for this copay item (e.g. 15 for a $15 co-pay). Uses the monetary amount [object](#eligibility-monetary-amount).                                                                                                                                                                                                                                                                                                                                                      |
| coverage.copay.coverage_level                       | The coverage level that applies to this co-pay information. Possible values include: employee_only, employee_and_spouse, employee_and_children, family, individual.                                                                                                                                                                                                                                                                                                                   |
| coverage.copay.in_plan_network                      | Indicates whether or not the copay information applies to in or out of network providers. If the copay information is not dependent upon network status, not_applicable may be returned to indicate the value is the same for in and out of network providers.                                                                                                                                                                                                                        |
| coverage.copay.service_types                        | A list of service types that apply to this co-pay information. A full list of possible values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                                                     |
| coverage.copay.service_type_codes                   | The service type codes the eligibility request is being made against. A full listing of possible service_type_codes values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                        |
| coverage.copay.authorization_required               | Whether or not authorization is required. List of possible values can be seen [below](#authz-req).                                                                                                                                                                                                                                                                                                                                                                                    |
| coverage.copay.messages.message                     | Messages associated with the coverage's copay.                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| coverage.copay.procedure_id                         | The unique identifier of the procedure.                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| coverage.copay.procedure_id_qualifier               | The qualifier associated with the procedure id (e.g. cpt). A full list of possible values is included [below](#procedure-id-qualifier).                                                                                                                                                                                                                                                                                                                                               |
| coverage.copay.delivery                             | Object containing service delivery information. Uses the delivery [object](#eligibility-delivery).                                                                                                                                                                                                                                                                                                                                                                                    |
| coverage.deductibles                                | List of deductible information for the member.                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| coverage.deductibles.messages.message               | Messages associated with the coverage's deductible.                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| coverage.deductibles.eligibility_date               | The eligibility date of the deductible.                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| coverage.deductibles.delivery                       | Object containing service delivery information. Uses the delivery [object](#eligibility-delivery).                                                                                                                                                                                                                                                                                                                                                                                    |
| coverage.deductibles.service_type_codes             | The service type codes the eligibility request is being made against. A full listing of possible service_type_codes values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                        |
| coverage.deductibles.procedure_id                   | The unique identifier of the procedure.                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| coverage.deductibles.procedure_id_qualifier         | The qualifier associated with the procedure id (e.g. cpt). A full list of possible values is included [below](#procedure-id-qualifier).                                                                                                                                                                                                                                                                                                                                               |
| coverage.deductibles.insurance_type                 | Type of insurance associated with a deductible.                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| coverage.deductibles.benefit_amount                 | Monetary amount for this deductible item. For calendar year deductible information, this will be the deductible for the calendar year for the associated coverage level and in/out of plan network indicator. (e.g. $7000.00 for in network, family coverage)                                                                                                                                                                                                                         |
| coverage.deductibles.coverage_level                 | The coverage level that applies to this deductible information. When a family (or more than one person) is covered, you'll see deductible information for the family as well as the individual that was referenced in the eligibility request.                                                                                                                                                                                                                                        |
| coverage.deductibles.in_plan_network                | Indicates whether or not the deductible information applies to in or out of network providers. If the deductible information is not dependent upon network status, not_applicable may be returned to indicate the value is the same for in and out of network providers.                                                                                                                                                                                                              |
| coverage.deductibles.time_period                    | The period of time for which this deductible item applies. Possible values include: calendar_year and remaining. remaining indicates the amount that remains in the calendar year for the member to reach their deductible. calendar_year indicates that the amount represents the total deductible amount for the current year. When no time period applies to deductible information, time_period will not be included for that deductible in the response.                         |
| coverage.deductibles.service_types                  | A list of service types that apply to this deductible information. A full list of possible values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                                                 |
| coverage.cannot_process                             | Returned if the payer cannot process specified service types.                                                                                                                                                                                                                                                                                                                                                                                                                         |
| coverage.cannot_process.messages.message            | Messages associated with the reason why a payer was unable to process a service.                                                                                                                                                                                                                                                                                                                                                                                                      |
| coverage.cannot_process.service_types               | The service type(s) the eligibility request is being made against. Defaults to health_benefit_plan_coverage. A full listing of possible service_types values is included [below](#service-type).                                                                                                                                                                                                                                                                                      |
| coverage.cannot_process.service_type_codes          | The service type codes the eligibility request is being made against. A full listing of possible service_type_codes values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                        |
| coverage.other_payers                               | A list of other payers that provide coverage for the member. This list of payers is primarily used to communicate information related to the coordination of benefits.                                                                                                                                                                                                                                                                                                                |
| coverage.other_payers.service_type_codes            | The service type codes the eligibility request is being made against. A full listing of possible service_type_codes values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                        |
| coverage.other_payers.procedure_id                  | The unique identifier of the procedure.                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| coverage.other_payers.procedure_id_qualifier        | The qualifier associated with the procedure id (e.g. cpt). A full list of possible values is included [below](#procedure-id-qualifier).                                                                                                                                                                                                                                                                                                                                               |
| coverage.other_payers.plan_description              | The product name or special program name for the insurance plan. This is often the brand or marketing name for the plan.                                                                                                                                                                                                                                                                                                                                                              |
| coverage.other_payers.plan_number                   | Plan ID/number for the member specified in the eligibility request.                                                                                                                                                                                                                                                                                                                                                                                                                   |
| coverage.other_payers.coordination_of_benefits      | The role of this payer in the coordination of benefits. Possible values include: primary_payer, secondary_payer, tertiary_payer                                                                                                                                                                                                                                                                                                                                                       |
| coverage.other_payers.coordination_of_benefits_date | The date when this payer started participating in the coordination of benefits.                                                                                                                                                                                                                                                                                                                                                                                                       |
| coverage.other_payers.coverage_level                | The coverage level for this plan. Possible values include: employee_only, employee_and_spouse, employee_and_children, family, individual                                                                                                                                                                                                                                                                                                                                              |
| coverage.other_payers.id                            | The unique id used for this payer.                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| coverage.other_payers.name                          | The name of this payer. (e.g. MEDICARE).                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| coverage.other_payers.subscriber                    | The subscriber information associated with this payer. Uses the subscriber [object](#eligibility-subscriber).                                                                                                                                                                                                                                                                                                                                                                         |
| coverage.other_payers.service_types                 | A list of service types that apply to this payer information. A full list of possible values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                                                      |
| coverage.out_of_pocket                              | List of out of pocket (stop loss) information for the member.                                                                                                                                                                                                                                                                                                                                                                                                                         |
| coverage.out_of_pocket.messages.message             | Messages associated with the coverage's out of pocket.                                                                                                                                                                                                                                                                                                                                                                                                                                |
| coverage.out_of_pocket.delivery                     | Object containing service delivery information. Uses the delivery [object](#eligibility-delivery).                                                                                                                                                                                                                                                                                                                                                                                    |
| coverage.out_of_pocket.service_type_codes           | The service type codes the eligibility request is being made against. A full listing of possible service_type_codes values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                        |
| coverage.out_of_pocket.procedure_id                 | The unique identifier of the procedure.                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| coverage.out_of_pocket.procedure_id_qualifier       | The qualifier associated with the procedure id (e.g. cpt). A full list of possible values is included [below](#procedure-id-qualifier).                                                                                                                                                                                                                                                                                                                                               |
| coverage.out_of_pocket.benefit_amount               | Monetary amount for this out of pocket item. For calendar year out of pocket information, this will be the out of pocket amount for the calendar year for the associated coverage level and in/out of plan network indicator (e.g. $12600.00 for in network, family coverage). Uses the monetary amount [object](#eligibility-monetary-amount).                                                                                                                                       |
| coverage.out_of_pocket.coverage_level               | The coverage level that applies to this out of pocket information. When a family (or more than one person) is covered, you'll see out of pocket information for the family as well as the individual that was referenced in the eligibility request.                                                                                                                                                                                                                                  |
| coverage.out_of_pocket.in_plan_network              | Indicates whether or not the out of pocket information applies to in or out of network providers. If the out of pocket information is not dependent upon network status, not_applicable may be returned to indicate the value is the same for in and out of network providers.                                                                                                                                                                                                        |
| coverage.out_of_pocket.time_period                  | The period of time for which this out of pocket item applies. Possible values include: calendar_year and remaining. remaining indicates the amount that remains in the calendar year for the member to reach their out of pocket amount. calendar_year indicates that the amount represents the total out of pocket amount for the current year. When no time period applies to deductible information, time_period will not be included for that out of pocket item in the response. |
| coverage.out_of_pocket.service_types                | A list of service types that apply to this out of pocket information. A full list of possible values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                                              |
| coverage.non_covered                                | List of eligibility benefits that are not covered.                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| coverage.non_covered.messages.message               | Messages associated with the reason why an eligibility benefit is not covered.                                                                                                                                                                                                                                                                                                                                                                                                        |
| coverage.non_covered.in_plan_network                | Whether or not the eligibility benefit is within the plan network.                                                                                                                                                                                                                                                                                                                                                                                                                    |
| coverage.non_covered.coverage_level                 | The coverage level that applies to this deductible information. When a family (or more than one person) is covered, you'll see deductible information for the family as well as the individual that was referenced in the eligibility request. A full list of possible values is included [below](#coverage-level).                                                                                                                                                                   |
| coverage.non_covered.benefit_amount                 | Monetary amount for this out of pocket item. For calendar year out of pocket information, this will be the out of pocket amount for the calendar year for the associated coverage level and in/out of plan network indicator (e.g. $12600.00 for in network, family coverage). Uses the monetary amount [object](#eligibility-monetary-amount).                                                                                                                                       |
| coverage.non_covered.delivery                       | Object containing service delivery information. Uses the delivery [object](#eligibility-delivery).                                                                                                                                                                                                                                                                                                                                                                                    |
| coverage.non_covered.time_period                    | Defines the time frame in which services are to be rendered or continued. A full list of possibilities can be seen [below](#eligibility_time_period_qualifier).                                                                                                                                                                                                                                                                                                                       |
| coverage.non_covered.service_types                  | The service type(s) the eligibility request is being made against. A full listing of possible service_types values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                                |
| coverage.non_covered.service_type_codes             | The service type codes the eligibility request is being made against. A full listing of possible service_type_codes values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                        |
| coverage.non_covered.procedure_id                   | The unique identifier of the procedure.                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| coverage.non_covered.procedure_id_qualifier         | The qualifier associated with the procedure id (e.g. cpt). A full list of possible values is included [below](#procedure-id-qualifier).                                                                                                                                                                                                                                                                                                                                               |
| coverage.service_types                              | The service type(s) the eligibility request is being made against. A full listing of possible service_types values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                                |
| coverage.service_type_codes                         | The service type codes the eligibility request is being made against. A full listing of possible service_type_codes values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                        |
| coverage.procedure_id                               | The unique identifier of the procedure.                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| coverage.procedure_id_qualifier                     | The qualifier associated with the procedure id (e.g. cpt). A full list of possible values is included [below](#procedure-id-qualifier).                                                                                                                                                                                                                                                                                                                                               |
| coverage.plan_date                                  | The plan date associated with the coverage.                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| coverage.primary_care_provider                      | The primary care provider for the eligibility check.                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| coverage.primary_care_provider.phone                | The phone number of the primary care provider.                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| coverage.primary_care_provider.email                | The email of the primary care provider.                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| coverage.primary_care_provider.url                  | The the url associacted with the primary care provider                                                                                                                                                                                                                                                                                                                                                                                                                                |
| coverage.primary_care_provider.fax                  | The fax of the primary care provider.                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| coverage.primary_care_provider.address              | The primary care provider's address information. Uses the address [object](#eligibility-address).                                                                                                                                                                                                                                                                                                                                                                                     |
| coverage.primary_care_provider.first_name           | The primary care provider's first name.                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| coverage.primary_care_provider.middle_name          | The primary care provider's middle name.                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| coverage.primary_care_provider.last_name            | The primary care provider's last name.                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| coverage.primary_care_provider.suffix               | The primary care provider's suffix.                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| coverage.primary_care_provider.organization_name    | The primary care provider's name when the provider is an organization. first_name and last_name should be omitted when sending organization_name.                                                                                                                                                                                                                                                                                                                                     |
| coverage.primary_care_provider.messages.message     | Messages associated with the coverages benefit's plan.                                                                                                                                                                                                                                                                                                                                                                                                                                |                                                                                                                                                                                                                                                                                                                                            |
| coverage.eligibility_begin_date                     | The date eligibility started for the member's plan.                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| coverage.group_description                          | Group description for the member specified in the eligibility request.                                                                                                                                                                                                                                                                                                                                                                                                                |
| coverage.group_number                               | Group number for the member specified in the eligibility request.                                                                                                                                                                                                                                                                                                                                                                                                                     |
| coverage.insurance_type                             | The type of insurance coverage. Possible values include: hmo, ppo, pos, cobra, commercial, medicaid, medicare_part_a, medicare_part_b, other                                                                                                                                                                                                                                                                                                                                          |
| coverage.level                                      | The coverage level the member has for their plan. Possible values include: employee_only, employee_and_spouse, employee_and_children, family, individual                                                                                                                                                                                                                                                                                                                              |
| coverage.plan_begin_date                            | The date that plan coverage started for the member specified in the eligibility request.                                                                                                                                                                                                                                                                                                                                                                                              |
| coverage.plan_end_date                              | The date that plan coverage ends for the member specified in the eligibility request.                                                                                                                                                                                                                                                                                                                                                                                                 |
| coverage.plan_description                           | The product name or special program name for the insurance plan. This is often the brand or marketing name for the plan.                                                                                                                                                                                                                                                                                                                                                              |
| coverage.plan_number                                | Plan ID/number for the member specified in the eligibility request.                                                                                                                                                                                                                                                                                                                                                                                                                   |
| coverage.service_date                               | The date the eligibility request was processed.                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| follow_up_action                                    | When an eligibility request is rejected, a follow up action will be provided to inform your application how to proceed. Possible values include: correct_and_resubmit, resubmit_original, resubmission_not_allowed                                                                                                                                                                                                                                                                    |
| dependent                                           | The dependent associated with the eligibility request.                                                                                                                                                                                                                                                                                                                                                                                                                                |
| dependent.address                                   | The dependent's address information. Uses the address [object](#eligibility-address).                                                                                                                                                                                                                                                                                                                                                                                                 |
| dependent.gender                                    | The dependent's gender.                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| dependent.first_name                                | The dependent's first name.                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| dependent.middle_name                               | The dependent's middle name.                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| dependent.last_name                                 | The dependent's last name.                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| dependent.id                                        | The dependent's unique identifier.                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| dependent.relationship                              | The dependent's relationship.                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| payer                                               | The payer returned by the trading partner for the eligibility request. Uses the payer [object](#eligibility-payer).                                                                                                                                                                                                                                                                                                                                                                   |
| pharmacy.benefits_manager                           | The pharmacy benefits manager information.                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| pharmacy.benefit_date                               | The benefit date associated with the pharmacy.                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| pharmacy.benefits_manager.name                      | The name of the entity that is responsible for managing pharmacy benefits.                                                                                                                                                                                                                                                                                                                                                                                                            |
| pharmacy.benefits_manager.phone                     | Contact phone number for the pharmacy benefits manager.                                                                                                                                                                                                                                                                                                                                                                                                                               |
| pharmacy.benefits_manager.url                       | The pharmacy benefits manager's web site.                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| pharmacy.benefits_manager.coverage_description      | The coverage description associated with the pharmacy benefits manager.                                                                                                                                                                                                                                                                                                                                                                                                               |
| pharmacy.is_eligible                                | A boolean value used to indicate if the member specified in the eligibility request has active pharmacy benefits.                                                                                                                                                                                                                                                                                                                                                                     |
| pharmacy.plan_number                                | Plan ID/number for the member's pharmacy benefits.  A pharmacy plan number will be present when trading partners include it in their eligibility response.  For example, medicare members will have pharmacy.plan_number populated if they're enrolled in a Medicare Part D Prescription Drug Plan.                                                                                                                                                                                   |
| pharmacy.copay                                      | A list of copay data that will be included when available from the associated pharmacy.                                                                                                                                                                                                                                                                                                                                                                                               |
| pharmacy.copay.copayment                            | The copayment amount associated with a copay. Uses the monetary amount [object](#eligibility-monetary-amount).                                                                                                                                                                                                                                                                                                                                                                        |
| pharmacy.copay.tier                                 | The tier associated with a pharmacy copay.                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| pharmacy.copay.type                                 | The service type(s) the copay is being made for. A full listing of possible service_types values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                                                  |
| pharmacy.copay.notes                                | Any notes associated with a phamarcy copay.                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| pharmacy.copay.supply                               | The supply associated with a pharmacy copay.                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| provider.npi                                        | The NPI for the provider.                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| provider.first_name                                 | The provider’s first name when the provider is an individual.                                                                                                                                                                                                                                                                                                                                                                                                                         |
| provider.middle_name                                | The provider’s middle name when the provider is an individual.                                                                                                                                                                                                                                                                                                                                                                                                                        |
| provider.last_name                                  | The provider’s last name when the provider is an individual.                                                                                                                                                                                                                                                                                                                                                                                                                          |
| provider.suffix                                     | The provider’s suffix when the provider is an individual.                                                                                                                                                                                                                                                                                                                                                                                                                             |
| provider.pin                                        | The provider’s personal identification number.                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| provider.organization_name                          | The provider’s name when the provider is an organization. first_name and last_name should be omitted when sending organization_name.                                                                                                                                                                                                                                                                                                                                                  |
| reject_reason                                       | When a trading partner is unable to provide eligibility information for an eligibility request, they will provide a reject reason. A full list of reasons and their description is included [below](#reject-reason).                                                                                                                                                                                                                                                                  |
| subscriber                                          | The subscriber associated with the eligibility request. Uses the subscriber [object](#eligibility-subscriber).                                                                                                                                                                                                                                                                                                                                                                        |
| trading_partner_id                                  | Unique id for the trading partner used to process the request.                                                                                                                                                                                                                                                                                                                                                                                                                        |
| service_types                                       | The service type(s) the eligibility request is being made against. A full listing of possible service_types values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                                |
| service_type_codes                                  | The service type codes the eligibility request is being made against. A full listing of possible service_type_codes values is included [below](#service-type).                                                                                                                                                                                                                                                                                                                        |
| valid_request                                       | A boolean value used to indicate that a trading partner considered the eligibility request valid and returned a full eligibility response. If valid_request is false, it means the trading partner was unable to respond to the request. Check the parameters reject_reason and follow_up_action for more information on how to proceed when valid_request is false.                                                                                                                  |
| summary                                             | Summary section for convenience as a quick overview of a member's deductible and out-of-pocket information.                                                                                                                                                                                                                                                                                                                                                                           |
| summary.services                                    | Like its parent summary but embedded in a dictionary. Has the same deductible and out of pocket summaries that its parent contains.                                                                                                                                                                                                                                                                                                                                                   |
| summary.deductible                                  | List of deductible information for the member for overall health benefit plan coverage.                                                                                                                                                                                                                                                                                                                                                                                               |
| summary.deductible.family                           | Family deductible information.  The subproperties can be seen [below](#deductible-outofpocket).                                                                                                                                                                                                                                                                                                                                                                                       |
| summary.deductible.individual                       | Individual deductible information. The subproperties can be seen [below](#deductible-outofpocket).                                                                                                                                                                                                                                                                                                                                                                                    |
| summary.out_of_pocket                               | List of out of pocket (stop loss) information for the member for overall health benefit plan coverage.                                                                                                                                                                                                                                                                                                                                                                                |
| summary.out_of_pocket.family                        | Family deductible information.  The subproperties can be seen [below](#deductible-outofpocket).                                                                                                                                                                                                                                                                                                                                                                                       |
| summary.out_of_pocket.individual                    | Individual deductible information. The subproperties can be seen [below](#deductible-outofpocket).                                                                                                                                                                                                                                                                                                                                                                                    |

<a name="eligibility-payer"></a>
###Payer Object

| Parameter                  | Description                                                                           |
|:---------------------------|:--------------------------------------------------------------------------------------|
| id                         | The unique identifier of the payer                                                    |
| tax_id                     | The unique tax identifier of the payer                                                |
| name                       | The name of the payer.                                                                |
| phone                      | The phone number of the payer.                                                        |
| email                      | The email of the payer.                                                               |
| url                        | The the url associacted with the payer                                                |
| fax                        | The fax of the payer.                                                                 |

<a name="eligibility-address"></a>
###Address object:

| Field                                 | Description                                                                                                       |
|:--------------------------------------|:------------------------------------------------------------------------------------------------------------------|
| address_lines                         | List of strings representing the street address. (e.g. ["123 MAIN ST.", "Suite 4"])                               |
| city                                  | The city component of a address. (e.g. "SAN MATEO")                                                               |
| state                                 | The state component of a address. (e.g. "CA")                                                                     |
| zipcode                               | The zip/postal code. (e.g. "94401")                                                                               |
| country                               | The country component of a address.                                                                               |

<a name="eligibility-subscriber"></a>
###Subscriber Object

| Parameter                  | Description                                                                                                                                                                                                                                                                                      |
|:---------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| address                    | The subscriber's address information. Uses the address [object](#eligibility-address).                                                                                                                                                                                                           |
| id                         | The subscriber's member identifier.                                                                                                                                                                                                                                                              |
| first_name                 | The subscriber’s first name as specified on their policy.                                                                                                                                                                                                                                        |
| middle_name                | The subscriber's middle name as specified on their policy.                                                                                                                                                                                                                                       |
| last_name                  | The subscriber’s last name as specified on their policy.                                                                                                                                                                                                                                         |
| birth_date                 | The subscriber’s birth date as specified on their policy.                                                                                                                                                                                                                                        |
| gender                     | The subscriber’s gender as specified on their policy. Possible values include: 'female', 'male', and 'unknown'. 'unknown' will be returned when gender is not specified in the trading partner's eligibility data or when the trading partner explicitly returns a value of 'unknown'.           |
| relationship               | The subscriber's relationship.                                                                                                                                                                                                                                                                   |
| group_number               | Group number for the subscriber.                                                                                                                                                                                                                                                                 |

<a name="eligibility-delivery"></a>
###Delivery object:

| Field                                 | Description                                                                                                                                                                               |
|:--------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| units                                 | The units of services being requested.                                                                                                                                                    |
| sample_selection_modulus              | Specify the sampling frequency in terms of a modulus of the Unit of Measure, e.g., every fifth bag, every 1.5 minutes.                                                                    |
| time_period_qualifier                 | Defines the time frame in which services are to be rendered or continued. A full list of possibilities can be seen [below](#eligibility_time_period_qualifier).                           |
| period_count                          | Used to indicate the number of time_period_qualifiers.                                                                                                                                    |
| delivery_frequency_code               | Code which specifies frequency by which services can be performed.                                                                                                                        |
| delivery_pattern_time_code            | Code which specifies the time delivery pattern of the services.                                                                                                                           |
| quantity                              | The quantity of services being requested.                                                                                                                                                 |
| quantity_qualifier                    | The qualifier used to indicate the quantity type. (e.g. visits, month, hours, units, days)                                                                                                |   

<a name="eligibility-monetary-amount"></a>
###Monetary amount object:

| Field                                 | Description                                                                                                                                                                               |
|:--------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| amount                                | The value amount for this item.                                                                                                                                                           |
| currency                              | The currency used in the amount.                                                                                                                                                          |

<a name="deductible-outofpocket"></a>
###Object base that is used both by the deductible summary and out of pocket summary:

| Field                                 | Description                                                                                                                                                                               |
|:--------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| limit                                 | Monetary limit value associated with a deductible. Uses the monetary amount [object](#eligibility-monetary-amount).                                                                       |
| applied                               | Monetary value applied to a deductible. Uses the monetary amount [object](#eligibility-monetary-amount).                                                                                  |
| remaining                             | Monetary value remaining related to a deductible. Uses the monetary amount [object](#eligibility-monetary-amount).                                                                        |

<a name="procedure-id-qualifier"></a>
Full list of possible procedure_id_qualifier values that may be used in the eligiblity request or returned in an eligibility response:

| procedure_id_qualifier                |                 |
|:--------------------------------------|:----------------|
| ada_code                              | cpt             |
| hcpcs                                 | icd_9_cm        |
| hiec_product_service_code             | ndc_5_4_2_format|
| mutually_defined                      |                 |

<a name="coverage-level"></a>
Full list of possible coverage level values that may be returned in an eligibility response:

| coverage_level                        |                           |
|:--------------------------------------|:--------------------------|
| children_only                         | dependents_only           |
| employee_and_children                 | employee_only             |
| employee_and_spouse                   | family                    |
| individual                            | spouse_and_children       |
| spouse_only                           |                           |

<a name="eligibility_time_period_qualifier"></a>
Possible values that can be used in the delivery.time_period_qualifier parameter:

| time_period_qualifier Values |                    |
|:-----------------------------|:-------------------|
| 24_hours                     | admission          |
| calendar_year                | contract           |
| day                          | episode            |
| exceed                       | hour               |
| lifetime                     | lifetime_remaining |
| month                        | not_exceeded       |
| outlier                      | remaining          |
| service_year                 | visit              |
| week                         | year_to_date       |
| years                        |                    |

<a name="service-type"></a>
Full list of possible service_type values with the associated code (from X12 specification) that may be used in the eligiblity request or returned in an eligibility response:

| service_type                                          | Code (X12 Spec) |
|:------------------------------------------------------|:----------------|
| abortion                                              | 84              |
| acupuncture                                           | 64              |
| adjunctive_dental_services                            | 28              |
| aids                                                  | 85              |
| air_transportation                                    | 57              |
| alcoholism                                            | AJ              |
| allergy                                               | GY              |
| allergy_testing                                       | 79              |
| alternate_method_dialysis                             | 15              |
| ambulatory_service_facility                           | 13              |
| anesthesia                                            | 7               |
| anesthesiologist                                      | 97              |
| audiology_exam                                        | 71              |
| blood_charges                                         | 10              |
| brand_name_prescription_drug                          | 91              |
| brand_name_prescription_drug_formulary                | B2              |
| brand_name_prescription_drug_non_formulary            | B3              |
| burn_care                                             | B1              |
| cabulance                                             | 58              |
| cancer                                                | 87              |
| cardiac                                               | BL              |
| cardiac_rehabilitation                                | BG              |
| case_management                                       | CQ              |
| chemotherapy                                          | 78              |
| chiropractic                                          | 33              |
| chiropractic_office_visits                            | 34              |
| chronic_renal_disease_equipment                       | 16              |
| cognitive_therapy                                     | BD              |
| consultation                                          | 3               |
| coronary_care                                         | C1              |
| day_care_psychiatric                                  | BC              |
| dental_accident                                       | 37              |
| dental_care                                           | 35              |
| dental_crowns                                         | 36              |
| dermatology                                           | DG              |
| diabetic_supplies                                     | DS              |
| diagnostic_dental                                     | 23              |
| diagnostic_lab                                        | 5               |
| diagnostic_medical                                    | 73              |
| diagnostic_x_ray                                      | 4               |
| dialysis                                              | 76              |
| donor_procedures                                      | 63              |
| drug_addiction                                        | AK              |
| emergency_services                                    | 86              |
| endocrine                                             | BP              |
| endodontics                                           | 26              |
| experimental_drug_therapy                             | AR              |
| eye                                                   | BR              |
| eyewear_and_accessories                               | CP              |
| family_planning                                       | 82              |
| flu_vaccination                                       | CO              |
| frames                                                | AM              |
| free_standing_prescription_drug                       | 89              |
| gastrointestinal                                      | BN              |
| general_benefits                                      | 60              |
| generic_prescription_drug                             | 92              |
| generic_prescription_drug_formulary                   | GF              |
| generic_prescription_drug_non_formulary               | GN              |
| gynecological                                         | BT              |
| health_benefit_plan_coverage                          | 30              |
| home_health_care                                      | 42              |
| home_health_prescriptions                             | 43              |
| home_health_visits                                    | 44              |
| hospice                                               | 45              |
| hospital                                              | 47              |
| hospital_ambulatory_surgical                          | 53              |
| hospital_emergency_accident                           | 51              |
| hospital_emergency_medical                            | 52              |
| hospital_inpatient                                    | 48              |
| hospital_outpatient                                   | 50              |
| hospital_room_and_board                               | 49              |
| immunizations                                         | 80              |
| in_vitro_fertilization                                | 61              |
| independent_medical_evaluation                        | BA              |
| infertility                                           | 83              |
| inhalation_therapy                                    | 72              |
| intensive_care                                        | IC              |
| invasive_procedures                                   | BS              |
| lenses                                                | AO              |
| licensed_ambulance                                    | 59              |
| long_term_care                                        | 54              |
| lymphatic                                             | BM              |
| mail_order_prescription_drug                          | BX              |
| mail_order_prescription_drug_brand_name               | 90              |
| mail_order_prescription_drug_generic                  | BW              |
| major_medical                                         | 55              |
| mammogram_high_risk_patient                           | CM              |
| mammogram_low_risk_patient                            | CN              |
| massage_therapy                                       | BE              |
| maternity                                             | 69              |
| maxillofacial_prosthetics                             | 27              |
| medical_care                                          | 1               |
| medically_related_transportation                      | 56              |
| medical_equipment                                     | DM              |
| medical_equipment_purchase                            | 12              |
| medical_equipment_rental                              | 18              |
| mental_health                                         | MH              |
| mental_health_facility_inpatient                      | CG              |
| mental_health_facility_outpatient                     | CH              |
| mental_health_provider_inpatient                      | CE              |
| mental_health_provider_outpatient                     | CF              |
| mri_cat_scan                                          | 62              |
| neonatal_intensive_care                               | NI              |
| neurology                                             | BQ              |
| newborn_care                                          | 65              |
| nonmedically_necessary_physical                       | AQ              |
| nursery                                               | BI              |
| obstetrical                                           | BU              |
| obstetrical_gynecological                             | BV              |
| occupational_therapy                                  | AD              |
| oncology                                              | ON              |
| oral_surgery                                          | 40              |
| orthodontics                                          | 38              |
| orthopedic                                            | BK              |
| other_medical                                         | 9               |
| otological_exam                                       | 77              |
| partial_hospitalization_psychiatric                   | BB              |
| pathology                                             | 66              |
| pediatric                                             | BH              |
| periodontics                                          | 24              |
| pharmacy                                              | 88              |
| physical_medicine                                     | AE              |
| physical_therapy                                      | PT              |
| physician_visit_office_sick                           | BY              |
| physician_visit_office_well                           | BZ              |
| plan_waiting_period                                   | 32              |
| pneumonia_vaccine                                     | 19              |
| podiatry                                              | 93              |
| podiatry_nursing_home_visits                          | 95              |
| podiatry_office_visits                                | 94              |
| pre_admission_testing                                 | 17              |
| private_duty_nursing                                  | 74              |
| private_duty_nursing_home                             | CB              |
| private_duty_nursing_inpatient                        | CA              |
| professional_physician                                | 96              |
| professional_physician_visit_home                     | A3              |
| professional_physician_visit_inpatient                | 99              |
| professional_physician_visit_nursing_home             | A1              |
| professional_physician_visit_office                   | 98              |
| professional_physician_visit_outpatient               | A0              |
| professional_physician_visit_skilled_nursing_facility | A2              |
| prosthetic_device                                     | 75              |
| prosthodontics                                        | 39              |
| psychiatric                                           | A4              |
| psychiatric_inpatient                                 | A7              |
| psychiatric_outpatient                                | A8              |
| psychiatric_room_and_board                            | A5              |
| psychotherapy                                         | A6              |
| pulmonary                                             | PU              |
| pulmonary_rehabilitation                              | BF              |
| radiation_therapy                                     | 6               |
| rehabilitation                                        | A9              |
| rehabilitation_inpatient                              | AB              |
| rehabilitation_outpatient                             | AC              |
| rehabilitation_room_and_board                         | AA              |
| renal                                                 | RN              |
| renal_supplies_in_the_home                            | 14              |
| residential_psychiatric_treatment                     | RT              |
| respite_care                                          | 46              |
| restorative                                           | 25              |
| routine_preventive_dental                             | 41              |
| routine_exam                                          | AN              |
| routine_physical                                      | 81              |
| screening_laboratory                                  | CL              |
| screening_x_ray                                       | CK              |
| second_surgical_opinion                               | 20              |
| skilled_nursing_care                                  | AG              |
| skilled_nursing_care_room_and_board                   | AH              |
| skin                                                  | BJ              |
| smoking_cessation                                     | 67              |
| social_work                                           | 22              |
| speech_therapy                                        | AF              |
| substance_abuse                                       | AI              |
| substance_abuse_facility_inpatient                    | CI              |
| substance_abuse_facility_outpatient                   | CJ              |
| surgical                                              | 2               |
| surgical_assistance                                   | 8               |
| surgical_benefits_facility                            | CD              |
| surgical_benefits_professional_physician              | CC              |
| third_surgical_opinion                                | 21              |
| transitional_care                                     | TC              |
| transitional_nursery_care                             | TN              |
| transplants                                           | 70              |
| urgent_care                                           | UC              |
| used_medical_equipment                                | 11              |
| vision_optometry                                      | AL              |
| well_baby_care                                        | 68              |


<a name="authz-req"></a>
Full list of possible authorization_required values returned (or not) in an eligibility response:

| value   | Meaning                                                                                            |
|:--------|:---------------------------------------------------------------------------------------------------|
| yes     | indicates that an authorization or certification is required per plan provisions                   |
| no      | indicates that an authorization or certification is not required per plan provisions               |
| unknown | indicates that it is unknown whether the plan provisions require an authorization or certification |

**NOTE:** authorization_required is situational, so it could also be empty


<a name="reject-reason"></a>
Full list of possible reject_reasons on the eligibility response with description:

| reject_reason                   | Description                                                                                                                                            |
|:--------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------|
| invalid_provider_id             | submitting provider (NPI) is not valid, please submit with a valid NPI                                                                                 |
| provider_not_on_file            | submitting provider (NPI) is not valid, please submit with a valid NPI                                                                                 |
| invalid_subscriber_id           | subscriber id not found                                                                                                                                |
| dob_mismatch                    | birth date does not match member found                                                                                                                 |
| invalid_subscriber_insured_name | member not found                                                                                                                                       |
| subscriber_insured_not_found    | member id/name not found                                                                                                                               |
| invalid_subscriber_insured_id   | member id not valid                                                                                                                                    |
| invalid_subscriber_insured_name | member not found                                                                                                                                       |
| unable_to_respond_now           | trading partner is experiencing downtime and not able to complete request.  if this is a known outage the response meta section and PokitDok [status page](https://pokitdok.com/status/) will have more details.|
