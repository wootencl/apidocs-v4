## Authorizations
>Here's an example authorizations request for an abdominal ultrasound. In this example, the patient is also the subscriber on the insurance policy

```shell
{
    "event": {
        "category": "health_services_review",
        "certification_type": "initial",
        "delivery": {
            "quantity": 1,
            "quantity_qualifier": "visits"
        },
        "diagnoses": [
            {
                "code": "789.00",
                "date": "2014-10-01"
            }
        ],
        "place_of_service": "office",
        "provider": {
            "organization_name": "KELLY ULTRASOUND CENTER, LLC",
            "npi": "1760779011",
            "phone": "8642341234"
        },
        "services": [
            {
                "cpt_code": "76700",
                "measurement": "unit",
                "quantity": 1
            }
        ],
        "type": "diagnostic_medical"
    },
    "patient": {
        "birth_date": "1970-01-01",
        "first_name": "JANE",
        "last_name": "DOE",
        "id": "1234567890"
    },
    "provider": {
        "first_name": "JEROME",
        "npi": "1467560003",
        "last_name": "AYA-AY"
    },
    "trading_partner_id": "MOCKPAYER"
}
```

*Available modes of operation: batch/async or real-time*

The Authorizations endpoint allows an application to submit a request for the review of health care in order to obtain 
an authorization for that health care.

Endpoint | HTTP Method | Description
-------- | ----------- | -----------
/authorizations/ | POST | Submit a request for the review of health care in order to obtain an authorization for that health care

The /authorizations/ endpoint accepts the following parameters:

Argument | Description
-------- | -----------
event | The patient event that is being submitted for review
event.category | The category of the event being submitted for review.
event.certification_type | The type of certification being requested. For new authorization requests, a certification value of "initial" should be used.
event.delivery | Specifies the delivery pattern of the health care services
event.delivery.quantity | The quantity of services being requested
event.delivery.quantity_qualifier | The qualifier used to indicate the quantity type (e.g. visits, month, hours, units, days)
event.diagnoses | An array of diagnosis information related to the event
event.diagnoses.code | The diagnosis code (e.g. 789.00)
event.diagnoses.date | The date of the diagnosis
event.place_of_service | The location where health care services are rendered
event.provider | Information about the provider being requested for this event
event.provider.first_name | The event provider’s first name when the provider is an individual
event.provider.last_name | The event provider’s last name when the provider is an individual
event.provider.npi | The NPI for the event provider.
event.provider.organization_name | The event provider’s name when the provider is an organization. first_name and last_name should be omitted when sending organization_name
event.type | The type of service being requested. For example, a value of "diagnostic_medical" would be used when an abdominal ultrasound for a patient.
patient.birth_date | The patient’s birth date as specified on their policy
patient.id | The patient’s member identifier
patient.first_name | The patient’s first name as specified on their policy
patient.last_name | The patient’s last name as specified on their policy
provider.first_name | The requesting provider’s first name when the provider is an individual
provider.last_name | The requesting provider’s last name when the provider is an individual
provider.npi | The NPI for the requesting provider.
provider.organization_name | The requesting provider’s name when the provider is an organization. first_name and last_name should be omitted when sending organization_name
subscriber.birth_date | Optional: The subscriber’s birth date as specified on their policy. Specify when the patient is not the subscriber on the insurance policy.
subscriber.first_name | Optional: The subscriber’s first name as specified on their policy. Specify when the patient is not the subscriber on the insurance policy.
subscriber.id | Optional: The subscriber’s member identifier. Specify when the patient is not the subscriber on the insurance policy.
subscriber.last_name | Optional: The subscriber’s last name as specified on their policy. Specify when the patient is not the subscriber on the insurance policy.
trading_partner_id | Unique id for the intended trading partner, as specified by the Trading Partners endpoint.

> Example authorizations response when the trading partner has authorized the request

```shell
{
    "event": {
        "category": "health_services_review",
        "certification_type": "initial",
        "delivery": {
            "quantity": 1,
            "quantity_qualifier": "visits"
        },
        "diagnoses": [
            {
                "code": "789.00",
                "date": "2014-10-01"
            }
        ],
        "place_of_service": "office",
        "provider": {
            "organization_name": "KELLY ULTRASOUND CENTER, LLC",
            "npi": "1760779011",
            "phone": "8642341234"
        },
        "review": {
            "certification_action": "certified_in_total",
            "certification_number": "AUTH0002"
        },
        "services": [
            {
                "cpt_code": "76700",
                "measurement": "unit",
                "quantity": 1
            }
        ],
        "type": "diagnostic_medical"
    },
    "patient": {
        "birth_date": "1970-01-01",
        "first_name": "JANE",
        "last_name": "DOE",
        "id": "1234567890"
    },
    "provider": {
        "first_name": "JEROME",
        "npi": "1467560003",
        "last_name": "AYA-AY"
    },
    "trading_partner_id": "MOCKPAYER"
}
```

> example submitting an authorization request

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" -H "Content-Type: application/json" -XPOST -d '{
    "event": {
        "category": "health_services_review",
        "certification_type": "initial",
        "delivery": {
            "quantity": 1,
            "quantity_qualifier": "visits"
        },
        "diagnoses": [
            {
                "code": "789.00",
                "date": "2014-10-01"
            }
        ],
        "place_of_service": "office",
        "provider": {
            "organization_name": "KELLY ULTRASOUND CENTER, LLC",
            "npi": "1760779011",
            "phone": "8642341234"
        },
        "services": [
            {
                "cpt_code": "76700",
                "measurement": "unit",
                "quantity": 1
            }
        ],
        "type": "diagnostic_medical"
    },
    "patient": {
        "birth_date": "1970-01-01",
        "first_name": "JANE",
        "last_name": "DOE",
        "id": "1234567890"
    },
    "provider": {
        "first_name": "JEROME",
        "npi": "1467560003",
        "last_name": "AYA-AY"
    },
    "trading_partner_id": "MOCKPAYER"
}
' https://platform.pokitdok.com/api/v4/authorizations/
```

The /authorizations/ response contains the following fields:

Field | Description
----- | -----------
event | The patient event that is being submitted for approval
event.category | The category of the event being submitted for review.
event.certification_type | The type of certification being requested.
event.delivery | Specifies the delivery pattern of the health care services
event.delivery.quantity | The quantity of services being requested
event.delivery.quantity_qualifier | The qualifier used to indicate the quantity type (e.g. visits, month, hours, units, days)
event.diagnoses | An array of diagnosis information related to the event
event.diagnoses.code | The diagnosis code (e.g. 789.00)
event.diagnoses.date | The date of the diagnosis
event.place_of_service | The location where health care services are rendered
event.provider | Information about the provider being requested for this event
event.provider.first_name | The event provider’s first name when the provider is an individual
event.provider.last_name | The event provider’s last name when the provider is an individual
event.provider.npi | The NPI for the event provider.
event.provider.organization_name | The event provider’s name when the provider is an organization. first_name and last_name should be omitted when sending organization_name
event.review | Information about the outcome of a health care services review
event.review.certification_action | Indicates the outcome of the review. For example, "certified_in_total" will be returned when the event is certified/authorized.
event.review.certification_number | The review certification/reference number
event.review.decision_reason | If the event is not authorized, the reason for that decision.
event.type | The type of service being requested.
patient.birth_date | The patient’s birth date as specified on their policy
patient.id | The patient’s member identifier
patient.first_name | The patient’s first name as specified on their policy
patient.last_name | The patient’s last name as specified on their policy
provider.first_name | The requesting provider’s first name when the provider is an individual
provider.last_name | The requesting provider’s last name when the provider is an individual
provider.npi | The NPI for the requesting provider.
provider.organization_name | The requesting provider’s name when the provider is an organization. first_name and last_name should be omitted when sending organization_name
subscriber.birth_date | Optional: The subscriber’s birth date as specified on their policy. Specify when the patient is not the subscriber on the insurance policy.
subscriber.first_name | Optional: The subscriber’s first name as specified on their policy. Specify when the patient is not the subscriber on the insurance policy.
subscriber.id | Optional: The subscriber’s member identifier. Specify when the patient is not the subscriber on the insurance policy.
subscriber.last_name | Optional: The subscriber’s last name as specified on their policy. Specify when the patient is not the subscriber on the insurance policy.
trading_partner_id | Unique id for the intended trading partner, as specified by the Trading Partners endpoint.
