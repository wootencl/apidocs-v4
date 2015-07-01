---
layout: 2column
---

# Benefits Enrollment Reference

The Enrollment endpoint eases the creation and transmission process of
benefit enrollment and maintenance files. Applications can use the
Enrollment endpoint to submit new enrollments, enrollment changes due to
life events and plan termination. The Enrollment endpoint can be utilized
for all enrollment requirements including open enrollment and is able to
support both full and change files.

This document describes the PokitDok benefit enrollment (834) request format.
It's meant to accompany the summary of benefits enrollment functionality in
the [PokitDok Platform API Documentation](/documentation/v4).
All possible subobjects and acceptable field values are presented. Note that
payers will differ in their requirements for an enrollment submission. For
specifics about this, contact PokitDok Platform Support at
<platform@pokitdok.com>.

The benefits enrollment request consists of a top-level JSON object, described
in the "Enrollment Object" section below. This object can contain a number
of sub-objects as needed to describe the request, such as subscriber or
dependent information. Each sub-object is described in its own table, which
is linked from the "Type" parameter. Note that some sub-objects can themselves
be comprised of other objects.

PokitDok only transmits 834 files and responses to and from carriers. We do
not perform scrubbing or editing of submissions, or provide front-end interfaces
to manage benefits. File transmission is subject to carrier and group
requirements. Since enrollment requirements vary greatly between carriers,
please [contact us](/contact) to get started integrating benefits enrollment
and maintenance into your solution.

# Enrollment Object
<a name="benefits_enrollment"></a>

| Parameters           | Type                                                | Description                                                                                                                          | Required? |
|:---------------------|:----------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------|:----------|
| reference_number     | {string}                                            | The reference number for the transaction.                                                                                            | Yes       |
| purpose              | {string}                                            | The purpose of the transaction. <br/>Acceptable values: see <a href="#purpose_codes">purpose codes.</a>                              | Yes       |
| action               | {string}                                            | The action of the transaction. <br/>Acceptable values: see <a href="#action_codes">action codes.</a>                                 | Yes       |
| master_policy_number | {string}                                            | The master policy number for the sponsor.                                                                                            | No        |
| payer                | <a href="#payer_object">Payer object</a>            | The payer segment for the transaction.                                                                                               | Yes       |
| sponsor              | <a href="#sponsor_object">Sponsor object</a>        | The employer/sponsor segment for the transaction.                                                                                    | Yes       |
| broker               | <a href="#broker_object">Broker object</a>          | The broker segment for the transaction.                                                                                              | No        |
| tpa                  | <a href="#broker_object">Broker object</a>          | The third party administrator segment for the transaction.                                                                           | No        |
| subscriber           | <a href="#member_object">Member object</a>          | The subscriber/employee segment for the transaction.                                                                                 | Yes       |
| dependents           | List of <a href="#member_object">Member objects</a> | A list of dependents covered under benefits by the subscriber. This should be based off of the same parameters as the member object. | No        |
| application_data     | {dict}                                              | See the <a href="#application_data_definition">application data definition.</a>                                                      | No        |

<a name="payer_object"></a>
## Payer object
| Parameters | Type     | Description                       | Required? |
|:-----------|:---------|:----------------------------------|:----------|
| name       | {string} | The name of the carrier/payer.    |           |
| tax_id     | {string} | The tax ID of the carrier/payer.  |           |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="sponsor_object"></a>
## Sponsor object
| Parameters | Type     | Description                           | Required? |
|:-----------|:---------|:--------------------------------------|:----------|
| name       | {string} | The employer/sponsor of the benefits. |           |
| tax_id     | {string} | The tax id of the sponsor.            |           |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)


<a name="broker_object"></a>
## Broker object
| Parameters      | Type     | Description                        | Required? |
|:----------------|:---------|:-----------------------------------|:----------|
| name            | {string} | The name of the broker.            |           |
| tax_id          | {string} | The tax ID of the broker.          |           |
| account_numbers | {string} | The account numbers of the broker. |           |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="member_object"></a>
## Member object
| Parameters                  | Type                                                    | Description                                                                                                                                                                         | Required?                                                        |
|:----------------------------|:--------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-----------------------------------------------------------------|
| last_name                   | {string}                                                | The first name for the subscriber.                                                                                                                                                  |                                                                  |
| first_name                  | {string}                                                | The last name for the subscriber                                                                                                                                                    |                                                                  |
| middle_name                 | {string}                                                | The middle name for the subscriber.                                                                                                                                                 |                                                                  |
| suffix                      | {string}                                                | The suffix for the subscriber.                                                                                                                                                      |                                                                  |
| address                     | <a href="#address_object">Address object</a>            | The address segment for the subscriber.                                                                                                                                             |                                                                  |
| ssn                         | {string}                                                | The social security number for the subscriber.                                                                                                                                      |                                                                  |
| member_id                   | {string}                                                | The member id for the subscriber if already enrolled in benefits.                                                                                                                   |                                                                  |
| subscriber_number           | {string}                                                | The subscriber number or SSN for the subscriber.                                                                                                                                    |                                                                  |
| gender                      | {string}                                                | The gender for the subscriber. <br/>Acceptable values: see <a href="#gender_codes">gender codes.</a>                                                                                |                                                                  |
| group_or_policy_number      | {string}                                                | The group or policy number for this list item.                                                                                                                                      |                                                                  |
| relationship                | {string}                                                | The relationship of the subject of the transaction to the policyholder. <br/>Acceptable values: see <a href="#relationship_codes">relationship codes.</a>                           |                                                                  |
| maintenance_type            | {string}                                                | The type of benefit maintenance.  <br/>Acceptable values: see <a href="#maintenance_type_codes">maintenance type codes.</a>                                                         |                                                                  |
| maintenance_reason          | {string}                                                | The reason for benefit maintenance. <br/>Acceptable values: see <a href="#maintenance_reason_codes">maintenance reason codes.</a>                                                   |                                                                  |
| benefit_status              | {string}                                                | The benefit status for the subscriber. <br/>Acceptable values: see <a href="#benefit_status_codes">benefit status codes.</a>                                                        |                                                                  |
| employment_status           | {string}                                                | The employment status for the subscriber.  <br/>Acceptable values: see <a href="#employment_status_codes">employment status codes.</a>                                              |                                                                  |
| student_status              | {string}                                                | The student status for the subscriber. <br/>Acceptable values: see <a href="#student_status">student status codes.</a>                                                              |                                                                  |
| marital_status              | {string}                                                | The marital status for the subscriber.  <br/>Acceptable values: see <a href="#marital_status_codes">marital status codes.</a>                                                       |                                                                  |
| citizenship_status          | {string}                                                | The citizenship status for the subscriber. <br/>Acceptable values: see <a href="#citizenship_status_codes">citizenship status codes.</a>                                            |                                                                  |
| ethnicity                   | {string}                                                | The ethnicity of the subscriber.  <br/>Acceptable values: see <a href="#ethnicity_codes">ethnicity codes.</a>                                                                       |                                                                  |
| handicapped                 | {bool} (Default: false)                                 | True if the subscriber is handicapped.                                                                                                                                              |                                                                  |
| cobra_qualifying_event      | {string}                                                | The COBRA qualifying event for the subscriber. <br/>Acceptable values: see <a href="#cobra_qualifying_event_codes">cobra qualifying event codes.</a>                                |                                                                  |
| confidentiality             | {string}                                                | The code indicating the address to insured information.                                                                                                                             |                                                                  |
| medicare                    | <a href="#medicare_object">Medicare object</a>          | Subscriber Medicare information, if applicable.                                                                                                                                     |                                                                  |
| school                      | <a href="#school_object">School object                  | Subscriber school information, if applicable.                                                                                                                                       |                                                                  |
| eligibility_begin_date      | {datetime}                                              | The date benefits become eligible for the subscriber.                                                                                                                               |                                                                  |
| eligibility_end_date        | {datetime}                                              | The date benefits become ineligible for the subscriber.                                                                                                                             |                                                                  |
| education_end_date          | {datetime}                                              | The education end date for the subscriber.                                                                                                                                          |                                                                  |
| birth_date                  | {datetime}                                              | The date of birth for the subscriber.                                                                                                                                               |                                                                  |
| birth_sequence              | {int}                                                   | The birth sequence of the subscriber. This is only required when family members have the same birth date.                                                                           | #Required when reporting family members with the same birth date |
| death_date                  | {datetime}                                              | The death date of the subscriber.                                                                                                                                                   | #Member Individual Death Date                                    |
| contacts                    | List of <a href="#contact_object">Contact objects</a>   | A list of contact information for the subscriber.                                                                                                                                   |                                                                  |
| employment_classes          | List of {string}                                        | The employment class codes for the subscriber. <br/>Acceptable values: see <a href="#employment_class_codes">employment class codes.</a>                                            |                                                                  |
| wages_amount                | <a href="#monetary_object">Monetary Amount object</a>   | The wage paid to the subscriber.                                                                                                                                                    |                                                                  |
| wages_paid_frequency        | {string}                                                | The frequency the subscriber is paid. Acceptable values: see wages paid frequency.<br/>Acceptable values: see <a href="#wages_paid_frequency_codes">wages paid frequency codes.</a> |                                                                  |
| spend_down_amount           | <a href="#monetary_object">Monetary Amount object</a>   | The spend down amount for the subscriber.                                                                                                                                           |                                                                  |
| premium_amount              | <a href="#monetary_object">Monetary Amount object</a>   | The premium amount for to the subscriber.                                                                                                                                           |                                                                  |
| expected_expenditure_amount | <a href="#monetary_object">Monetary Amount object</a>   | The expected expenditure amount paid of the subscriber.                                                                                                                             |                                                                  |
| deductible_amount           | <a href="#monetary_object">Monetary Amount object</a>   | The deductible amount for the subscriber.                                                                                                                                           |                                                                  |
| copayment_amount            | <a href="#monetary_object">Monetary Amount object</a>   | The co-payment amount for the subscriber.                                                                                                                                           |                                                                  |
| coinsurance_amount          | <a href="#monetary_object">Monetary Amount object</a>   | The co-insurance selection amount for the subscriber.                                                                                                                               |                                                                  |
| substance_abuse             | {bool} (Default: false)                                 | True if the subscriber has a substance abuse issue.                                                                                                                                 |                                                                  |
| tobacco_use                 | {bool} (Default: false)                                 | True if the subscriber uses tobacco.                                                                                                                                                |                                                                  |
| height                      | {string}                                                | The height of the subscriber.                                                                                                                                                       |                                                                  |
| weight                      | {string}                                                | The weight of the subscriber.                                                                                                                                                       |                                                                  |
| benefits                    | List of <a href="#coverage_object">Coverage objects</a> | The list of benefit segments for the subscriber.                                                                                                                                    |                                                                  |
| maintenance_effective_date  | {datetime}                                              | The maintenance effective date of the subscriber.                                                                                                                                   |                                                                  |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="address_object"></a>
## Address object
| Parameter   | Type     | Description                                                           | Required? |
|:------------|:---------|:----------------------------------------------------------------------|:----------|
| line        | {string} | The subscriber’s street address information. (e.g. [“123 N MAIN ST”]) | Yes       |
| line2       | {string} | The subscriber’s street address information. (e.g. [“123 N MAIN ST”]) |           |
| city        | {string} | The subscriber’s city information. (e.g. “SAN MATEO”)                 | Yes       |
| state       | {string} | The subscriber’s state information. (e.g. “CA”)                       |           |
| postal_code | {string} | The subscriber’s zip/postal code. (e.g. “94401”)                      |           |
| country     | {string} | The subscriber's country information. (e.g. “USA”)                    |           |
| county      | {string} | The subscriber's county information. (e.g. “SAN MATEO”)               |           |

(<a href="#member_object">Back to Member object</a>)

<a name="medicare_object"></a>
## Medicare object
| Parameters         | Type     | Description                                                                                                                                                               | Required? |
|:-------------------|:---------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| plan               | {string} | The medicare plan value for the subscriber. <br/>Acceptable values: see <a href="#medicare_plan_codes">medicare plan codes.</a>                                           | Yes       |
| eligibility_reason | {string} | The medicare eligibility reason codes for the subscriber. <br/>Acceptable values: see <a href="#medicare_eligibility_reason_codes">medicare eligibility reason codes.</a> |           |

(<a href="#member_object">Back to Member object</a>)

<a name="school_object"></a>
## School object
| Parameters | Type     | Description                        | Required? |
|:-----------|:---------|:-----------------------------------|:----------|
| name       | {string} | The name of the dependents school. |           |

(<a href="#member_object">Back to Member object</a>)

<a name="contact_object"></a>
## Contact object
| Parameters                   | Type     | Description                                                                                                                      | Required? |
|:-----------------------------|:---------|:---------------------------------------------------------------------------------------------------------------------------------|:----------|
| primary_communication_type   | {string} | The type of primary communication. <br/>Acceptable values: see <a href="#communication_type_codes">communication type codes.</a> | Yes       |
| primary_communication_number | {string} | The primary communication number for the subscriber.                                                                             | Yes       |
| communication_type2          | {string} | The type of secondary communication. <a href="#communication_type_codes">communication type codes.</a>                           |           |
| communication_number2        | {string} | The secondary communication number for the subscriber.                                                                           |           |
| communication_type3          | {string} | The type of tertiary communication. <a href="#communication_type_codes">communication type codes.</a>                            |           |
| communication_number3        | {string} | The tertiary communication number for the subscriber.                                                                            |           |

(<a href="#member_object">Back to Member object</a>)

<a name="monetary_object"></a>
## Monetary Amount object
| Parameters | Type     | Description                       | Required? |
|:-----------|:---------|:----------------------------------|:----------|
| currency   | {string} | The type of currency. (e. g. USD) |           |
| amount     | {string} | The amount of currency.           |           |

(<a href="#member_object">Back to Member object</a>)

<a name="coverage_object"></a>
## Coverage object
| Parameters                  | Type                                                                                    | Description                                                                                                                 | Required? |
|:----------------------------|:----------------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------|:----------|
| maintenance_type            | {string}                                                                                | The type of benefit maintenance. <br/>Acceptable values: see <a href="#maintenance_type_codes">maintenance type codes.</a>  | Yes       |
| benefit_type                | {string}                                                                                | The benefit type. <br/>Acceptable values: see <a href="#insurance_line_codes">insurance line codes.</a>                     |           |
| coverage_level              | {string}                                                                                | The coverage level of the subscriber. <br/>Acceptable values: see <a href="#coverage_level_codes">coverage level codes.</a> |           |
| late_enrollment             | {bool} (Default : false)                                                                | True if the subscriber is a late enroller.                                                                                  |           |
| begin_date                  | {datetime}                                                                              | The beginning date of coverage for the subscriber.                                                                          |           |
| end_date                    | {datetime}                                                                              | The end date of coverage for the subscriber.                                                                                |           |
| enrollment_signature_date   | {datetime}                                                                              | The enrollment signature date for the subscriber.                                                                           |           |
| maintenance_effective_date  | {datetime}                                                                              | The maintenance effective date for the subscriber.                                                                          |           |
| premium_paid_to_date        | {datetime}                                                                              | The premium paid to date for the subscriber.                                                                                |           |
| last_premium_paid_date      | {datetime}                                                                              | The last premium paid date for the subscriber.                                                                              |           |
| spend_down_amount           | <a href="#monetary_object">Monetary Amount object</a>                                   | The spend down amount for the subscriber.                                                                                   |           |
| premium_amount              | <a href="#monetary_object">Monetary Amount object</a>                                   | The premium amount for the subscriber.                                                                                      |           |
| expected_expenditure_amount | <a href="#monetary_object">Monetary Amount object</a>                                   | The expected expenditure amount for the subscriber.                                                                         |           |
| deductible_amount           | <a href="#monetary_object">Monetary Amount object</a>                                   | The deductible amount for the subscriber.                                                                                   |           |
| copayment_amount            | <a href="#monetary_object">Monetary Amount object</a>                                   | The copayment amount for the subscriber.                                                                                    |           |
| coinsurance_amount          | <a href="#monetary_object">Monetary Amount object</a>                                   | The coinsurance amount for the subscriber.                                                                                  |           |
| coordination_of_benefits    | List of <a href="#coordination_of_benefits_object">Coordination of Benefits objects</a> | List of the coordination of benefits segment.                                                                               |           |
| providers                   | List of Provider object                                                                 | List of the provider segment.                                                                                               |           |

(<a href="#member_object">Back to Member object</a>)

<a name="coordination_of_benefits_object"></a>
## Coordination of Benefits object
| Parameters             | Type     | Description                                                                                                                                                        | Required? |
|:-----------------------|:---------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| payer_responsibility   | {string} | The payer responsibility. <br/>Acceptable values: see <a href="#payer_responsibility_codes">payer responsibility codes.</a>                                        | Yes       |
| group_or_policy_number | {string} | The group or policy number for the subscribers additional plan.                                                                                                    |           |
| status                 | {string} | The status of the coordination of benefits. <br/>Acceptable values: see <a href="#coordination_of_benefit_status_codes">coordnination of benefit status codes.</a> | Yes       |

(<a href="#coverage_object">Back to Coverage object</a>)

<a name="provider_object"></a>
## Provider object
| Parameters                | Type                                         | Description                                                                                                      | Required? |
|:--------------------------|:---------------------------------------------|:-----------------------------------------------------------------------------------------------------------------|:----------|
| type                      | {string}                                     | The type of provider. <br/>Acceptable values: see <a href="#provider_type_codes">provider_type_codes.</a>        | Yes       |
| entity_type               | {string}                                     | The entity type of the provider. <br/>Acceptable values: see <a href="#entity_type_codes">entity type codes.</a> | Yes       |
| patient_status            | {string}                                     | The patient status for the provider. Acceptable values: see established patient codes.                           |           |
| last_or_organization_name | {string}                                     | Last name of the provider or the name of the organization.                                                       |           |
| first_name                | {string}                                     | The first name of the provider.                                                                                  |           |
| middle_name               | {string}                                     | The middle name of the provider.                                                                                 |           |
| prefix                    | {string}                                     | The prefix of the provider.                                                                                      |           |
| suffix                    | {string}                                     | The suffix of the provider.                                                                                      |           |
| ssn                       | {string}                                     | The SSN of the provider.                                                                                         |           |
| service_provider_number   | {string}                                     | The provider service number.                                                                                     |           |
| npi_id                    | {string}                                     | The NPI id of the provider.                                                                                      |           |
| tax_id                    | {string}                                     | The tax id of the provider.                                                                                      |           |
| address                   | <a href="#address_object">Address object</a> | The address of the provider.                                                                                     |           |

(<a href="#coverage_object">Back to Coverage object</a>)

# Codes
Many of the parameters above only accept a limited range of valid
inputs. These values are transformed into the appropriate EDI X12 code values
for submission to the payer.

<a name="relationship_codes"></a>
## Relationship Codes
|                          |                              |                |                 |
|:-------------------------|:-----------------------------|:---------------|:----------------|
| spouse                   | father                       | mother         | grandfather     |
| grandmother              | grandson                     | granddaughter  | aunt            |
| uncle                    | nephew                       | niece          | cousin          |
| adopted_child            | foster_child                 | son_in_law     | daughter_in_law |
| brother_in_law           | sister_in_law                | mother_in_law  | father_in_law   |
| brother                  | sister                       | ward           | step_parent     |
| step_son                 | step_daughter                | self           | child           |
| sponsored_dependent      | dependent_of_minor_dependent | ex_spouse      | guardian        |
| court_appointed_guardian | collateral_dependent         | life_partner   | annuitant       |
| trustee                  | other_relationship           | other_relative |                 |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="coverage_level_codes"></a>
## Coverage Level Codes
|                                      |                                       |
|:-------------------------------------|:--------------------------------------|
| Children Only                        | Dependents Only                       |
| Employee and One Dependent           | Employee and Two Dependents           |
| Employee and Three Dependents        | Employee and One or More Dependents   |
| Employee and Two or More Dependents  | Employee and Three or More Dependents |
| Employee and Four or More Dependents | Employee and Five or More Dependents  |
| Employee and Children                | Employee Only                         |
| Employee and Spouse                  | Family                                |
| Individual                           | Spouse and Children                   |
| Spouse Only                          | Two Party                             |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="purpose_codes"></a>
## Purpose Codes
|                  |
|:-----------------|
| Original         |
| Re-Submission    |
| Information Copy |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="action_codes"></a>
## Action Codes
|         |
|:--------|
| Change  |
| Verify  |
| Replace |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="gender_codes"></a>
## Gender Codes
|         |
|:--------|
| Female  |
| Male    |
| Unknown |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="maintenance_type_codes"></a>
## Maintenance Type Codes
|                                     |
|:------------------------------------|
| Change                              |
| Delete                              |
| Addition                            |
| Cancellation or Termination         |
| Reinstatement                       |
| Correction                          |
| Audit or Compare                    |
| Employee Information Not Applicable |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="maintenance_reason_codes"></a>
## Maintenance Reason Codes
|                                                         |                                                                      |
|:--------------------------------------------------------|:---------------------------------------------------------------------|
| Divorce                                                 | Birth                                                                |
| Death                                                   | Retirement                                                           |
| Adoption                                                | Strike                                                               |
| Termination of Benefits                                 | Termination of Employment                                            |
| Consolidation Omnibus Budget Reconciliation Act (COBRA) | Consolidation Omnibus Budget Reconciliation Act (COBRA) Premium Paid |
| Surviving Spouse                                        | Voluntary Withdrawal                                                 |
| Primary Care Provider (PCP) Change                      | Quit                                                                 |
| Fired                                                   | Suspended                                                            |
| Active                                                  | Disability                                                           |
| Plan Change                                             | Change in Identifying Data Elements                                  |
| Declined Coverage                                       | Pre-Enrollment                                                       |
| Initial Enrollment                                      | Benefit Selection                                                    |
| Legal Separation                                        | Marriage                                                             |
| Personnel Data                                          | Leave of Absence with Benefits                                       |
| Leave of Absence without Benefits                       | Lay Off with Benefits                                                |
| Lay Off without Benefits                                | Re-enrollment                                                        |
| Change of Location                                      | Non Payment                                                          |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="benefit_status_codes"></a>
## Benefit Status Codes
|                                                        |
|:-------------------------------------------------------|
| Active                                                 |
| Consolidated Omnibus Budget Reconciliation Act (COBRA) |
| Surviving Insured                                      |
| Tax Equity and Fiscal Responsibility Act (TEFRA)       |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="medicare_plan_codes"></a>
## Medicare Plan Codes
|                       |
|:----------------------|
| Medicare Part A       |
| Medicare Part B       |
| Medicare Part A and B |
| Medicare              |
| No Medicare           |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="medicare_eligibility_reason_codes"></a>
## Medicare Eligibility Reason Codes
|                                |
|:-------------------------------|
| Age                            |
| Disability                     |
| End Stage Renal Disease (ESRD) |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="cobra_qualifying_event_codes"></a>
## COBRA Qualifying Event Codes
|                           |                                                            |
|:--------------------------|:-----------------------------------------------------------|
| Termination of Employment | Reduction of work hours                                    |
| Medicare                  | Death                                                      |
| Divorce                   | Separation                                                 |
| Ineligible Child          | Bankruptcy of Retirees Former Employer ( U.S.C. B(f)()(F)) |
| Layoff                    | Leave of Absence                                           |
| ZZ Mutually Defined       |                                                            |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="employment_status_codes"></a>
## Employment Status Codes
|                            |
|:---------------------------|
| Active                     |
| Active Military - Overseas |
| Active Military - USA      |
| Full-time                  |
| Leave of Absence           |
| Part-time                  |
| Retired                    |
| Terminated                 |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="student_status"></a>
## Student Status Codes
|               |
|:--------------|
| Full-time     |
| Not a Student |
| Part-time     |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="insurance_line_codes"></a>
## Insurance Line Codes
|                                 |                                 |
|:--------------------------------|:--------------------------------|
| Preventative Care/Wellness      | 24 Hour Care                    |
| Medicare Risk                   | Mental Health                   |
| Dental Capitation               | Dental                          |
| Exclusive Provider Organization | Facility                        |
| Hearing                         | Health                          |
| Health Maintenance Organization | Long-Term Care                  |
| Long-Term Disability            | Major Medical                   |
| Mail Order Drug                 | Prescription Drug               |
| Point of Service                | Preferred Provider Organization |
| Practitioners                   | Short-Term Disability           |
| Utilization Review              | Vision                          |
(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="payer_responsibility_codes"></a>
## Payer Responsibility Codes
|           |
|:----------|
| Primary   |
| Secondary |
| Tertiary  |
| Unknown   |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="coordination_of_benefit_status_codes"></a>
## Coordination Of Benefits Status Codes
|                             |
|:----------------------------|
| coordination_of_benefits    |
| no_coordination_of_benefits |
| unknown                     |
(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="marital_status_codes"></a>
## Marital Status Codes
|                                           |
|:------------------------------------------|
| Widowed                                   |
| Legally Separated                         |
| Registered Domestic Partner               |
| Divorced                                  |
| Single                                    |
| Married                                   |
| Unreported                                |
| Separated                                 |
| Unmarried (Single or Divorced or Widowed) |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="ethnicity_codes"></a>
## Ethnicity Codes
|                                   |                             |
|:----------------------------------|:----------------------------|
| Not Provided                      | Not Applicable              |
| Asian or Pacific Islander         | Black                       |
| Caucasian                         | Subcontinent Asian American |
| Other Race or Ethnicity           | Asian Pacific American      |
| Native American                   | Hispanic                    |
| American Indian or Alaskan Native | Native Hawaiian             |
| Black (Non-Hispanic)              | White (Non-Hispanic)        |
| Pacific Islander                  | Mutually Defined            |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="citizenship_status_codes"></a>
## Citizenship Status Codes
|                             |
|:----------------------------|
| U.S. Citizen                |
| Non-Resident Alien          |
| Resident Alien              |
| Illegal Alien               |
| Alien                       |
| U.S. Citizen - Non-Resident |
| U.S. Citizen - Resident     |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="employment_class_codes"></a>
## Employment Class Codes
|                    |                    |
|:-------------------|:-------------------|
| Union              | Non-Union          |
| Executive          | Non-Executive      |
| Management         | Non-Management     |
| Hourly             | Salaried           |
| Administrative     | Non-Administrative |
| Exempt             | Non-Exempt         |
| Highly Compensated | Key-Employee       |
| Bargaining         | Non-Bargaining     |
| Owner              | President          |
| Vice President     |                    |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="wages_paid_frequency_codes"></a>
## Wages Paid Frequency Codes
|                     |                               |
|:--------------------|:------------------------------|
| Weekly              | Biweekly                      |
| Semimonthly         | Monthly                       |
| Daily               | Annual                        |
| Two Calendar Months | Lump-Sum Separation Allowance |
| Year-to-Date        | Single                        |
| Hourly              | Quarterly                     |
| Semiannual          | Unknown                       |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="communication_type_codes"></a>
## Communication Type Codes
|                     |                     |
|:--------------------|:--------------------|
| Electronic Mail     | Telephone Extension |
| Facsimile           | Telephone           |
| Home Phone Number   | Work Phone Number   |
| Cellular Phone      | Beeper Number       |
| Alternate Telephone |                     |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="provider_type_codes"></a>
## Provider Type Codes
|                           |                                    |
|:--------------------------|:-----------------------------------|
| Laboratory                | Obstetrics and Gynecology Facility |
| Hospital                  | Facility                           |
| Doctor of Optometry       | Primary Care Provider              |
| Pharmacy                  | Dentist                            |
| Managed Care Organization |                                    |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="entity_type_codes"></a>
## Entity Type Codes
|                   |
|:------------------|
| Person            |
| Non-Person Entity |

(<a href="#benefits_enrollment">Back to Benefits Enrollment</a>)

<a name="application_data_definition"></a>
# Application Data
API client applications may include custom application data in requests to help
support scenarios where an application is unable to store the activity id and
wishes to include application specific data in their API requests so that the
information will be stored on the request’s activity and returned to the
application in asynchronous callbacks. This can be useful for scenarios where
you want to directly associate a PokitDok Platform API request with some
identifier(s) in your system so that you can do direct lookups to associate
responses with the appropriate information. For example, suppose you wish to
fire off a number of eligibility or claims requests and want to include some
identifiers specific to your application. By including the identifier(s) you
need in the request’s application_data section, you can easily do direct lookups
using those identifiers when you receive the API response.
