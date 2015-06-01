## Referrals
> Here's an example referral request to an Otolaryngologist (ENT) by a primary
care physician. In this example, the patient is also the subscriber on the
insurance policy.

```shell
{
    "event": {
        "category": "specialty_care_review",
        "certification_type": "initial",
        "delivery": {
            "quantity": 1,
            "quantity_qualifier": "visits"
        },
        "diagnoses": [
            {
                "code": "384.20",
                "date": "2014-09-30"
            }
        ],
        "place_of_service": "office",
        "provider": {
            "first_name": "JOHN",
            "npi": "1154387751",
            "last_name": "FOSTER",
            "phone": "8645822900"
        },
        "type": "consultation"
    },
    "patient": {
        "birth_date": "1970-01-01",
        "first_name": "JANE",
        "last_name": "DOE",
        "id": "1234567890"
    },
    "provider": {
        "first_name": "CHRISTINA",
        "last_name": "BERTOLAMI",
        "npi": "1619131232"
    },
    "trading_partner_id": "MOCKPAYER"
}
```

*Available modes of operation: batch/async or real-time*

The Referrals endpoint allows an application to request approval for a referral
to another health care provider.

Primary Care Physicians can enable their patients to receive the consult and services 
of a specialist or specialist entity. This request will be sent to the reviewing 
entity (e.g. Utilization Management Organization) for approval.

Available Referrals endpoints:

Endpoint | HTTP Method | Description
-------- | ----------- | -----------
/referrals/ | POST | Submit a specialty care referral request to a trading partner for approval

The /referrals/ endpoint accepts the following parameters:

Parameter | Description
-------- | -----------
event | The patient event that is being submitted for approval.
event.category | The category of the event being submitted for review. For referrals to specialists, a category value of "specialty_care_review" should always be used.
event.certification_type | The type of certification being requested. For new referrals, a certification value of "initial" should always be used.
event.delivery | Specifies the delivery pattern of the health care services.
event.delivery.quantity | The quantity of services being requested.
event.delivery.quantity_qualifier | The qualifier used to indicate the quantity type. (e.g. visits, month, hours, units, days)
event.diagnoses | An array of diagnosis information related to the event.
event.diagnoses.code | The diagnosis code. (e.g. 384.20)
event.diagnoses.date | The date of the diagnosis.
event.place_of_service | The location where health care services are rendered.
event.provider | Information about the provider being requested for this event.
event.provider.first_name | The event provider’s first name when the provider is an individual.
event.provider.last_name | The event provider’s last name when the provider is an individual.
event.provider.npi | The NPI for the event provider.
event.provider.organization_name | The event provider’s name when the provider is an organization. first_name and last_name should be omitted when sending organization_name.
event.type | The type of service being requested. For example, a value of consultation would be used when referring to a specialist for an initial consultation.
patient.birth_date | The patient’s birth date as specified on their policy.
patient.id | The patient’s member identifier.
patient.first_name | The patient’s first name as specified on their policy.
patient.last_name | The patient’s last name as specified on their policy.
provider.first_name | The referring provider’s first name when the provider is an individual.
provider.last_name | The referring provider’s last name when the provider is an individual.
provider.npi | The NPI for the referring provider.
provider.organization_name | The referring provider’s name when the provider is an organization. first_name and last_name should be omitted when sending organization_name.
subscriber.birth_date | Optional: The subscriber’s birth date as specified on their policy. Specify when the patient is not the subscriber.
subscriber.first_name | Optional: The subscriber’s first name as specified on their policy. Specify when the patient is not the subscriber.
subscriber.id | Optional: The subscriber’s member identifier. Specify when the patient is not the subscriber.
subscriber.last_name | Optional: The subscriber’s last name as specified on their policy. Specify when the patient is not the subscriber.
trading_partner_id | Unique id for the intended trading partner, as specified by the [Trading Partners](#trading-partners) endpoint.

If the referral request is sent using a real-time interface, a referral response will be returned.
                    
The /referrals/ response contains the following fields:
> Example referrals response when the trading partner has authorized the request

```shell
{
    "event": {
        "category": "specialty_care_review",
        "certification_type": "initial",
        "delivery": {
            "quantity": 1,
            "quantity_qualifier": "visits"
        },
        "diagnoses": [
            {
                "code": "384.20",
                "date": "2014-09-30"
            }
        ],
        "place_of_service": "office",
        "provider": {
            "first_name": "JOHN",
            "npi": "1154387751",
            "last_name": "FOSTER",
            "phone": "8645822900"
        },
        "review": {
            "certification_action": "certified_in_total",
            "certification_number": "AUTH0001"
        },
        "type": "consultation"
    },
    "patient": {
        "birth_date": "1970-01-01",
        "first_name": "JANE",
        "last_name": "DOE",
        "id": "1234567890"
    },
    "provider": {
        "first_name": "CHRISTINA",
        "last_name": "BERTOLAMI",
        "npi": "1619131232"
    },
    "trading_partner_id": "MOCKPAYER"
}
```
                    
> example submitting a referral request:

```shell
curl -i -H "Authorization: Bearer $ACCESS_TOKEN" -H "Content-Type: application/json" -XPOST -d '{
    "event": {
        "category": "specialty_care_review",
        "certification_type": "initial",
        "delivery": {
            "quantity": 1,
            "quantity_qualifier": "visits"
        },
        "diagnoses": [
            {
                "code": "384.20",
                "date": "2014-09-30"
            }
        ],
        "place_of_service": "office",
        "provider": {
            "first_name": "JOHN",
            "npi": "1154387751",
            "last_name": "FOSTER",
            "phone": "8645822900"
        },
        "type": "consultation"
    },
    "patient": {
        "birth_date": "1970-01-01",
        "first_name": "JANE",
        "last_name": "DOE",
        "id": "1234567890"
    },
    "provider": {
        "first_name": "CHRISTINA",
        "last_name": "BERTOLAMI",
        "npi": "1619131232"
    },
    "trading_partner_id": "MOCKPAYER"
}
' https://platform.pokitdok.com/api/v4/referrals/
```

Parameter | Description
----- | -----------
event | The patient event that is being submitted for approval.
event.category | The category of the event being submitted for review. For referrals to specialists, a category value of "specialty_care_review" should always be used.
event.certification_type | The type of certification being requested. For new referrals, a certification value of "initial" should always be used.
event.delivery | Specifies the delivery pattern of the health care services.
event.delivery.quantity | The quantity of services being requested.
event.delivery.quantity_qualifier | The qualifier used to indicate the quantity type. (e.g. visits, month, hours, units, days)
event.diagnoses | An array of diagnosis information related to the event.
event.diagnoses.code | The diagnosis code. (e.g. 384.20)
event.diagnoses.date | The date of the diagnosis.
event.place_of_service | The location where health care services are rendered.
event.provider | Information about the provider being requested for this event.
event.provider.first_name | The event provider’s first name when the provider is an individual.
event.provider.last_name | The event provider’s last name when the provider is an individual.
event.provider.npi | The NPI for the event provider.
event.provider.organization_name | The event provider’s name when the provider is an organization. first_name and last_name should be omitted when sending organization_name.
event.review | Information about the outcome of a health care services review.
event.review.certification_action | Indicates the outcome of the review. For example, "certified_in_total" will be returned when the event is certified/authorized.
event.review.certification_number | The review certification/reference number.
event.review.decision_reason | If the event is not authorized, the reason for that decision.
event.type | The type of service being requested. For example, a value of "consultation" would be used when referring to a specialist for an initial consultation.
patient.birth_date | The patient’s birth date as specified on their policy.
patient.id | The patient’s member identifier.
patient.first_name | The patient’s first name as specified on their policy.
patient.last_name | The patient’s last name as specified on their policy.
provider.first_name | The referring provider’s first name when the provider is an individual.
provider.last_name | The referring provider’s last name when the provider is an individual.
provider.npi | The NPI for the referring provider.
provider.organization_name | The referring provider’s name when the provider is an organization. first_name and last_name should be omitted when sending organization_name.
subscriber.birth_date | Optional: The subscriber’s birth date as specified on their policy. Specify when the patient is not the subscriber.
subscriber.first_name | Optional: The subscriber’s first name as specified on their policy. Specify when the patient is not the subscriber.
subscriber.id | Optional: The subscriber’s member identifier. Specify when the patient is not the subscriber.
subscriber.last_name | Optional: The subscriber’s last name as specified on their policy. Specify when the patient is not the subscriber.
trading_partner_id | Unique id for the intended trading partner, as specified by the [Trading Partners](#trading-partners) endpoint.


Interested in requesting authorization for a particular service for a patient? See PokitDok’s 
[Authorizations](#authorizations) endpoint.
