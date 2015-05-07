# Eligibility

The eligibility resource makes it easy to verify a member's insurance information in real-time. You can check 
co-insurance, copay, deductible and out of pocket amounts for a member along with other information about a member's 
plan.

Use the [tradingpartners](#trading-partners) API to determine available trading_partner_id values for use with the 
eligibility API.

Available Eligibility Endpoints:

Endpoint | HTTP Method | Description
-------- | ----------- | -----------
/eligibility/ | POST | Determine eligibility via an EDI 270 Request For Eligibility

All eligibility requests must include a valid Provider NPI. Some trading partners require that the submitting provider’s 
NPI be registered or be a participating provider with that health plan to successfully check eligibility. 
When a request is made without a provider name and NPI, the PokitDok NPI and organization name will default in. It is 
important to note that the PokitDok NPI may not be accepted by all trading partners.

The PokitDok eligibility endpoint allows you to request eligibility for specific service types. The service_type argument 
allows you to specify which particular service(s) you want to check eligibility for. If no service type is specified, the
request will be made for general health benefits (health_benefit_plan_coverage). Please note that some trading partners may
not support specific service type inquiries. A full listing of possible service_types values is included below.
You can also request eligibility information for a specific CPT code, however not all trading partners support such requests.

The /eligibility/ endpoint accepts the following parameters:

Argument | Description
-------- | -----------
cpt_code | The CPT code that should be used to request specific eligibility information. Note: requests based on CPT code are not supported by all trading partners.
member.birth_date | The named insured’s birth date as specified on their policy. May be omitted if member.id is provided.
member.first_name | The named insured’s first name as specified on their policy
member.id | The named insured’s member identifier. May be omitted if member.birth_date is provided.
member.last_name | The named insured’s last name as specified on their policy
provider.first_name | The provider’s first name when the provider is an individual
provider.last_name | The provider’s last name when the provider is an individual
provider.npi | The NPI for the provider.
provider.organization_name | The provider’s name when the provider is an organization. first_name and last_name should be omitted when sending organization_name
service_types | The service type(s) the eligibility request is being made against. A full listing of possible service_types values is included below.
trading_partner_id | Unique id for the intended trading partner, as specified by the Trading Partners resource

> Example eligibility request to determine general health benefit coverage

```shell
{
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
}
```
                    
> Example eligibility request when operating on behalf of a member and a specific provider is not yet known

```shell
{
    "member": {
        "birth_date": "1970-01-01",
        "first_name": "Jane",
        "last_name": "Doe",
        "id": "W000000000"
    },
    "trading_partner_id": "MOCKPAYER"
}
```
                    
> Some trading partners support eligibility requests using a CPT code. Here's an example using a CPT code to request eligibility information

```shell
{
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
}
```
                    
> Example eligibility request using custom application data for easy handling of asynchronous responses

```shell
{
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
}
```
                    
> example submitting an eligibility request:

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
    "service_types": ["health_benefit_plan_coverage"],
    "trading_partner_id": "MOCKPAYER"
}
' https://platform.pokitdok.com/api/v4/eligibility/
```
                    

Eligibility and benefit responses vary depending on the trading partner and the plan a member is enrolled in. Some plans 
may not provide deductible/out-of-pocket, copayment/coinsurance or other specific plan information. PokitDok will provide 
all the information provided by the trading partner in the eligibility response.

The /eligibility/ response contains the following fields:

Field | Description
----- | -----------
coverage.active | A boolean value that is true when the member has active coverage. It is false when membership information could not be returned or when inactive coverage is indicated by the trading partner.
coverage.coinsurance | List of co-insurance information for the member
coverage.coinsurance.benefit_percent | A percentage that represents the patient's portion of the responsibility for a benefit. (e.g. 0.2 when the patient's portion of the responsibility is 20% )
coverage.coinsurance.coverage_level | The coverage level that applies to this co-insurance information. Possible values include: employee_only, employee_and_spouse, employee_and_children, family, individual.
coverage.coinsurance.in_plan_network | Indicates whether or not the co-insurance information applies to in or out of network providers. If the co-insurance information is not dependent upon network status, not_applicable may be returned to indicate the value is the same for in and out of network providers.
coverage.coinsurance.service_types | A list of service types that apply to this co-insurance information. A full list of possible values is included below.
coverage.limitations.benefit_amount | Monetary amount for the benefit limitation.
coverage.limitations.coverage_level | The coverage level that applies to this limitation.  This can be at family or individual levels.
coverage.limitations.in_plan_network | Indicates whether or not the limitation applies to in or out of network providers. If the limitation is not dependent upon network status, not_applicable may be returned to indicate the value is the same for in and out of network providers.
coverage.limitations.service_types | A list of service types that apply to this limitation. A full list of possible values is included below.
coverage.limitations.delivery | Specifies the delivery pattern of the health care services with limitations.
coverage.limitations.delivery.quantity | The quantity of services being requested that have limitations.
coverage.limitations.delivery.quantity_qualifier | The qualifier used to indicate the quantity type (e.g. visits, month, hours, units, days) for services that have limitations
coverage.contacts | List of contacts related to the member's coverage. This may include contact information for the payer as well as vendors or third party administrators.
coverage.contacts.name | The name of this contact.
coverage.contacts.id | The primary identifier for this contact.
coverage.contacts.email | email address that may be used for this contact.
coverage.contacts.phone | phone number for this contact.
coverage.contacts.url | URL for this contact. This is typically a link to the contact's web site.
coverage.contacts.contact_type | The type of entity related to this contact information. Possible values include: vendor, third_party_administrator, plan_sponsor, payer, primary_payer, secondary_payer, tertiary_payer, utilization_management_organization
coverage.contacts.service_types | A list of service types that apply to this contact information. A full list of possible values is included below.
coverage.copay | List of co-payment information for the member
coverage.copay.copayment | Monetary amount for this copay item. (e.g. 15 for a $15 co-pay)
coverage.copay.coverage_level | The coverage level that applies to this co-pay information. Possible values include: employee_only, employee_and_spouse, employee_and_children, family, individual.
coverage.copay.in_plan_network | Indicates whether or not the copay information applies to in or out of network providers. If the copay information is not dependent upon network status, not_applicable may be returned to indicate the value is the same for in and out of network providers.
coverage.copay.service_types | A list of service types that apply to this co-pay information. A full list of possible values is included below.
coverage.copay.delivery | Specifies the delivery pattern of the health care services that have a co-pay.
coverage.copay.delivery.quantity | The quantity of services being requested that have a co-pay.
coverage.copay.delivery.quantity_qualifier | The qualifier used to indicate the quantity type (e.g. visits, month, hours, units, days) for services that have a co-pay.
coverage.deductibles | List of deductible information for the member
coverage.deductibles.benefit_amount | Monetary amount for this deductible item. For calendar year deductible information, this will be the deductible for the calendar year for the associated coverage level and in/out of plan network indicator. (e.g. $7000.00 for in network, family coverage).
coverage.deductibles.coverage_level | The coverage level that applies to this deductible information. When a family (or more than one person) is covered, you'll see deductible information for the family as well as the individual that was referenced in the eligibility request.
coverage.deductibles.in_plan_network | Indicates whether or not the deductible information applies to in or out of network providers. If the deductible information is not dependent upon network status, not_applicable may be returned to indicate the value is the same for in and out of network providers.
coverage.deductibles.time_period | The period of time for which this deductible item applies. Possible values include: calendar_year and remaining. remaining indicates the amount that remains in the calendar year for the member to reach their deductible. calendar_year indicates that the amount represents the total deductible amount for the current year. When no time period applies to deductible information, time_period will not be included for that deductible in the response.
coverage.deductibles.service_types | A list of service types that apply to this deductible information. A full list of possible values is included below.
coverage.other_payers | A list of other payers that provide coverage for the member. This list of payers is primarily used to communicate information related to the coordination of benefits.
coverage.other_payers.coordination_of_benefits | The role of this payer in the coordination of benefits. Possible values include: primary_payer, secondary_payer, tertiary_payer
coverage.other_payers.coordination_of_benefits_date | The date when this payer started participating in the coordination of benefits.
coverage.other_payers.coverage_level | The coverage level for this plan. Possible values include: employee_only, employee_and_spouse, employee_and_children, family, individual
coverage.other_payers.id | The unique id used for this payer.
coverage.other_payers.name | The name of this payer. (e.g. MEDICARE)
coverage.other_payers.subscriber | The subscriber information associated with this payer.
coverage.other_payers.subscriber.id | The id for the subscriber in this payer's system.
coverage.other_payers.subscriber.first_name | The subscriber's first name
coverage.other_payers.subscriber.middle_name | The subscriber's middle name
coverage.other_payers.subscriber.last_name | The subscriber's last name
coverage.other_payers.service_types | A list of service types that apply to this payer information. A full list of possible values is included below.
coverage.out_of_pocket | List of out of pocket (stop loss) information for the member
coverage.out_of_pocket.benefit_amount | Monetary amount for this out of pocket item. For calendar year out of pocket information, this will be the out of pocket amount for the calendar year for the associated coverage level and in/out of plan network indicator. (e.g. $12600.00 for in network, family coverage)
coverage.out_of_pocket.coverage_level | The coverage level that applies to this out of pocket information. When a family (or more than one person) is covered, you'll see out of pocket information for the family as well as the individual that was referenced in the eligibility request.
coverage.out_of_pocket.in_plan_network | Indicates whether or not the out of pocket information applies to in or out of network providers. If the out of pocket information is not dependent upon network status, not_applicable may be returned to indicate the value is the same for in and out of network providers.
coverage.out_of_pocket.time_period | The period of time for which this out of pocket item applies. Possible values include: calendar_year and remaining. remaining indicates the amount that remains in the calendar year for the member to reach their out of pocket amount. calendar_year indicates that the amount represents the total out of pocket amount for the current year. When no time period applies to deductible information, time_period will not be included for that out of pocket item in the response.
coverage.out_of_pocket.service_types | A list of service types that apply to this out of pocket information. A full list of possible values is included below.
coverage.eligibility_begin_date | The date eligibility started for the member's plan.
coverage.group_description | Group description for the member specified in the eligibility request
coverage.group_number | Group number for the member specified in the eligibility request
coverage.insurance_type | The type of insurance coverage. Possible values include: hmo, ppo, pos, cobra, commercial, medicaid, medicare_part_a, medicare_part_b, other
coverage.level | The coverage level the member has for their plan. Possible values include: employee_only, employee_and_spouse, employee_and_children, family, individual
coverage.plan_begin_date | The date that plan coverage started for the member specified in the eligibility request
coverage.plan_end_date | The date that plan coverage ends for the member specified in the eligibility request
coverage.plan_description | The product name or special program name for the insurance plan. This is often the brand or marketing name for the plan.
coverage.plan_number | Plan ID/number for the member specified in the eligibility request
coverage.service_date | The date the eligibility request was processed
follow_up_action | When an eligibility request is rejected, a follow up action will be provided to inform your application how to proceed. Possible values include: correct_and_resubmit, resubmit_original, resubmission_not_allowed
payer.id | Payer ID returned by the trading partner for the eligibility request.
payer.name | Payer name returned by the trading partner for the eligibility request.
provider.npi | The NPI for the provider.
provider.first_name | The provider’s first name when the provider is an individual
provider.last_name | The provider’s last name when the provider is an individual
provider.organization_name | The provider’s name when the provider is an organization. first_name and last_name should be omitted when sending organization_name
reject_reason | When a trading partner is unable to provide eligibility information for an eligibility request, they will provide a reject reason. A full list of reasons and their description is included below.
subscriber.address | The subscriber's address information
subscriber.address.address_lines | The subscriber’s street address information as specified on their policy. (e.g. ["123 N MAIN ST"])
subscriber.address.city | The subscriber's city (e.g. "SAN MATEO")
subscriber.address.state | The subscriber's state (e.g. "CA")
subscriber.address.zipcode | The subscriber's zipcode (e.g. "94401")
subscriber.id | The subscriber's member identifier
subscriber.first_name | The subscriber’s first name as specified on their policy
subscriber.last_name | The subscriber’s last name as specified on their policy
subscriber.birth_date | The subscriber’s birth date as specified on their policy
subscriber.gender | The subscriber’s gender as specified on their policy. Possible values include: 'female', 'male', and 'unknown'. 'unknown' will be returned when gender is not specified in the trading partner's eligibility data or when the trading partner explicitly returns a value of 'unknown'
trading_partner_id | Unique id for the trading partner used to process the request
valid_request | A boolean value used to indicate that a trading partner considered the eligibility request valid and returned a full eligibility response. If valid_request is false, it means the trading partner was unable to respond to the request. Check the fields reject_reason and follow_up_action for more information on how to proceed when valid_request is false.

> Example eligibility response when the trading partner is unable to respond at this time

```shell
{
    "coverage": {
        "service_date": "2014-06-26"
    },
    "follow_up_action": "resubmit_original",
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
                    
> Example eligibility response when the trading partner is unable to find the member specified in the eligibility request

```shell
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
                    
> Example eligibility response when the trading partner is able to find a member based on the eligibility request but the specified birth date does not match their records

```shell
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
                    
> Example eligibility response when the trading partner cannot process eligibility requests using CPT code

```shell
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
                    
> Sample eligibility response for a successfully executed eligibility request

```shell
{
    "coverage": {
        "coinsurance": [
            {
                "benefit_percent": 0.0,
                "coverage_level": "employee_and_spouse",
                "in_plan_network": "yes",
                "messages": [],
                "service_types": [
                    "professional_physician_visit_office"
                ]
            },
            {
                "benefit_percent": 0.5,
                "coverage_level": "employee_and_spouse",
                "in_plan_network": "no",
                "messages": [],
                "service_types": [
                    "professional_physician_visit_office"
                ]
            }
        ],
        "copay": [
            {
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

Full list of possible reject_reasons on the eligibility response with description:
reject_reason | Description
------------- | -----------
invalid_provider_id | submitting provider (NPI) is not valid, please submit with a valid NPI
provider_not_on_file | submitting provider (NPI) is not valid, please submit with a valid NPI
invalid_subscriber_id | subscriber id not found
dob_mismatch | birth date does not match member found
invalid_subscriber_insured_name | member not found
subscriber_insured_not_found | member id/name not found
invalid_subscriber_insured_id | member id not valid
invalid_subscriber_insured_name | member not found
unable_to_respond_now | trading partner is experiencing downtime and not able to complete request
                    
> Full listing of possible service type values that may be used in an eligibility request or returned in an eligibility response

```shell
{
    "service_types": [
        "abortion",
        "acupuncture",
        "adjunctive_dental_services",
        "aids",
        "air_transportation",
        "alcoholism",
        "allergy",
        "allergy_testing",
        "alternate_method_dialysis",
        "ambulatory_service_facility",
        "anesthesia",
        "anesthesiologist",
        "audiology_exam",
        "blood_charges",
        "brand_name_prescription_drug",
        "brand_name_prescription_drug_formulary",
        "brand_name_prescription_drug_non_formulary",
        "burn_care",
        "cabulance",
        "cancer",
        "cardiac",
        "cardiac_rehabilitation",
        "case_management",
        "chemotherapy",
        "chiropractic",
        "chiropractic_office_visits",
        "chronic_renal_disease_equipment",
        "cognitive_therapy",
        "consultation",
        "coronary_care",
        "day_care_psychiatric",
        "dental_accident",
        "dental_care",
        "dental_crowns",
        "dermatology",
        "diabetic_supplies",
        "diagnostic_dental",
        "diagnostic_lab",
        "diagnostic_medical",
        "diagnostic_x_ray",
        "dialysis",
        "donor_procedures",
        "drug_addiction",
        "emergency_services",
        "endocrine",
        "endodontics",
        "experimental_drug_therapy",
        "eye",
        "eyewear_and_accessories",
        "family_planning",
        "flu_vaccination",
        "frames",
        "free_standing_prescription_drug",
        "gastrointestinal",
        "general_benefits",
        "generic_prescription_drug",
        "generic_prescription_drug_formulary",
        "generic_prescription_drug_non_formulary",
        "gynecological",
        "health_benefit_plan_coverage",
        "home_health_care",
        "home_health_prescriptions",
        "home_health_visits",
        "hospice",
        "hospital",
        "hospital_ambulatory_surgical",
        "hospital_emergency_accident",
        "hospital_emergency_medical",
        "hospital_inpatient",
        "hospital_outpatient",
        "hospital_room_and_board",
        "immunizations",
        "in_vitro_fertilization",
        "independent_medical_evaluation",
        "infertility",
        "inhalation_therapy",
        "intensive_care",
        "invasive_procedures",
        "lenses",
        "licensed_ambulance",
        "long_term_care",
        "lymphatic",
        "mail_order_prescription_drug",
        "mail_order_prescription_drug_brand_name",
        "mail_order_prescription_drug_generic",
        "major_medical",
        "mammogram_high_risk_patient",
        "mammogram_low_risk_patient",
        "massage_therapy",
        "maternity",
        "maxillofacial_prosthetics",
        "medical_care",
        "medical_equipment",
        "medical_equipment_purchase",
        "medical_equipment_rental",
        "medically_related_transportation",
        "mental_health",
        "mental_health_facility_inpatient",
        "mental_health_facility_outpatient",
        "mental_health_provider_inpatient",
        "mental_health_provider_outpatient",
        "mri_cat_scan",
        "neonatal_intensive_care",
        "neurology",
        "newborn_care",
        "nonmedically_necessary_physical",
        "nursery",
        "obstetrical",
        "obstetrical_gynecological",
        "occupational_therapy",
        "oncology",
        "oral_surgery",
        "orthodontics",
        "orthopedic",
        "other_medical",
        "otological_exam",
        "partial_hospitalization_psychiatric",
        "pathology",
        "pediatric",
        "periodontics",
        "pharmacy",
        "physical_medicine",
        "physical_therapy",
        "physician_visit_office_sick",
        "physician_visit_office_well",
        "plan_waiting_period",
        "pneumonia_vaccine",
        "podiatry",
        "podiatry_nursing_home_visits",
        "podiatry_office_visits",
        "pre_admission_testing",
        "private_duty_nursing",
        "private_duty_nursing_home",
        "private_duty_nursing_inpatient",
        "professional_physician",
        "professional_physician_visit_home",
        "professional_physician_visit_inpatient",
        "professional_physician_visit_nursing_home",
        "professional_physician_visit_office",
        "professional_physician_visit_outpatient",
        "professional_physician_visit_skilled_nursing_facility",
        "prosthetic_device",
        "prosthodontics",
        "psychiatric",
        "psychiatric_inpatient",
        "psychiatric_outpatient",
        "psychiatric_room_and_board",
        "psychotherapy",
        "pulmonary",
        "pulmonary_rehabilitation",
        "radiation_therapy",
        "rehabilitation",
        "rehabilitation_inpatient",
        "rehabilitation_outpatient",
        "rehabilitation_room_and_board",
        "renal",
        "renal_supplies_in_the_home",
        "residential_psychiatric_treatment",
        "respite_care",
        "restorative",
        "routine_exam",
        "routine_physical",
        "routine_preventive_dental",
        "screening_laboratory",
        "screening_x_ray",
        "second_surgical_opinion",
        "skilled_nursing_care",
        "skilled_nursing_care_room_and_board",
        "skin",
        "smoking_cessation",
        "social_work",
        "speech_therapy",
        "substance_abuse",
        "substance_abuse_facility_inpatient",
        "substance_abuse_facility_outpatient",
        "surgical",
        "surgical_assistance",
        "surgical_benefits_facility",
        "surgical_benefits_professional_physician",
        "third_surgical_opinion",
        "transitional_care",
        "transitional_nursery_care",
        "transplants",
        "urgent_care",
        "used_medical_equipment",
        "vision_optometry",
        "well_baby_care"
    ]
}
```
