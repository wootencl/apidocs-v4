## Benefits Enrollment
> Example benefits enrollment request to enroll a subscriber in benefits (Health, Dental, Vision)

```shell
{
    "action": "Change", 
    "client_id": "x12parse", 
    "correlation_id": "x12parse-correlation-id", 
    "deleted": false, 
    "dependents": [], 
    "insert_dt": "2015-01-01", 
    "master_policy_number": "ABCD012354", 
    "payer": {
        "tax_id": "654456654"
    }, 
    "purpose": "Original", 
    "reference_number": "12456", 
    "sponsor": {
        "tax_id": "999888777"
    }, 
    "subscriber": {
        "address": {
            "city": "CAMP HILL", 
            "county": "CUMBERLAND", 
            "line": "100 MARKET ST", 
            "line2": "APT 3G", 
            "postal_code": "17011", 
            "state": "PA"
        }, 
        "benefit_status": "Active", 
        "benefits": [
            {
                "begin_date": " 2015-01-01", 
                "benefit_type": "Health", 
                "coordination_of_benefits": [
                    {
                        "group_or_policy_number": "890111", 
                        "payer_responsibility": "Primary", 
                        "status": "Unknown"
                    }
                ], 
                "late_enrollment": false, 
                "maintenance_type": "Addition"
            }, 
            {
                "begin_date": "2015-01-01", 
                "benefit_type": "Dental", 
                "late_enrollment": false, 
                "maintenance_type": "Addition"
            }, 
            {
                "begin_date": "2015-01-01", 
                "benefit_type": "Vision", 
                "late_enrollment": false, 
                "maintenance_type": "Addition"
            }
        ], 
        "birth_date": "1940-01-01", 
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
        "first_name": "JOHN", 
        "gender": "Male", 
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
    "update_dt": "2015-01-01",
    "version": "4.0.0",
    "major_version": "4"
}
```

*Available modes of operation: batch/async only*

The PokitDok Enrollment API eases the transmission process of benefit enrollment and maintenance files. Applications can use the Enrollment endpoint to submit new enrollments or enrollment changes due to life events and plan termination. These files are submitted asynchronously via batch mode.

File transmission is performed depending on carrier and group requirements. The Enrollment API can be utilized for all enrollment requirements including open enrollment and is able to support both full and change files.

Available Enrollment Endpoints:

Endpoint | HTTP Method | Description
-------- | ----------- | -----------
/enrollment/ | POST | Submit a benefits enrollment request to the specified trading partner

The Enrollment endpoint accepts the following parameters:

Argument | Description
-------- | -----------
dependents | A list of dependents covered under benefits by the subscriber. Each dependent list item may utilize the same request fields as a subscriber.
master_policy_number | The master policy number for the sponsor.
reference.number |The reference number for this transaction.  
sponsor | The employer/sponsor of the benefits.
sponsor.name | The name of the sponsor.
sponsor.tax_id | The tax id of the sponsor.
subscriber | The subscriber/employee of the benefits.
subscriber_number | If applicable the number for the subscriber. 
subscriber.address | The address for the subscriber.
subscriber.address.city | The city for the subscriber.
subscriber.address.county | The county for the subscriber.
subscriber.address.line | The first address line for the subscriber.
subscriber.address.line2 | The second address line for the subscriber. (Optional)
subscriber.address.postal_code | The postal/zip code for the subscriber.
subscriber.benefits | The list of benefits for the subscriber.
subscriber.benefits.begin_date | The date benefits start for this list item.
subscriber.benefits.benefit_type | The type of benefit. (Health, Dental, Vision, etc.)
subscriber.benefits.end_date | The date benefits end for this list item.
subscriber.benefits.late_enrollment | Is the benefit enrolling late? True or False.
subscriber.benefits.maintenance_type | The type of benefit maintenance. (Addition, Cancellation or Termination, Delete, Reinstatement, etc)
subscriber.birth_date | The date of birth for the subscriber.
subscriber.eligibility_begin_date | The date benefits become eligible for the subscriber.
subscriber.employment_status | The employment status for the subscriber. (Full-time, Executive, Hourly, etc.)
subscriber.first_name | The first name for the subscriber.
subscriber.gender | The gender for the subscriber.
subscriber.benefits.group_or_policy_number | The group or policy number for this list item.
subscriber.handicapped | Is the subscriber handicapped? True or False.
subscriber.last_name | The last name for the subscriber.
subscriber.late_enrollment | Is the subscriber a late enrollee? True or False.
subscriber.member_id | The member id for the subscriber if already enrolled in benefits.
subscriber.middle_name | The middle name for the subscriber.
subscriber.primary_communication_number | The primary communication number for the subscriber. 
subscriber.primary_communication_type | The type of primary communication above. 
subscriber.secondary_communication_number | The primary communication number for the subscriber. 
subscriber.secondary_communication_type | The type of primary communication above. 
subscriber.ssn | The social security number for the subscriber.
subscriber.substance_abuse | Does the subscriber have a problem with substance abuse? True or False.
subscriber.suffix | The suffix for the subscriber. (Optional)
subscriber.tobacco_use | Does the subscriber use tobacco? True or False.
trading_partner_id | Unique id for the intended trading partner, as specified by the Trading Partners endpoint.

Responses to enrollment files can vary greatly from carrier to carrier. PokitDok will work with the carrier trading partner to provide confirmation of successful delivery and communicate any reports back to the client.
