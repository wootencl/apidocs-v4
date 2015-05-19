## Benefits Enrollment
> Example benefits enrollment request to enroll a subscriber in benefits (Health, Dental, Vision)

```shell
{
    "action": "Change",
    "dependents": [],
    "payer": {
        "tax_id": "111222333"
    },
    "purpose": "Original",
    "reference_number": "12456",
    "sponsor": {
        "name": "Acme, Inc.",
        "tax_id": "999888777"
    },
    "subscriber": {
        "address": {
            "city": "SAN MATEO",
            "county": "SAN MATEO",
            "line": "123 Main Street",
            "line2": "APT 1",
            "postal_code": "94403",
            "state": "CA"
        },
        "benefit_status": "Active",
        "benefits": [
            {
                "begin_date": "2014-01-01",
                "benefit_type": "Health",
                "coverage_level": "Employee Only",
                "late_enrollment": false,
                "maintenance_type": "Addition"
            },
            {
                "begin_date": "2014-01-01",
                "benefit_type": "Dental",
                "late_enrollment": false,
                "maintenance_type": "Addition"
            },
            {
                "begin_date": "2014-01-01",
                "benefit_type": "Vision",
                "late_enrollment": false,
                "maintenance_type": "Addition"
            }
        ],
        "birth_date": "1970-01-01",
        "contacts": [
            {
                "communication_number2": "7172341240",
                "communication_type2": "Work Phone Number",
                "primary_communication_number": "7172343334",
                "primary_communication_type": "Home Phone Number"
            }
        ],
        "eligibility_begin_date": "2014-01-01",
        "employment_status": "Full-time",
        "first_name": "JANE",
        "gender": "Female",
        "group_or_policy_number": "123456001",
        "handicapped": false,
        "last_name": "DOE",
        "maintenance_reason": "Active",
        "maintenance_type": "Addition",
        "member_id": "123456789",
        "middle_name": "P",
        "relationship": "Self",
        "ssn": "123456789",
        "subscriber_number": "123456789",
        "substance_abuse": false,
        "tobacco_use": false
    },
    "trading_partner_id": "MOCKPAYER",
}
```

*Available modes of operation: batch/async only*

The PokitDok enrollment API eases the transmission process of benefit enrollment and maintenance files. Applications can use the enrollment endpoint to submit new enrollments or enrollment changes due to life events and plan termination. These files are submitted asynchronously via batch mode.

File transmission is performed depending on carrier and group requirements. The enrollment API can be utilized for all enrollment requirements including open enrollment and is able to support both full and change files.

Responses to enrollment files can vary greatly from carrier to carrier. PokitDok will work with the carrier trading partner to provide confirmation of successful delivery and communicate any reports back to the client.

Available Enrollment Endpoints:

Endpoint | HTTP Method | Description
-------- | ----------- | -----------
/enrollment/ | POST | Submit a benefits enrollment request to the specified trading partner

The enrollment endpoint accepts the following parameters:

Argument | Description
-------- | -----------
dependents | A list of dependents covered under benefits by the subscriber. Each dependent list item may utilize the same request fields as a subscriber
sponsor | The employer/sponsor of the benefits
sponsor.name | The name of the sponsor
sponsor.tax_id | The tax id of the sponsor
subscriber | The subscriber/employee of the benefits
subscriber.address | The address for the subscriber
subscriber.address.line | The first address line for the subscriber
subscriber.address.line2 | The second address line for the subscriber (optional)
subscriber.address.city | The city for the subscriber
subscriber.address.postal_code | The postal/zip code for the subscriber
subscriber.address.county | The county for the subscriber
subscriber.benefits | The list of benefits for the subscriber
subscriber.benefits.begin_date | The date benefits start for this list item
subscriber.benefits.begin_date | The date benefits start for this list item
subscriber.benefits.benefit_type | The type of benefit (Health, Dental, Vision, etc.)
subscriber.benefits.late_enrollment | Is the benefit enrolling late? true or false
subscriber.benefits.maintenance_type | The type of benefit maintenance (Addition, Cancellation or Termination, Delete, Reinstatement, etc)
subscriber.birth_date | The date of birth for the subscriber
subscriber.eligibility_begin_date | The date benefits become eligible for the subscriber
subscriber.employment_status | The employment status for the subscriber (Full-time, Executive, Hourly, etc.)
subscriber.first_name | The first name for the subscriber
subscriber.gender | The gender for the subscriber
subscriber.member_id | The member id for the subscriber if already enrolled in benefits
subscriber.middle_name | The middle name for the subscriber
subscriber.last_name | The last name for the subscriber
subscriber.substance_abuse | Does the subscriber have a problem with substance abuse? true or false
subscriber.suffix | The suffix for the subscriber (optional)
subscriber.ssn | The social security number for the subscriber
subscriber.tobacco_use | Does the subscriber use tobacco? true or false
trading_partner_id | Unique id for the intended trading partner, as specified by the Trading Partners endpoint.
