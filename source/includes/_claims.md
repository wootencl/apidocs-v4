## Claims
*Available modes of operation: batch/async*

Following the standard X12 837 format, the PokitDok claims resource allows applications to easily file claims to designated trading partners. 

When using the claims resource, there is an option to supply a callback_url, which indicates that your application should be
notified when the asynchronous processing is complete and a claim acknowledgement has been received from the trading partner.
When a callback_url is specified, the full claims request activity will be POSTed back to the callback_url. A claim
acknowledgement will be returned for each submitted claims request.

Available Claims Endpoints:

Endpoint | HTTP Method | Description
-------- | ----------- | -----------
/claims/ | POST | Submit a claim to the specified trading partner.

The /claims/ endpoint accepts the following parameters:

Parameter | Description | CMS 1500 Field
--------- | ----------- | --------------
billing_provider | Required: A dictionary of information for the provider that is billing for services. | 33: Billing Provider Info
billing_provider.address | A dictionary of information for the billing provider's address. | 
billing_provider.address.address_lines | List of strings representing the street address for a billing provider. (e.g. ["123 MAIN ST.", "Suite 4"]) | 
billing_provider.address.city | The city component of a billing provider's address. (e.g. "SAN MATEO") | 
billing_provider.address.state | The state component of a billing provider's address. (e.g. "CA") | 
billing_provider.address.zipcode | The billing provider's zip/postal code. (e.g. "94401") | 
billing_provider.first_name | The first name of the provider billing for services. Required when the billing provider is an individual. | 
billing_provider.last_name | The last name of the provider billing for services. Required when the billing provider is an individual. | 
billing_provider.organization_name | The billing provider’s name when the provider is an organization. first_name and last_name should be omitted when sending organization_name. | 
billing_provider.npi | The National Provider Identifier for the provider billing for services. | 33a: Billing Provider NPI
billing_provider.tax_id | The federal tax id for the provider billing for services. For individual providers, this may be the tax id of the medical practice or organization where a provider works. | 25: Federal tax ID Number (SSN EIN)
billing_provider.taxonomy_code | The taxonomy code for the provider billing for services. (e.g. "207Q00000X") | 24i: ID Qualifier
claim | Dictionary of information representing a claim for services that have been performed by a health care provider for the patient. | 
claim.onset_date | Optional: the date of first symptoms for the illness. | 14: Date of current illness OR injury OR pregnancy
claim.place_of_service | The location where services were performed. (e.g. "office") | 24b: Place of service
claim.patient_paid_amount | Optional: The amount the patient has already paid the provider for the services listed in the claim. When reporting cash payment encounters for the purpose of contributing those amounts toward the member's deductible, the patient_paid_amount will equal the total_charge_amount. | 29: Amount Paid
claim.patient_signature_on_file | Boolean indicator for whether or not a patient's signature is on file to authorize the release of medical records. Defaults to true if not specified. | 12: Patient's or authorized person's signature
claim.service_lines | List of services that were performed as part of this claim. | 
claim.service_lines.charge_amount | The amount charged for this specific service. (e.g. 100.00) | 24f: Charges
claim.service_lines.diagnosis_codes | A list of diagnosis codes related to this service. (e.g. 487.1) | 21: Diagnosis or nature of illness or injury
claim.service_lines.procedure_code | The CPT code for the service that was performed | 24d: Procedures, Services, or Supplies
claim.service_lines.procedure_modifier_codes | Optional: List of modifier codes for the specified procedure. (e.g. ["GT"]) | 24d: Procedures, Services, or Supplies
claim.service_lines.service_date | The date the service was performed. | 24a: Date(s) of service (from, to)
claim.service_lines.unit_count | Number of units of this service. (e.g. 1.0) | 24g: Days or Units
claim.total_charge_amount | The total amount charged/billed for the claim. (e.g. 100.00) | 28: Total Charge
patient | Information about the patient that received services outlined in the claim. Patient information is only required when the patient is not the insurance subscriber. | 
patient.address | Required: The patient’s address information. | 5: Patient's address
patient.address.address_lines | The patient’s street address information. (e.g. ["123 N MAIN ST"]) | 
patient.address.city | The patient’s city information. (e.g. "SAN MATEO") | 
patient.address.state | The patient’s state information. (e.g. "CA") | 
patient.address.zipcode | The patient’s zip/postal code. (e.g. "94401") | 
patient.birth_date | The patient’s birth date as specified on their policy. | 3: Patients Birth Date
patient.first_name | Required: The patient’s first name. | 2: Patient's Name
patient.gender | The patient’s gender. | 3: The patient's sex
patient.member_id | Required: The patient’s member identifier. | 
patient.middle_name | Optional: The patient’s middle name. | 2: Patient's Name
patient.last_name | Required: The patient’s last name. | 2: Patient's Name
patient.pregnant | Patient pregnancy indicator. Defaults to false. | 
patient.relationship | Required: The patient’s relationship to the subscriber. May be one of these values: spouse, child, employee, unknown, organ_donor, cadaver_donor, life_partner, other_relationship | 6: Patient's relationship to the insured
subscriber | Information about the insurance subscriber as it appears on their policy. | 
subscriber.address | The subscriber’s address information as specified on their policy. | 7: Insured's address
subscriber.address.address_lines | The subscriber’s street address information as specified on their policy. (e.g. ["123 N MAIN ST"]) | 
subscriber.address.city | The subscriber’s city information as specified on their policy. (e.g. "SAN MATEO") | 
subscriber.address.state | The subscriber’s state information as specified on their policy. (e.g. "CA") | 
subscriber.address.zipcode | The subscriber’s zip/postal code as specified on their policy. (e.g. "94401") | 
subscriber.birth_date | The subscriber’s birth date as specified on their policy. | 11a: Insured's date of birth
subscriber.first_name | Required: The subscriber’s first name as specified on their policy. | 4: Insured's name
subscriber.gender | The subscriber’s gender as specified on their policy. | 11a: Insured's sex
subscriber.group_name | Optional: The subscriber’s group name as specified on their policy. | 11b: Employer's name or school name
subscriber.member_id | Required: The subscriber’s member identifier. | 1a: Insured's ID number
subscriber.last_name | Required: The subscriber’s last name as specified on their policy. | 4: Insured's name
trading_partner_id | Required: Unique id for the intended trading partner, as specified by the Trading Partners resource | 
transaction_code | Required: The type of claim transaction that is being submitted. (e.g. "chargeable") | 

Though the claim endpoint will successfully POST a claim transaction to the payer, there is a lot more that goes on with the
claim till it is fully processed and paid.
For details on the flow and how [claims status](#claims-status) ties in, visit [claims API workflow](https://platform.pokitdok.com/claim-processing).

> Sample Claims Request

```shell
{
    "transaction_code": "chargeable",
    "trading_partner_id": "MOCKPAYER",
    "billing_provider": {
        "taxonomy_code": "207Q00000X",
        "first_name": "Jerome",
        "last_name": "Aya-Ay",
        "npi": "1467560003",
        "address": {
            "address_lines": [
                "8311 WARREN H ABERNATHY HWY"
            ],
            "city": "SPARTANBURG",
            "state": "SC",
            "zipcode": "29301"
        },
        "tax_id": "123456789"
    },
    "subscriber": {
        "first_name": "Jane",
        "last_name": "Doe",
        "member_id": "W000000000",
        "address": {
            "address_lines": ["123 N MAIN ST"],
            "city": "SPARTANBURG",
            "state": "SC",
            "zipcode": "29301"
        },
        "birth_date": "1970-01-01",
        "gender": "female"
    },
    "claim": {
        "total_charge_amount": 60.0,
        "service_lines": [
            {
                "procedure_code": "99213",
                "charge_amount": 60.0,
                "unit_count": 1.0,
                "diagnosis_codes": [
                    "487.1"
                ],
                "service_date": "2014-06-01"
            }
        ]
    }
}
```
                    
> Sample Claims Request that includes custom application data for easy handling of asynchronous responses:

```shell
{
    "application_data": {
        "patient_id": "ABC1234XYZ",
        "location_id": 123,
        "transaction_uuid": "93f38f1b-b2cd-4da1-8b55-c6e3ab380dbf"
    },
    "transaction_code": "chargeable",
    "trading_partner_id": "MOCKPAYER",
    "billing_provider": {
        "taxonomy_code": "207Q00000X",
        "first_name": "Jerome",
        "last_name": "Aya-Ay",
        "npi": "1467560003",
        "address": {
            "address_lines": [
                "8311 WARREN H ABERNATHY HWY"
            ],
            "city": "SPARTANBURG",
            "state": "SC",
            "zipcode": "29301"
        },
        "tax_id": "123456789"
    },
    "subscriber": {
        "first_name": "Jane",
        "last_name": "Doe",
        "member_id": "W000000000",
        "address": {
            "address_lines": ["123 N MAIN ST"],
            "city": "SPARTANBURG",
            "state": "SC",
            "zipcode": "29301"
        },
        "birth_date": "1970-01-01",
        "gender": "female"
    },
    "claim": {
        "total_charge_amount": 60.0,
        "service_lines": [
            {
                "procedure_code": "99213",
                "charge_amount": 60.0,
                "unit_count": 1.0,
                "diagnosis_codes": [
                    "487.1"
                ],
                "service_date": "2014-06-01"
            }
        ]
    }
}
```
                    
> Sample Claims Request using the patient paid amount to report a cash payment encounter for contributing toward a member's deductible.

```shell
{
    "transaction_code": "chargeable",
    "trading_partner_id": "MOCKPAYER",
    "billing_provider": {
        "taxonomy_code": "207Q00000X",
        "first_name": "JEROME",
        "last_name": "AYA-AY",
        "npi": "1467560003",
        "address": {
            "address_lines": [
                "1703 John B White Blvd, Unit A"
            ],
            "city": "SPARTANBURG",
            "state": "SC",
            "zipcode": "29301"
        },
        "tax_id": "123456789"
    },
    "subscriber": {
        "first_name": "JOHN",
        "last_name": "DOE",
        "member_id": "W199000000",
        "address": {
            "address_lines": ["123 MAIN ST"],
            "city": "SPARTANBURG",
            "state": "SC",
            "zipcode": "29301"
        },
        "birth_date": "1970-01-01",
        "gender": "male"
    },
    "claim": {
        "place_of_service": "office",
        "total_charge_amount": 150.0,
        "patient_paid_amount": 150.0,
        "service_lines": [
            {
                "procedure_code": "11100",
                "charge_amount": 150.00,
                "unit_count": 1.0,
                "diagnosis_codes": [
                    "701.9"
                ],
                "service_date": "2014-11-24"
            }
        ]
    }
}
```
                    
> Sample Claims Request when using procedure modifier codes. This example uses the "GT" modifier ("via interactive audio and video telecommunications systems") which would be suitable for telehealth applications:

```shell
{
    "transaction_code": "chargeable",
    "trading_partner_id": "MOCKPAYER",
    "billing_provider": {
        "taxonomy_code": "207Q00000X",
        "first_name": "Jerome",
        "last_name": "Aya-Ay",
        "npi": "1467560003",
        "address": {
            "address_lines": [
                "8311 WARREN H ABERNATHY HWY"
            ],
            "city": "SPARTANBURG",
            "state": "SC",
            "zipcode": "29301"
        },
        "tax_id": "123456789"
    },
    "subscriber": {
        "first_name": "Jane",
        "last_name": "Doe",
        "member_id": "W000000000",
        "address": {
            "address_lines": ["123 N MAIN ST"],
            "city": "SPARTANBURG",
            "state": "SC",
            "zipcode": "29301"
        },
        "birth_date": "1970-01-01",
        "gender": "female"
    },
    "claim": {
        "total_charge_amount": 100.0,
        "service_lines": [
            {
                "procedure_code": "99201",
                "procedure_modifier_codes": ["GT"],
                "charge_amount": 100.0,
                "unit_count": 1.0,
                "diagnosis_codes": [
                    "487.1"
                ],
                "service_date": "2014-06-01"
            }
        ]
    }
}
```
                
> curl example submitting a claim with an application's callback_url specified

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" -H "Content-Type: application/json" -XPOST -d '{
    “callback_url”: “https://yourapp.com/claims/status”,
    "transaction_code": "chargeable",
    "trading_partner_id": "MOCKPAYER",
    "billing_provider": {
        "taxonomy_code": "207Q00000X",
        "first_name": "Jerome",
        "last_name": "Aya-Ay",
        "npi": "1467560003",
        "address": {
            "address_lines": [
                "8311 WARREN H ABERNATHY HWY"
            ],
            "city": "SPARTANBURG",
            "state": "SC",
            "zipcode": "29301"
        },
        "tax_id": "123456789"
    },
    "subscriber": {
        "first_name": "Jane",
        "last_name": "Doe",
        "member_id": "W000000000",
        "address": {
            "address_lines": ["123 N MAIN ST"],
            "city": "SPARTANBURG",
            "state": "SC",
            "zipcode": "29301"
        },
        "birth_date": "1970-01-01",
        "gender": "female"
    },
    "claim": {
        "total_charge_amount": 60.0,
        "service_lines": [
            {
                "procedure_code": "99213",
                "charge_amount": 60.0,
                "unit_count": 1.0,
                "diagnosis_codes": [
                    "487.1"
                ],
                "service_date": "2014-06-01"
            }
        ]
    }
}' https://platform.pokitdok.com/api/v4/claims/
```             
