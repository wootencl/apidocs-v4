# Benefits Enrollment Overview

<a name="benefits_enrollment">

## JSON Schema for 834 Benefits Enrollment
| Parameters           | Type                     | Description                                                                                                                                                                              | Required? |
|:---------------------|:-------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| reference_number     | {string}                 | The reference number for the transaction.                                                                                                                                                | Yes       |
| purpose              | {string}                 | The purpose of the transaction. <br/>Acceptable values: see <a href="#purpose_codes">purpose codes.</a>                                                                                  | Yes       |
| action               | {string}                 | The action of the transaction. <br/>Acceptable values: see <a href="#action_codes">action codes.</a>                                                                                     | Yes       |
| master_policy_number | {string}                 | The master policy number for the sponsor.                                                                                                                                                | No        |
| payer                | Payer Subschema          | The payer segment for the transaction. <br/>Reference: the <a href="#payer_subschema">payer subschema.</a>                                                                               | Yes       |
| sponsor              | Sponsor Subschema        | The employer/sponsor segment for the transaction. <br/>Reference: the <a href="#sponsor_subschema">sponsor subschema.</a>                                                                | Yes       |
| broker               | Broker SubSchema         | The broker segment for the transaction. <br/>Reference: the <a href="#broker_subschema">broker subschema.</a>                                                                            | No        |
| tpa                  | Broker SubSchema         | The third party administrator segment for the transaction. <br/>Reference: the <a href="#broker_subschema">broker subschema.</a>                                                         | No        |
| subscriber           | Member Subschema         | The subscriber/employee segment for the transaction. <br/>Reference: the <a href="#member_subschema">member subschema.</a>                                                               | Yes       |
| dependents           | List of Member Subschema | A list of dependents covered under benefits by the subscriber. This should be based off of the same parameters as the member subschema.<a href="#member_subschema">member subschema.</a> | No        |
| application_data     | Dict                     | Reference the application data definition.                                                                                                                                               | No        |

<a name="payer_subschema"></a>
### Payer Subschema (<a href="#benefits_enrollment">back</a>)
| Parameters | Type     | Description                       | Required? |
|:-----------|:---------|:----------------------------------|:----------|
| name       | {string} | The name of of the carrier/payer. |           |
| tax_id     | {string} | The tax ID of the carrier/payer.  |           |

<a name="sponsor_subschema"></a>
### Sponsor Subschema (<a href="#benefits_enrollment">back</a>)
| Parameters | Type     | Description                           | Required? |
|:-----------|:---------|:--------------------------------------|:----------|
| name       | {string} | The employer/sponsor of the benefits. |           |
| tax_id     | {string} | The tax id of the sponsor.            |           |

<a name="broker_subschema"></a>
### Broker Subschema (<a href="#benefits_enrollment">back</a>)
| Parameters      | Type     | Description                        | Required? |
|:----------------|:---------|:-----------------------------------|:----------|
| name            | {string} | The name of the broker.            |           |
| tax_id          | {string} | The tax ID of the broker.          |           |
| account_numbers | {string} | The account numbers of the broker. |           |

<a name="member_subschema">
### Member Subschema (<a href="#benefits_enrollment">back</a>)
| Parameters                  | Type                       | Description                                                                                                                                                      | Required?                                                        |
|:----------------------------|:---------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------|:-----------------------------------------------------------------|
| last_name                   | {string}                   | The first name for the subscriber.                                                                                                                               |                                                                  |
| first_name                  | {string}                   | The last name for the subscriber                                                                                                                                 |                                                                  |
| middle_name                 | {string}                   | The middle name for the subscriber.                                                                                                                              |                                                                  |
| suffix                      | {string}                   | The suffix for the subscriber.                                                                                                                                   |                                                                  |
| address                     | Address Subschema          | The address segment for the subscriber. <br/>Reference: the <a href="#address_subschema">address subschema.</a>                                                  |                                                                  |
| ssn                         | {string}                   | The social security number for the subscriber.                                                                                                                   |                                                                  |
| member_id                   | {string}                   | The member id for the subscriber if already enrolled in benefits.                                                                                                |                                                                  |
| subscriber_number           | {string}                   | The subscriber number or SSN for the subscriber.                                                                                                                 |                                                                  |
| gender                      | {string}                   | The gender for the subscriber. <br/>Acceptable values: see <a href="#gender_codes">gender codes.</a>                                                             |                                                                  |
| group_or_policy_number      | {string}                   | The group or policy number for this list item.                                                                                                                   |                                                                  |
| relationship                | {string}                   | The relationship of the subject of the transaction to the policyholder. <br/>Acceptable values: see <a href="#api_relationship_codes">relationship codes.</a>    |                                                                  |
| maintenance_type            | {string}                   | The type of benefit maintenance.  <br/>Acceptable values: see <a href="#maintenance_type_codes">maintenance_type.</a>                                            |                                                                  |
| maintenance_reason          | {string}                   | The reason for benefit maintenance. <br/>Acceptable values: see <a href="#maintenance_reason_codes">maintenance_reason_codes.</a>                                |                                                                  |
| benefit_status              | {string}                   | The benefit status for the subscriber. <br/>Acceptable values: see <a href="#benefit_status_codes">benefit status codes.</a>                                     |                                                                  |
| employment_status           | {string}                   | The employment status for the subscriber.  <br/>Acceptable values: see <a href="#employment_status_codes">employment status codes.</a>                           |                                                                  |
| student_status              | {string}                   | The student status for the subscriber. <br/>Acceptable values: see <a href="#student_status">student status codes.</a>                                           |                                                                  |
| marital_status              | {string}                   | The marital status for the subscriber.  <br/>Acceptable values: see <a href="#marital_status_codes">marital codes.</a>                                           |                                                                  |
| citizenship_status          | {string}                   | The citizenship status for the subscriber. <br/>Acceptable values: see <a href="#citizenship_status_codes">citizenship status codes.</a>                         |                                                                  |
| ethnicity                   | {string}                   | The ethnicity of the subscriber. Acceptable values: see ethnicity codes table below. <br/>Acceptable values: see <a href="#ethnicity_codes">ethnicity codes.</a> |                                                                  |
| handicapped                 | Bool (Default: False)      | If the subscriber is handicapped it would need to be defined as True. The default is false for this parameter.                                                   |                                                                  |
| cobra_qualifying_event      | {string}                   | The COBRA qualifying event for the subscriber. <br/>Acceptable values: see <a href="#cobra_qualifying_event_codes">cobra qualifying event codes.</a>             |                                                                  |
| confidentiality             | {string}                   | The code indicating the address to insured information.                                                                                                          |                                                                  |
| medicare                    | Medicare SubSchema         | The medicare segment for the transaction. <br/>Reference: the <a href="#medicare_subschema">medicare subschema.</a>                                              |                                                                  |
| school                      | School SubSchema           | The school segment for the transaction. <br/>Reference: the <a href="#school_subschema">school subschema.</a>                                                    |                                                                  |
| eligibility_begin_date      | Datetime                   | The date benefits become eligible for the subscriber.                                                                                                            |                                                                  |
| eligibility_end_date        | Datetime                   | The date benefits become ineligible for the subscriber.                                                                                                          |                                                                  |
| education_end_date          | Datetime                   | The education end date for the subscriber.                                                                                                                       |                                                                  |
| birth_date                  | Datetime                   | The date of birth for the subscriber.                                                                                                                            |                                                                  |
| birth_sequence              | Int                        | The birth sequence of the subscriber. This is only required when family members have the same birth date.                                                        | #Required when reporting family members with the same birth date |
| death_date                  | Datetime                   | The death date of the subscriber.                                                                                                                                | #Member Individual Death Date                                    |
| contacts                    | List of Contact SubSchema  | A list of contact information for the subscriber. <br/>Reference: the <a href="#contact_subschema">contact subschema.</a>.                                       |                                                                  |
| employment_classes          | List of String             | The employment class codes for the subscriber. Acceptable values: see employment class codes.                                                                    |                                                                  |
| wages_amount                | Monetary Amount Schema     | The wage paid to the subscriber. <br/>Reference: the <a href="#monetary_subschema">monetary subschema.</a>.                                                      |                                                                  |
| wages_paid_frequency        | {string}                   | The frequency the subscriber is paid. Acceptable values: see wages paid frequency.                                                                               |                                                                  |
| spend_down_amount           | Monetary Amount Schema     | The spend down amount for the subscriber. <br/>Reference: the <a href="#monetary_subschema">monetary subschema.</a>.                                             |                                                                  |
| premium_amount              | Monetary Amount Schema     | The premium amount for to the subscriber. <br/>Reference: the <a href="#monetary_subschema">monetary subschema.</a>.                                             |                                                                  |
| expected_expenditure_amount | Monetary Amount Schema     | The expected expenditure amount paid of the subscriber. <br/>Reference: the <a href="#monetary_subschema">monetary subschema.</a>.                               |                                                                  |
| deductible_amount           | Monetary Amount Schema     | The deductible amount for the subscriber. <br/>Reference: the <a href="#monetary_subschema">monetary subschema.</a>.                                             |                                                                  |
| copayment_amount            | Monetary Amount Schema     | The co-payment amount for the subscriber. <br/>Reference: the <a href="#monetary_subschema">monetary subschema.</a>.                                             |                                                                  |
| coinsurance_amount          | Monetary Amount Schema     | The co-insurance selection amount for the subscriber. <br/>Reference: the <a href="#monetary_subschema">monetary subschema.</a>.                                 |                                                                  |
| substance_abuse             | Bool (Default: False)      | If the subscriber has a substance abuse this parameter would need to be defined as True. The default is False for this parameter.                                |                                                                  |
| tobacco_use                 | Bool (Default: False)      | If the subscriber uses tobacco this parameter would need to be defined as True. The default is False for this parameter.                                         |                                                                  |
| height                      | {string}                   | The height of the subscriber.                                                                                                                                    |                                                                  |
| weight                      | {string}                   | The weight of the subscriber.                                                                                                                                    |                                                                  |
| benefits                    | List of Coverage SubSchema | The list of benefit segment for the subscriber. <br/>Reference: the <a href="#coverage_subschema">coverage subschema.</a>.                                       |                                                                  |
| maintenance_effective_date  | datetime                   | The maintenance effective date of the subscriber.                                                                                                                |                                                                  |

<a name="address_subschema">
#### Address Subschema (<a href="#member_subschema">back</a>)
| Parameter   | Type     | Description                                                           | Required? |
|:------------|:---------|:----------------------------------------------------------------------|:----------|
| line        | {string} | The subscriber’s street address information. (e.g. [“123 N MAIN ST”]) | Yes       |
| line2       | {string} | The subscriber’s street address information. (e.g. [“123 N MAIN ST”]) |           |
| city        | {string} | The subscriber’s city information. (e.g. “SAN MATEO”)                 | Yes       |
| state       | {string} | The subscriber’s state information. (e.g. “CA”)                       |           |
| postal_code | {string} | The subscriber’s zip/postal code. (e.g. “94401”)                      |           |
| country     | {string} | The subscriber's country information. (e.g. “USA”)                    |           |
| county      | {string} | The subscriber's county information. (e.g. “SAN MATEO”)               |           |

<a name="medicare_subschema">
#### Medicare Subschema (<a href="#member_subschema">back</a>)
| Parameters         | Type     | Description                                                                                                         | Required? |
|:-------------------|:---------|:--------------------------------------------------------------------------------------------------------------------|:----------|
| plan               | {string} | The medicare plan value for the subscriber. Acceptable values: see medicare plan codes.                             | Yes       |
| eligibility_reason | {string} | The medicare eligibility reason codes for the subscriber. Acceptable values: see medicare eligibility reason codes. |           |

<a name="school_subschema">
#### School Subschema (<a href="#member_subschema">back</a>)
| Parameters | Type     | Description                        | Required? |
|:-----------|:---------|:-----------------------------------|:----------|
| name       | {string} | The name of the dependents school. |           |

<a name="contact_subschema">
#### Contact Subschema (<a href="#member_subschema">back</a>)
| Parameters                   | Type     | Description                                                                      | Required? |
|:-----------------------------|:---------|:---------------------------------------------------------------------------------|:----------|
| primary_communication_type   | {string} | The type of primary communication. Acceptable values: see communication types.   | Yes       |
| primary_communication_number | {string} | The primary communication number for the subscriber.                             | Yes       |
| communication_type2          | {string} | The type of secondary communication. Acceptable values: see communication types. |           |
| â€˜communication_number2     | {string} | The secondary communication number for the subscriber.                           |           |
| communication_type3          | {string} | The type of tertiary communication. Acceptable values: see communication types.  |           |
| communication_number3        | {string} | The tertiary communication number for the subscriber.                            |           |

<a name="monetary_subschema">
#### Monetary Amount Subschema (<a href="#member_subschema">back</a>)
| Parameters | Type     | Description                       | Required? |
|:-----------|:---------|:----------------------------------|:----------|
| currency   | {string} | The type of currency. (e. g. USD) |           |
| amount     | {string} | The amount of currency.           |           |

<a name="coverage_subschema">
#### Coverage Subschema (<a href="#member_subschema">back</a>)
| Parameters                  | Type                                       | Description                                                                                                        | Required? |
|:----------------------------|:-------------------------------------------|:-------------------------------------------------------------------------------------------------------------------|:----------|
| maintenance_type            | {string}                                   | The type of benefit maintenance. Acceptable values: see maintenance type codes.                                    | Yes       |
| benefit_type                | {string}                                   | The benefit type. Acceptable values: see insurance line codes.                                                     |           |
| coverage_level              | {string}                                   | The coverage level of the subscriber. Acceptable values; see coverage level codes.                                 |           |
| late_enrollment             | Bool (Default : False)                     | If the subscriber is a late enrollee it would need to be defined as True. The default is False for this parameter. |           |
| begin_date                  | datetime                                   | The beginning date of coverage for the subscriber.                                                                 |           |
| end_date                    | datetime                                   | The end date of coverage for the subscriber.                                                                       |           |
| enrollment_signature_date   | datetime                                   | The enrollment signature date for the subscriber.                                                                  |           |
| maintenance_effective_date  | datetime                                   | The maintenance effective date for the subscriber.                                                                 |           |
| premium_paid_to_date        | datetime                                   | The premium paid to date for the subscriber.                                                                       |           |
| last_premium_paid_date      | datetime                                   | The last premium paid date for the subscriber.                                                                     |           |
| spend_down_amount           | Monetary Amount SubSchema                  | "See the ""Monetary Amount"" subschema below."                                                                     |           |
| premium_amount              | Monetary Amount SubSchema                  | "See the ""Monetary Amount"" subschema below."                                                                     |           |
| expected_expenditure_amount | Monetary Amount SubSchema                  | "See the ""Monetary Amount"" subschema below."                                                                     |           |
| deductible_amount           | Monetary Amount SubSchema                  | "See the ""Monetary Amount"" subschema below."                                                                     |           |
| copayment_amount            | Monetary Amount SubSchema                  | "See the ""Monetary Amount"" subschema below."                                                                     |           |
| coinsurance_amount          | Monetary Amount SubSchema                  | "See the ""Monetary Amount"" subschema below."                                                                     |           |
| coordination_of_benefits    | List of Coordination of Benefits SubSchema | List of the coordination of benefits segment. See the coordination of benefits subschema.                          |           |
| providers                   | List of Provider SubSchema                 | List of the provider segment. See the provider subschema.                                                          |           |

<a name="coordination_of_benefits_subschema">
##### Coordination of Benefits Subschema (<a href="#coverage_subschema">back</a>)
| Parameters             | Type     | Description                                                                                     | Required? |
|:-----------------------|:---------|:------------------------------------------------------------------------------------------------|:----------|
| payer_responsibility   | {string} | The payer responsibility. Acceptable values: see payer responsibility codes.                    | Yes       |
| group_or_policy_number | {string} | The group or policy number for the subscribers additional plan.                                 |           |
| status                 | {string} | The status of the coordination of benefits. Acceptable values:  coordination of benefits codes. | Yes       |

<a name="provider_subschema">
##### Provider Subschema (<a href="#coverage_subschema">back</a>)
| Parameters                | Type              | Description                                                                            | Required? |
|:--------------------------|:------------------|:---------------------------------------------------------------------------------------|:----------|
| type                      | {string}          | The type of provider. Acceptable values: see provider type codes.                      | Yes       |
| entity_type               | {string}          | The entity type of the provider. Acceptable values: see entity type codes.             | Yes       |
| patient_status            | {string}          | The patient status for the provider. Acceptable values: see established patient codes. |           |
| last_or_organization_name | {string}          | Last name of the provider or the name of the organization.                             |           |
| first_name                | {string}          | The first name of the provider.                                                        |           |
| middle_name               | {string}          | The middle name of the provider.                                                       |           |
| prefix                    | {string}          | The prefix of the provider.                                                            |           |
| suffix                    | {string}          | The suffix of the provider.                                                            |           |
| ssn                       | {string}          | The SSN of the provider.                                                               |           |
| service_provider_number   | {string}          | The provider service number.                                                           |           |
| npi_id                    | {string}          | The NPI id of the provider.                                                            |           |
| tax_id                    | {string}          | The tax id of the provider.                                                            |           |
| address                   | Address SubSchema | The address of the provider. See the address subschema.                                |           |

##Validation Codes

<a name="api_relationship_codes">

| API_RELATIONSHIPS           (<a href="#benefits_enrollment">back</a>) |
|:----------------------------------------------------------------------|
| spouse                                                                |
| father                                                                |
| mother                                                                |
| grandfather                                                           |
| grandmother                                                           |
| grandson                                                              |
| granddaughter                                                         |
| aunt                                                                  |
| uncle                                                                 |
| nephew                                                                |
| niece                                                                 |
| cousin                                                                |
| adopted_child                                                         |
| foster_child                                                          |
| son_in_law                                                            |
| daughter_in_law                                                       |
| brother_in_law                                                        |
| sister_in_law                                                         |
| mother_in_law                                                         |
| father_in_law                                                         |
| brother                                                               |
| sister                                                                |
| ward                                                                  |
| step_parent                                                           |
| step_son                                                              |
| step_daughter                                                         |
| self                                                                  |
| child                                                                 |
| sponsored_dependent                                                   |
| dependent_of_minor_dependent                                          |
| ex_spouse                                                             |
| guardian                                                              |
| court_appointed_guardian                                              |
| collateral_dependent                                                  |
| life_partner                                                          |
| annuitant                                                             |
| trustee                                                               |
| other_relationship                                                    |
| other_relative                                                        |

<a name="coverage_level">

| COVERAGE_LEVEL_CODES      (<a href="#benefits_enrollment">back</a>) |
|:--------------------------------------------------------------------|
| Children Only                                                       |
| Dependents Only                                                     |
| Employee and One Dependent                                          |
| Employee and Two Dependents                                         |
| Employee and Three Dependents                                       |
| Employee and One or More Dependents                                 |
| Employee and Two or More Dependents                                 |
| Employee and Three or More Dependents                               |
| Employee and Four or More Dependents                                |
| Employee and Five or More Dependents                                |
| Employee and Children                                               |
| Employee Only                                                       |
| Employee and Spouse                                                 |
| Family                                                              |
| Individual                                                          |
| Spouse and Children                                                 |
| Spouse Only                                                         |
| Two Party                                                           |

<a name="purpose_codes"/>

| PURPOSE_CODES   (<a href="#benefits_enrollment">back</a>) |
|:----------------------------------------------------------|
| Original                                                  |
| Re-Submission                                             |
| Information Copy                                          |

<a name="action_codes">

| ACTION_CODES (<a href="#benefits_enrollment">back</a>) |
|:-------------------------------------------------------|
| Change                                                 |
| Verify                                                 |
| Replace                                                |

<a name="gender_codes">

| GENDER_CODES (<a href="#benefits_enrollment">back</a>) |
|:-------------------------------------------------------|
| Female                                                 |
| Male                                                   |
| Unknown                                                |

<a name="maintenance_type_codes">

| MAINTENANCE_TYPE_CODES          (<a href="#benefits_enrollment">back</a>) |
|:--------------------------------------------------------------------------|
| Change                                                                    |
| Delete                                                                    |
| Addition                                                                  |
| Cancellation or Termination                                               |
| Reinstatement                                                             |
| Correction                                                                |
| Audit or Compare                                                          |
| Employee Information Not Applicable                                       |

<a name="maintenance_reason_codes">

| REASON_CODES          (<a href="#benefits_enrollment">back</a>)      |
|:---------------------------------------------------------------------|
| Divorce                                                              |
| Birth                                                                |
| Death                                                                |
| Retirement                                                           |
| Adoption                                                             |
| Strike                                                               |
| Termination of Benefits                                              |
| Termination of Employment                                            |
| Consolidation Omnibus Budget Reconciliation Act (COBRA)              |
| Consolidation Omnibus Budget Reconciliation Act (COBRA) Premium Paid |
| Surviving Spouse                                                     |
| Voluntary Withdrawal                                                 |
| Primary Care Provider (PCP) Change                                   |
| Quit                                                                 |
| Fired                                                                |
| Suspended                                                            |
| Active                                                               |
| Disability                                                           |
| Plan Change                                                          |
| Change in Identifying Data Elements                                  |
| Declined Coverage                                                    |
| Pre-Enrollment                                                       |
| Initial Enrollment                                                   |
| Benefit Selection                                                    |
| Legal Separation                                                     |
| Marriage                                                             |
| Personnel Data                                                       |
| Leave of Absence with Benefits                                       |
| Leave of Absence without Benefits                                    |
| Lay Off with Benefits                                                |
| Lay Off without Benefits                                             |
| Re-enrollment                                                        |
| Change of Location                                                   |
| Non Payment                                                          |

<a name="benefit_status_codes">

| BENEFIT_STATUS_CODES            (<a href="#benefits_enrollment">back</a>) |
|:--------------------------------------------------------------------------|
| Active                                                                    |
| Consolidated Omnibus Budget Reconciliation Act (COBRA)                    |
| Surviving Insured                                                         |
| Tax Equity and Fiscal Responsibility Act (TEFRA)                          |

<a name="medicare_plan_codes">

| MEDICARE_PLAN_CODES  (<a href="#benefits_enrollment">back</a>) |
|:---------------------------------------------------------------|
| Medicare Part A                                                |
| Medicare Part B                                                |
| Medicare Part A and B                                          |
| Medicare                                                       |
| No Medicare                                                    |

<a name="medicare_eligibility_reason_codes">

| MEDICARE_ELIGIBILITY_REASON_CODES (<a href="#benefits_enrollment">back</a>) |
|:----------------------------------------------------------------------------|
| Age                                                                         |
| Disability                                                                  |
| End Stage Renal Disease (ESRD)                                              |

<a name="cobra_qualifying_event_codes">

| COBRA_QUALIFYING_EVENT_CODES           (<a href="#benefits_enrollment">back</a>) |
|:---------------------------------------------------------------------------------|
| Termination of Employment                                                        |
| Reduction of work hours                                                          |
| Medicare                                                                         |
| Death                                                                            |
| Divorce                                                                          |
| Separation                                                                       |
| Ineligible Child                                                                 |
| """Bankruptcy of Retirees Former Employer ( U.S.C. B(f)()(F))"""                 |
| Layoff                                                                           |
| Leave of Absence                                                                 |
| ZZ Mutually Defined                                                              |

<a name="employment_status_codes">

| EMPLOYMENT_STATUS_CODES  (<a href="#benefits_enrollment">back</a>) |
|:-------------------------------------------------------------------|
| Active                                                             |
| Active Military - Overseas                                         |
| Active Military - USA                                              |
| Full-time                                                          |
| Leave of Absence                                                   |
| Part-time                                                          |
| Retired                                                            |
| Terminated                                                         |

<a name="student_status">

| STUDENT_STATUS_CODES (<a href="#benefits_enrollment">back</a>) |
|:---------------------------------------------------------------|
| Full-time                                                      |
| Not a Student                                                  |
| Part-time                                                      |

<a name="insurance_line_codes">

| INSURANCE_LINE_CODES      (<a href="#benefits_enrollment">back</a>) |
|:--------------------------------------------------------------------|
| Preventative Care/Wellness                                          |
| 24 Hour Care                                                        |
| Medicare Risk                                                       |
| Mental Health                                                       |
| Dental Capitation                                                   |
| Dental                                                              |
| Exclusive Provider Organization                                     |
| Facility                                                            |
| Hearing                                                             |
| Health                                                              |
| Health Maintenance Organization                                     |
| Long-Term Care                                                      |
| Long-Term Disability                                                |
| Major Medical                                                       |
| Mail Order Drug                                                     |
| Prescription Drug                                                   |
| Point of Service                                                    |
| Preferred Provider Organization                                     |
| Practitioners                                                       |
| Short-Term Disability                                               |
| Utilization Review                                                  |
| Vision                                                              |

<a name="payer_responsibility_codes">

| PAYER_RESPONSIBILITY_CODES (<a href="#benefits_enrollment">back</a>) |
|:---------------------------------------------------------------------|
| Primary                                                              |
| Secondary                                                            |
| Tertiary                                                             |
| Unknown                                                              |

<a name="api_coordination_of_benefits">

| API_COORDINATION_OF_BENEFITS_STATUS (<a href="#benefits_enrollment">back</a>) |
|:------------------------------------------------------------------------------|
| coordination_of_benefits                                                      |
| no_coordination_of_benefits                                                   |
| unknown                                                                       |

<a name="marital_status_codes">

| MARITAL_STATUS_CODES               (<a href="#benefits_enrollment">back</a>) |
|:-----------------------------------------------------------------------------|
| Widowed                                                                      |
| Legally Separated                                                            |
| Registered Domestic Partner                                                  |
| Divorced                                                                     |
| Single                                                                       |
| Married                                                                      |
| Unreported                                                                   |
| Separated                                                                    |
| Unmarried (Single or Divorced or Widowed)                                    |

<a name="ethnicity_codes">

| ETHNICITY_CODES         (<a href="#benefits_enrollment">back</a>) |
|:------------------------------------------------------------------|
| Not Provided                                                      |
| Not Applicable                                                    |
| Asian or Pacific Islander                                         |
| Black                                                             |
| Caucasian                                                         |
| Subcontinent Asian American                                       |
| Other Race or Ethnicity                                           |
| Asian Pacific American                                            |
| Native American                                                   |
| Hispanic                                                          |
| American Indian or Alaskan Native                                 |
| Native Hawaiian                                                   |
| Black (Non-Hispanic)                                              |
| White (Non-Hispanic)                                              |
| Pacific Islander                                                  |
| Mutually Defined                                                  |

<a name="citizenship_status_codes">

| CITIZENSHIP_STATUS_CODES  (<a href="#benefits_enrollment">back</a>) |
|:--------------------------------------------------------------------|
| U.S. Citizen                                                        |
| Non-Resident Alien                                                  |
| Resident Alien                                                      |
| Illegal Alien                                                       |
| Alien                                                               |
| U.S. Citizen - Non-Resident                                         |
| U.S. Citizen - Resident                                             |

<a name="employment_class_codes">

| EMPLOYMENT_CLASS_CODES (<a href="#benefits_enrollment">back</a>) |
|:-----------------------------------------------------------------|
| Union                                                            |
| Non-Union                                                        |
| Executive                                                        |
| Non-Executive                                                    |
| Management                                                       |
| Non-Management                                                   |
| Hourly                                                           |
| Salaried                                                         |
| Administrative                                                   |
| Non-Administrative                                               |
| Exempt                                                           |
| Non-Exempt                                                       |
| Highly Compensated                                               |
| Key-Employee                                                     |
| Bargaining                                                       |
| Non-Bargaining                                                   |
| Owner                                                            |
| President                                                        |
| Vice President                                                   |

<a name="wages_paid_frequency_codes">

| WAGES_PAID_FREQUENCY_CODES  (<a href="#benefits_enrollment">back</a>) |
|:----------------------------------------------------------------------|
| Weekly                                                                |
| Biweekly                                                              |
| Semimonthly                                                           |
| Monthly                                                               |
| Daily                                                                 |
| Annual                                                                |
| Two Calendar Months                                                   |
| Lump-Sum Separation Allowance                                         |
| Year-to-Date                                                          |
| Single                                                                |
| Hourly                                                                |
| Quarterly                                                             |
| Semiannual                                                            |
| Unknown                                                               |

<a name="communication_type_codes">

| COMMUNICATION_TYPE_CODES (<a href="#benefits_enrollment">back</a>) |
|:-------------------------------------------------------------------|
| Electronic Mail                                                    |
| Telephone Extension                                                |
| Facsimile                                                          |
| Telephone                                                          |
| Home Phone Number                                                  |
| Work Phone Number                                                  |
| Cellular Phone                                                     |
| Beeper Number                                                      |
| Alternate Telephone                                                |

<a name="entity_type_codes">

| ENTITY_TYPE_CODES (<a href="#benefits_enrollment">back</a>) |
|:------------------------------------------------------------|
| Person                                                      |
| Non-Person Entity                                           |
