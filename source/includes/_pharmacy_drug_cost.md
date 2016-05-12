## Pharmacy Drug Cost

> Example request to determine drug coverage using drug name:

```python
pd.pharmacy_drug_cost(trading_partner_id= 'medicare_national', plan_number='S0522034', drug= 'simvastatin')
```

```ruby
puts pd.pharmacy_drug_cost(trading_partner_id: 'medicare_national', plan_number: 'S0522034', drug: 'simvastatin')
```

```csharp
pd.pharmacyDrugCost(
                      new Dictionary<string, string> {
                        {"trading_partner_id", "medicare_national"},
                        {"plan_number", "S0522034"},
                        {"drug",  "simvastatin"}
                    });
```

```java
Map<String, Object> params = new HashMap<String, Object>();
params.put("trading_partner_id", "medicare_national");
params.put("plan_number", "S0522034");
params.put("drug", "simvastatin");
Map<String, Object> response = pd.pharmacyDrugCost(params);
```

> Example request to determine drug coverage using NDC:

```python
pd.pharmacy_drug_cost(trading_partner_id= 'medicare_national', plan_number='S0522034', ndc= '00071101968')
```

```ruby
puts pd.pharmacy_drug_cost(trading_partner_id: 'medicare_national', plan_number: 'S0522034', ndc: '00071101968')
```

```csharp
pd.pharmacyDrugCost(
                      new Dictionary<string, string> {
                        {"trading_partner_id", "medicare_national"},
                        {"plan_number", "S0522034"},
                        {"ndc",  "00071101968"}
                    });
```

```java
Map<String, Object> params = new HashMap<String, Object>();
params.put("trading_partner_id", "medicare_national");
params.put("plan_number", "S0522034");
params.put("ndc", "00071101968");
Map<String, Object> response = pd.pharmacyDrugCost(params);
```

> Sample Pharmacy Drug Cost API response when searching for a medication using drug name (SIMVASTATIN):  

```json
{
    "data": [
        {
            "drug": "SIMVASTATIN 40 MG TABLET", 
            "mail": {
                "ins_pay_90_day": {
                    "amount": "3.89", 
                    "currency": "USD"
                }, 
                "oop_90_day": {
                    "amount": "3.00", 
                    "currency": "USD"
                }, 
                "total_cost_90_day": {
                    "amount": "6.89", 
                    "currency": "USD"
                }
            }, 
            "retail": {
                "ins_pay_30_day": {
                    "amount": "1.60", 
                    "currency": "USD"
                }, 
                "oop_30_day": {
                    "amount": "1.00", 
                    "currency": "USD"
                }, 
                "total_cost_30_day": {
                    "amount": "2.60", 
                    "currency": "USD"
                }
            }
        }, 
        {
            "drug": "SIMVASTATIN 20 MG TABLET", 
            "mail": {
                "ins_pay_90_day": {
                    "amount": "2.33", 
                    "currency": "USD"
                }, 
                "oop_90_day": {
                    "amount": "3.00", 
                    "currency": "USD"
                }, 
                "total_cost_90_day": {
                    "amount": "5.33", 
                    "currency": "USD"
                }
            }, 
            "retail": {
                "ins_pay_30_day": {
                    "amount": "1.07", 
                    "currency": "USD"
                }, 
                "oop_30_day": {
                    "amount": "1.00", 
                    "currency": "USD"
                }, 
                "total_cost_30_day": {
                    "amount": "2.07", 
                    "currency": "USD"
                }
            }
        }, 
        {
            "drug": "SIMVASTATIN 5 MG TABLET", 
            "mail": {
                "ins_pay_90_day": {
                    "amount": "2.38", 
                    "currency": "USD"
                }, 
                "oop_90_day": {
                    "amount": "3.00", 
                    "currency": "USD"
                }, 
                "total_cost_90_day": {
                    "amount": "5.38", 
                    "currency": "USD"
                }
            }, 
            "retail": {
                "ins_pay_30_day": {
                    "amount": "1.07", 
                    "currency": "USD"
                }, 
                "oop_30_day": {
                    "amount": "1.00", 
                    "currency": "USD"
                }, 
                "total_cost_30_day": {
                    "amount": "2.07", 
                    "currency": "USD"
                }
            }
        }, 
        {
            "drug": "SIMVASTATIN 80 MG TABLET", 
            "mail": {
                "ins_pay_90_day": {
                    "amount": "7.41", 
                    "currency": "USD"
                }, 
                "oop_90_day": {
                    "amount": "3.00", 
                    "currency": "USD"
                }, 
                "total_cost_90_day": {
                    "amount": "10.41", 
                    "currency": "USD"
                }
            }, 
            "retail": {
                "ins_pay_30_day": {
                    "amount": "2.80", 
                    "currency": "USD"
                }, 
                "oop_30_day": {
                    "amount": "1.00", 
                    "currency": "USD"
                }, 
                "total_cost_30_day": {
                    "amount": "3.80", 
                    "currency": "USD"
                }
            }
        }, 
        {
            "drug": "SIMVASTATIN 10 MG TABLET", 
            "mail": {
                "ins_pay_90_day": {
                    "amount": "2.14", 
                    "currency": "USD"
                }, 
                "oop_90_day": {
                    "amount": "3.00", 
                    "currency": "USD"
                }, 
                "total_cost_90_day": {
                    "amount": "5.14", 
                    "currency": "USD"
                }
            }, 
            "retail": {
                "ins_pay_30_day": {
                    "amount": "1.00", 
                    "currency": "USD"
                }, 
                "oop_30_day": {
                    "amount": "1.00", 
                    "currency": "USD"
                }, 
                "total_cost_30_day": {
                    "amount": "2.00", 
                    "currency": "USD"
                }
            }
        }
    ]
}
```

> Sample Drug Cost API response when searching by NDC (00071101968) :

```json
{
    "data": [
        {
            "drug": "LYRICA 225 MG CAPSULE", 
            "mail": {
                "ins_pay_90_day": {
                    "amount": "793.09", 
                    "currency": "USD"
                }, 
                "oop_90_day": {
                    "amount": "198.27", 
                    "currency": "USD"
                }, 
                "total_cost_90_day": {
                    "amount": "991.36", 
                    "currency": "USD"
                }
            }, 
            "retail": {
                "ins_pay_30_day": {
                    "amount": "274.34", 
                    "currency": "USD"
                }, 
                "oop_30_day": {
                    "amount": "68.58", 
                    "currency": "USD"
                }, 
                "total_cost_30_day": {
                    "amount": "342.92", 
                    "currency": "USD"
                }
            }
        }
    ]
}
```

The Pharmacy Drug Cost Endpoint allows a deep dive into the cost for a member’s medication. It returns details about a medication’s out of pocket cost, total cost, and insurance payment.

| Endpoint    | HTTP Method | Description                                   |
|:------------|:------------|:----------------------------------------------|
| /pharmacy/drug/cost        | GET          | Determine drug cost for member |

To use the Pharmacy Drug Cost Endpoint with a Medicare member, you will need the plan number. This is the contract ID (ex. S1234) + Plan's Plan Benefit Package (PBP) Number PBP number (ex. 001) concatenated together in that order. There are several ways to get this number. The plan number may be on the member’s insurance card. If not, you can use an NCPDP E1 eligibility check or PokitDok’s Eligibility Endpoint. With the Eligibility Endpoint, Medicare members with Part D coverage will have pharmacy.is_eligible set to true and the pharmacy.plan_number will contain their Medicare Part D plan_number. Note: Your NPI must be registered with Medicare to check eligibility. 
 
A medication for which coverage is being determined will need to be specified. This can be done using the drug name or NDC. A drug name can include the name of the medication, strength, and form. For example, SIMVASTATIN 10 MG TABLET. Simvastatin is the drug name. 10 MG is the strength. Simvastatin can come in other strengths (5mg, 10mg, 20mg, 40mg, and 80mg). The form of this medication is tablet. Some drugs will come in multiple forms. Other examples are capsule, solution, suspension, lotion, cream, etc. The brand name of simvastatin is Zocor. You can search for a drug with just the brand or generic name or any combination of drug +/- strength +/- form.
 
Access benefits for a specific medication by searching by complete name of the medication. For example, SIMVASTATIN 10 MG TABLET will return coverage information for just that medication. For general results, search “simvastatin” and all of the coverage information for all strengths and forms of the drug will be returned.
 
The Pharmacy Formulary Endpoint also accepts national drug code number (NDC). The NDC is a unique 11-digit, 3-segment number used to identify a specific drug product. The segments identify the manufacturer (first 5 numbers), product (middle 4 numbers), and package (last 2 numbers). An alternative way to lookup drug coverage is by using the NDC. One medication can have multiple NDC numbers. For example, simvastatin 10 mg tablets can be supplied to the pharmacy in a 100 count and 1000 count bottle. Both of these will have different NDC numbers even though the same drug is in each of the bottles. Simvastatin from different generic manufacturers will have different NDC numbers. 

Medicare drug plans have different phases of coverage, including deductible, initial coverage, gap coverage, and catastrophic coverage. Each phase has a different out of pocket cost for covered medications. The out of pocket costs included in the Pharmacy Drug Cost Endpoint are for the member during the Initial Coverage Phase.

Out of pocket costs for medications are based on 30 day supply at retail or 90 day supply at mail order pharmacies. Some medication isn’t taken continuously, ex. antibiotics. For those medications, the member would just pay one 30 day supply copay. 

In some cases, the member’s copay will be more than the total cost of the drug. In these situations, the actual amount the member will pay will depend on the pharmacy where they fill the prescription. For example, if the member’s copay is $10 and the drug only costs $4, the pharmacy could decide to charge the member the full $10, or the actual drug price of $4. 
 
The /pharmacy/drug/cost endpoint accepts the following parameters:

| Field              | Type     | Description                                                                                       |
|:-------------------|:---------|:--------------------------------------------------------------------------------------------------|
| trading_partner_id | {string} | Unique id for the intended trading partner, as specified by the [Trading Partners](https://platform.pokitdok.com/documentation/v4/#trading-partners) endpoint.                   |
| plan_number        | {string} | Member’s plan identification number. Note: If unknown can use X12 270/271 eligibility             |
| drug               | {string} | Name of medication, strength, and form. Note: Strength and form are optional                      |
| ndc                | {string} | National drug code: a unique 11-digit, 3-segment number used to identify medication               |

The /pharmacy/drug/cost response contains the following parameters:

| Field                    | Type     | Description                                                                                                                             |
|:-------------------------|:---------|:----------------------------------------------------------------------------------------------------------------------------------------|
| label_name               | {string} | The full drug name (name + strength + form)                                                                                             |
| retail.oop_30_day        | {string} | Out of pocket cost for 30 day supply of drug at a in-network retail pharmacy                                                            |
| retail.total_cost_30_day | {string} | Total cost of drug for 30 day supply of drug at a in-network retail pharmacy (average insurance negotiated rate with pharmacy)          |
| retail.ins_pay_30_day    | {string} | Amount insurance covers for 30 day supply of drug at a in-network retail pharmacy (average insurance negotiated rate with pharmacy)     |
| mail.oop_90_day          | {string} | Out of pocket cost for 90 day supply of drug at a in-network mail order pharmacy                                                        |

| mail.total_cost_90_day   | {string} | Total cost of drug for 90 day supply of drug at a in-network mail order pharmacy (average insurance negotiated rate with pharmacy)      |

| mail.ins_pay_90_day      | {string} | Amount insurance covers for 90 day supply of drug at a in-network mail order pharmacy (average insurance negotiated rate with pharmacy) |
