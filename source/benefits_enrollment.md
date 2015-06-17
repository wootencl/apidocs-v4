# Benefits Enrollment Overview

## JSON Schema for 834 Benefits Enrollment
| Parameters          | Type                     | Description | Required? |
|:--------------------|:-------------------------|:------------|:----------|
reference_number|{string}|The reference number for the transaction. |Yes|
purpose|{string}|"See ""Purpose Codes"" table below."|Yes|
action|{string}|"See ""Action Codes"" table below."|Yes|
master_policy_number|{string}|If applicable the master policy number for the account.|No|
payer|Payer Subschema|"See the ""Payer"" subschema below."|Yes|
sponsor|Sponser Subschema|"See the ""Sponser"" subschema below."|Yes|
broker|Broker SubSchema|"See the ""Broker"" subschema below."|No|
tpa|Broker SubSchema|"See the ""Broker"" subschema below."|No|
subscriber|Member Subschema|"See the ""Member"" subschema below."|Yes|
dependents|List of Member Subschema|"See the ""Member"" subschema below."|No|
application_data|Dict|"See ""Application Data"" in Common to all Requests."|No|

### Payer Subschema
| Parameters   | Type     | Description | Required? |
|:-------------|:---------|:------------|:----------|
name|{string}|The name of of the carrier/payer. |
tax_id|{string}|The tax ID of the carrier/payer. |

### Sponsor Subschema
| Parameters   | Type     | Description | Required? |
|:-------------|:---------|:------------|:----------|
name|{string}|The name of the sponser. |
tax_id|{string}|The tax ID of the sponser.|

### Broker Subschema
| Parameters   | Type     | Description | Required? |
|:-------------|:---------|:------------|:----------|
name|{string}|The name of the broker. |
tax_id|{string}|The tax ID of the broker.|
account_numbers|{string}|The account number of the broker. |

### Member Subschema
| Parameters              | Type                      | Description      | Required?                 |
|:------------------------|:--------------------------|:-----------------|:--------------------------|
name|{string}|The name of the member.|
last_name|{string}|The last name of the member.|
first_name|{string}|The first name of the member.|
middle_name|{string}|The middle name of the subscriber.|
suffix|{string}|The suffix of the subscriber.|
address|Address Subschema|"See the ""Address"" subschema below."|
ssn|{string}|The social security number of the subscriber. |
member_id|{string}|The memeber ID of the subscriber where applicable. |
subscriber_number|{string}|The subscriber number of the subscriber. |
gender:|{string}|"See ""Gender Codes"" table below."|
group_or_policy_number|{string}|The group or policy number.|
relationship|{string}|"See ""Member Relationship Codes"" table below."|
maintenance_type|{string}|"See ""Maintenance Codes"" table below."|
maintenance_reason|{string}|"See ""Maintenance Reason Codes"" table below."|
benefit_status|{string}|"See ""Benefit Status Codes"" table below."|
employment_status|{string}|"See ""Employment Status Codes"" table below."|
student_status|{string}|"See ""Student Status Codes"" table below."|
marital_status|{string}|"See ""Marital Status Codes"" table below."|
citizenship_status|{string}|"See ""Citizenship Status Codes"" table below."|
ethnicity|{string}|"See ""Ethnicity Codes"" table below."|
handicapped|Bool (Default: False)|If the subscriber is handicapped it would need to be defined as True. The default is false for this parameter. |
cobra_qualifying_event|{string}|"See ""Cobra Qualifying Event Codes"" table below."|
confidentiality|{string}||
medicare|Medicare SubSchema|"See the ""Medicare"" subschema below."|
school|School SubSchema|"See the ""School"" subschema below."|
eligibility_begin_date|Datetime|The eligibility begin date for the subscriber. |
eligibility_end_date|Datetime|The eligibility end date for the subscriber. |
education_end_date|Datetime|The education end date for the subscriber. |
birth_date|Datetime|The birthdate of the subscriber. |
birth_sequence|Int|The birth sequence of the subscriber. This is only required when family members have the same birth date. |#Required when reporting family members with the same birth date
death_date|Datetime|The death date of the subscriber. |#Member Individual Death Date
contacts:|List of Contact SubSchema|"See the ""Contact"" subschema below."|
employment_classes|List of String|"See ""Employment Class Codes"" table below."|
wages_amount|Monetary Amount Schema|"See the ""Monetary"" subschema below."|
wages_paid_frequency|{string}|"See ""Wages Paid Frequency Codes"" table below"|
spend_down_amount|Monetary Amount Schema|"See the ""Monetary Amount"" subschema below."|
premium_amount|Monetary Amount Schema|"See the ""Monetary Amount"" subschema below."|
expected_expenditure_amount|Monetary Amount Schema|"See the ""Monetary Amount"" subschema below."| 
deductible_amount|Monetary Amount Schema|"See the ""Monetary Amount"" subschema below."|
copayment_amount|Monetary Amount Schema|"See the ""Monetary Amount"" subschema below."|
coinsurance_amount’|Monetary Amount Schema|"See the ""Monetary Amount"" subschema below."|
substance_abuse|Bool (Default: False)|If the subscriber has a substance abuse this parameter would need to be defined as True. The default is False for this parameter. |
tobacco_use|Bool (Default: False)|If the subscriber uses tobacco this parameter would need to be defined as True. The default is False for this parameter. |
height|{string}|The height of the subscriber. |
weight|{string}|The weight of the subscriber. |
benefits|List of Coverage SubSchema|"See the ""Coverage"" subschema below."|
maintenance_effective_date|datetime|The maintenance effective date of the subscriber. |


#### Address Subschema
| Parameter   | Type     | Description | Required? |
|:------------|:---------|:------------|:----------|
line|{string}|The first address line of the subsriber. |Yes
line2|{string}|The second address line of the subscriber. |
city|{string}|The city of the subscriber. |Yes
state|{string}|The state of the subscriber. |
postal_code|{string}|The postal code of the subscriber. |
country|{string}|The country of the subscriber. |
county|{string}|The county of the subscriber. |

#### Medicare Subschema
| Parameters      | Type     | Description | Required? |
|:----------------|:---------|:------------|:----------|
plan|{string}|"See ""Medicare Plan Codes"" table below."|Yes
eligibility_reason|{string}|"See ""Medicare Eligiblity Reason Codes"" table below."|

#### School Subschema
| Parameters | Type     | Description | Required? |
|:-----------|:---------|:------------|:----------|
name|{string}|The name of the subscribers school. |

#### Contact Subschema
| Parameters              | Type     | Description | Required? |
|:------------------------|:---------|:------------|:-----------|
name|{string}|?|
primary_communication_type|{string}|"See ""Communication Type Codes"" table below."|Yes
primary_communication_number|{string}|The primary communication number for the subscriber. |Yes
communication_type2|{string}|"See ""Communication Type Codes"" table below."|
‘communication_number2|{string}|The secondary communication number for the subscriber. |
communication_type3|{string}|"See ""Communication Type Codes"" table below."|
communication_number3|{string}|The tertiary communication number for the subscriber. |


#### Monetary Amount Subschema
| Parameters                             | Type | Description | Required? |
|:---------------------------------------|:-----|:------------|:----------|
Fix Me! Get the Monetary Amount Schema|||

#### Coverage Subschema
| Parameters           | Type                                       | Description | Required? |
|:---------------------|:-------------------------------------------|:------------|:----------|
maintenance_type|{string}|"See ""Maintenance Type Codes"" table below."|Yes
benefit_type|{string}|"See ""Insurance Line Codes"" table below."|
description|{string}|(?)|
coverage_level|{string}|"See ""Coverage Level Codes"" table below."|
late_enrollment|Bool (Default : False)|If the subscriber is a late enrollee it would need to be defined as True. The default is False for this parameter. |
begin_date |datetime|The begining date of coverage for the subscriber. |
end_date|datetime|The end date of coverage for the subscriber. |
enrollment_signature_date|datetime|The enrollment signature date for the subscriber. (?)|
maintenance_effective_date|datetime|The maitenance effective date for the subscriber. |
premium_paid_to_date|datetime|The premuim paid to date for the subscriber. (?)|
last_premium_paid_date|datetime|The last premuum paid date for the subscriber. (?)|
spend_down_amount|Monetary Amount SubSchema|"See the ""Monetary Amount"" subschema below."|
premium_amount|Monetary Amount SubSchema|"See the ""Monetary Amount"" subschema below."|
expected_expenditure_amount|Monetary Amount SubSchema|"See the ""Monetary Amount"" subschema below."|
deductible_amount|Monetary Amount SubSchema|"See the ""Monetary Amount"" subschema below."|
copayment_amount|Monetary Amount SubSchema|"See the ""Monetary Amount"" subschema below."|
coinsurance_amount|Monetary Amount SubSchema|"See the ""Monetary Amount"" subschema below."|
coordination_of_benefits|List of Coordination of Benefits SubSchema|"See the ""Coordination of Benefits"" subschema below."|
providers|List of Provider SubSchema|"See the ""Provider"" subschema below."|



##### Coordination of Benefits Subschema
| Parameters                | Type              | Description | Required? |
|:--------------------------|:------------------|:------------|:----------|
payer_responsibility|{string}|"See ""Payer Responsibility Codes"" table below."|Yes
group_or_policy_number|{string}|The group or policy number for the subscribers additional plan. |
status|{string}|"See ""Coordination of Benefits Codes"" table below."|Yes

##### Provider Subschema
| Parameters                | Type              | Description | Required? |
|:--------------------------|:------------------|:------------|:----------|
type|{string}|"See ""Domain Provider Type Codes"" table below."|Yes
entity_type|{string}|"See ""Entity Type Codes"" table below."|Yes
patient_status|{string}|"See ""Established Patient Codes"" table below."|
last_or_organization_name|{string}|Last name of the provider or the name of the organization. |
first_name|{string}|The first name of the provider. ?|
middle_name|{string}|The middle name of the provider. ?|
prefix|{string}|The prefix of the provider. ?|
suffix|{string}|The suffix of the provider. ?|
ssn|{string}|The SSN of the provider?|
service_provider_number|{string}|The service provider number. |
npi_id|{string}|The NPI ID of the provider. |
tax_id|{string}|The tax ID of the provider. |
address’|Address SubSchema|"See the ""Address"" subschema below."|


##
##Validation Codes

|API_RELATIONSHIPS|
|:----------------|
|spouse|
|father |
|mother |
|grandfather|
|grandmother |
|grandson |
|granddaughter |
|aunt |
|uncle |
|nephew |
|niece |
|cousin |
|adopted_child |
|foster_child |
|son_in_law |
|daughter_in_law |
|brother_in_law |
|sister_in_law |
|mother_in_law |
|father_in_law |
|brother |
|sister |
|ward |
|step_parent |
|step_son |
|step_daughter |
|self |
|child |
|sponsored_dependent |
|dependent_of_minor_dependent |
|ex_spouse |
|guardian |
|court_appointed_guardian |
|collateral_dependent |
|life_partner |
|annuitant |
|trustee |
|other_relationship |
|other_relative |

|COVERAGE_LEVEL_CODES|
|:-------------------|
|Children Only|
|Dependents Only|
|Employee and One Dependent|
|Employee and Two Dependents|
|Employee and Three Dependents|
|Employee and One or More Dependents|
|Employee and Two or More Dependents|
|Employee and Three or More Dependents|
|Employee and Four or More Dependents|
|Employee and Five or More Dependents|
|Employee and Children|
|Employee Only|
|Employee and Spouse|
|Family|
|Individual|
|Spouse and Children|
|Spouse Only|
|Two Party|

|DOMAIN_PURPOSE_CODES|
|:-------------------|
|Original|
|Re-Submission|
|Information Copy|

|DOMAIN_ACTION_CODES|
|:------------------|
|Change|
|Verify|
|Replace|

|DOMAIN_GENDER_CODES|
|:------------------|
|Female|
|Male|
|Unknown|

|DOMAIN_MAINTENANCE_TYPE_CODES|
|:----------------------------|
|Change|
|Delete|
|Addition|
|Cancellation or Termination|
|Reinstatement|
|Correction|
|Audit or Compare|
|Employee Information Not Applicable|

|DOMAIN_MAINTENANCE_REASON_CODES|
|:------------------------------|
|Divorce|
|Birth|
|Death|
|Retirement|
|Adoption|
|Strike|
|Termination of Benefits|
|Termination of Employment|
|Consolidation Omnibus Budget Reconciliation Act (COBRA)|
|Consolidation Omnibus Budget Reconciliation Act (COBRA) Premium Paid|
|Surviving Spouse|
|Voluntary Withdrawal|
|Primary Care Provider (PCP) Change|
|Quit|
|Fired|
|Suspended|
|Active|
|Disability|
|Plan Change|
|Change in Identifying Data Elements|
|Declined Coverage|
|Pre-Enrollment|
|Initial Enrollment|
|Benefit Selection|
|Legal Separation|
|Marriage|
|Personnel Data|
|Leave of Absence with Benefits|
|Leave of Absence without Benefits|
|Lay Off with Benefits|
|Lay Off without Benefits|
|Re-enrollment|
|Change of Location|
|Non Payment|

|DOMAIN_BENEFIT_STATUS_CODES|
|:--------------------------|
|Active|
|Consolidated Omnibus Budget Reconciliation Act (COBRA)|
|Surviving Insured|
|Tax Equity and Fiscal Responsibility Act (TEFRA)|

|DOMAIN_MEDICARE_PLAN_CODES|
|:-------------------------|
|Medicare Part A|
|Medicare Part B|
|Medicare Part A and B|
|Medicare|
|No Medicare|

|DOMAIN_MEDICARE_ELIGIBILITY_REASON_CODES|
|:---------------------------------------|
|Age|
|Disability|
|End Stage Renal Disease (ESRD)|

|DOMAIN_COBRA_QUALIFYING_EVENT_CODES|
|:----------------------------------|
|Termination of Employment|
|Reduction of work hours|
|Medicare|
|Death|
|Divorce|
|Separation|
|Ineligible Child|
|"""Bankruptcy of Retirees Former Employer ( U.S.C. B(f)()(F))"""|
|Layoff|
|Leave of Absence|
|ZZ Mutually Defined|

|DOMAIN_EMPLOYMENT_STATUS_CODES|
|:-----------------------------|
|Active|
|Active Military - Overseas|
|Active Military - USA|
|Full-time|
|Leave of Absence|
|Part-time|
|Retired|
|Terminated|

|DOMAIN_STUDENT_STATUS_CODES|
|:--------------------------|
|Full-time|
|Not a Student|
|Part-time|

|DOMAIN_INSURANCE_LINE_CODES|
|:--------------------------|
|Preventative Care/Wellness|
|24 Hour Care|
|Medicare Risk|
|Mental Health|
|Dental Capitation|
|Dental|
|Exclusive Provider Organization|
|Facility|
|Hearing|
|Health|
|Health Maintenance Organization|
|Long-Term Care|
|Long-Term Disability|
|Major Medical|
|Mail Order Drug|
|Prescription Drug|
|Point of Service|
|Preferred Provider Organization|
|Practitioners|
|Short-Term Disability|
|Utilization Review|
|Vision|

|DOMAIN_PAYER_RESPONSIBILITY_CODES|
|:--------------------------------|
|Primary|
|Secondary|
|Tertiary|
|Unknown|


|API_COORDINATION_OF_BENEFITS_STATUS|
|:----------------------------------|
|coordination_of_benefits |
|no_coordination_of_benefits|
|unknown |

|DOMAIN_MARITAL_STATUS_CODES|
|:--------------------------|
|Widowed|
|Legally Separated|
|Registered Domestic Partner|
|Divorced|
|Single|
|Married|
|Unreported|
|Separated|
|Unmarried (Single or Divorced or Widowed)|

|DOMAIN_ETHNICITY_CODES|
|:---------------------|
|Not Provided|
|Not Applicable|
|Asian or Pacific Islander|
|Black|
|Caucasian|
|Subcontinent Asian American|
|Other Race or Ethnicity|
|Asian Pacific American|
|Native American|
|Hispanic|
|American Indian or Alaskan Native|
|Native Hawaiian|
|Black (Non-Hispanic)|
|White (Non-Hispanic)|
|Pacific Islander|
|Mutually Defined|

|DOMAIN_CITIZENSHIP_STATUS_CODES|
|:------------------------------|
|U.S. Citizen|
|Non-Resident Alien|
|Resident Alien|
|Illegal Alien|
|Alien|
|U.S. Citizen - Non-Resident|
|U.S. Citizen - Resident|

|DOMAIN_EMPLOYMENT_CLASS_CODES|
|:----------------------------|
|Union|
|Non-Union|
|Executive|
|Non-Executive|
|Management|
|Non-Management|
|Hourly|
|Salaried|
|Administrative|
|Non-Administrative|
|Exempt|
|Non-Exempt|
|Highly Compensated|
|Key-Employee|
|Bargaining|
|Non-Bargaining|
|Owner|
|President|
|Vice President|

|DOMAIN_WAGES_PAID_FREQUENCY_CODES|
|:--------------------------------|
|Weekly|
|Biweekly|
|Semimonthly|
|Monthly|
|Daily|
|Annual|
|Two Calendar Months|
|Lump-Sum Separation Allowance|
|Year-to-Date|
|Single|
|Hourly|
|Quarterly|
|Semiannual|
|Unknown|

|COMMUNICATION_TYPE_CODES|
|:-----------------------|
|Electronic Mail|
|Telephone Extension|
|Facsimile|
|Telephone|
|Home Phone Number|
|Work Phone Number|
|Cellular Phone|
|Beeper Number|
|Alternate Telephone|

|ENTITY_TYPE_CODES|
|:----------------|
|Person|
|Non-Person Entity|

