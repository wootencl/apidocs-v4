# Benefits Enrollment Overview

## JSON Schema for 834 Benefits Enrollment
| Parameters          | Type                     | Required? | String Validation Codes |
|:--------------------|:-------------------------|:----------|:------------------------|
reference_number|{string}|Yes|
purpose|{string}|Yes|DOMAIN_PURPOSE_CODES
action|{string}|Yes|DOMAIN_ACTION_CODES
master_policy_number|{string}||
payer|Payer Subschema|Yes|
sponsor|Sponser Subschema|Yes|
broker|Broker SubSchema||
tpa|Broker SubSchema||
subscriber|Member Subschema|Yes|
dependents|List of Member Subschema||
application_data|Dict||

### Payer Subschema
| Parameters   | Type     | Required? | String Validation Codes |
|:-------------|:---------|:----------|:------------------------|
name|{string}||
tax_id|{string}||

### Sponsor Subschema
| Parameters   | Type     | Required? | String Validation Codes |
|:-------------|:---------|:----------|:------------------------|
name|{string}||
tax_id|{string}||

### Broker Subschema
| Parameters   | Type     | Required? | String Validation Codes |
|:-------------|:---------|:----------|:------------------------|
name|{string}||
tax_id|{string}||
account_numbers|{string}||

### Member Subschema
| Parameters              | Type                      | Required?                                                        | String Validation Codes |
|:----------------------------|:--------------------------|:-----------------------------------------------------------------|:------------------------|
name|{string}||
last_name|{string}||
first_name|{string}||
middle_name|{string}||
suffix|{string}||
address|Address Subschema||
ssn|{string}||
member_id|{string}||
subscriber_number|{string}||
gender:|{string}||DOMAIN_GENDER_CODES
group_or_policy_number|{string}||
relationship|{string}||DOMAIN_MEMBER_RELATIONSHIP_CODES
maintenance_type|{string}||DOMAIN_MAINTENANCE_TYPE_CODES
maintenance_reason|{string}||DOMAIN_MAINTENANCE_REASON_CODES
benefit_status|{string}||DOMAIN_BENEFIT_STATUS_CODES
employment_status|{string}||DOMAIN_EMPLOYMENT_STATUS_CODES
student_status|{string}||DOMAIN_STUDENT_STATUS_CODES
marital_status|{string}||DOMAIN_MARITAL_STATUS_CODES
citizenship_status|{string}||DOMAIN_CITIZENSHIP_STATUS_CODES
ethnicity|{string}||DOMAIN_ETHNICITY_CODES
handicapped|Bool (Default: False)||
cobra_qualifying_event|{string}||DOMAIN_COBRA_QUALIFYING_EVENT_CODES
confidentiality|{string}||
medicare|Medicare SubSchema||
school|School SubSchema||
eligibility_begin_date|datetime||
eligibility_end_date|datetime||
education_end_date|datetime||
birth_date|datetime||
birth_sequence|int|#Required when reporting family members with the same birth date|
death_date|datetime|#Member Individual Death Date|
contacts:|List of Contact SubSchema||
employment_classes|List of String||DOMAIN_EMPLOYMENT_CLASS_CODES
wages_amount|Monetary Amount Schema||
wages_paid_frequency|{string}||DOMAIN_WAGES_PAID_FREQUENCY_CODES
spend_down_amount|Monetary Amount Schema||
premium_amount|Monetary Amount Schema||
expected_expenditure_amount|Monetary Amount Schema| |
deductible_amount|Monetary Amount Schema||
copayment_amount|Monetary Amount Schema||
coinsurance_amount’|Monetary Amount Schema||
substance_abuse|Bool (Default: False)||
tobacco_use|Bool (Default: False)||
height|{string}||
weight|{string}||
benefits|List of Coverage Schema||
maintenance_effective_date|datetime||

#### Address Subschema
| Parameter   | Type     | Required? | String Validation Codes |
|:------------|:---------|:----------|:-------|
line|{string}|Yes|
line2|{string}||
city|{string}|Yes|
state|{string}||
postal_code|{string}||
country|{string}||
county|{string}||

#### Medicare Subschema
| Parameters      | Type     | Required? | String Validation Codes |
|:----------------|:---------|:----------|:------------------------|
plan|{string}|Yes|DOMAIN_MEDICARE_PLAN_CODES
eligibility_reason|{string}||DOMAIN_MEDICARE_ELIGIBILITY_REASON_CODES

#### School Subschema
| Parameters | Type     | Required? | String Validation Codes |
|:-----------|:---------|:----------|:------------------------|
name|{string}||

#### Contact Subschema
| Parameters              | Type     | Required? | String Validation Codes |
|:------------------------|:---------|:----------|:------------------------|
name|{string}||
primary_communication_type|{string}|yes|COMMUNICATION_TYPE_CODES
primary_communication_number|{string}|yes|
communication_type2|{string}||COMMUNICATION_TYPE_CODES
‘communication_number2|{string}||
communication_type3|{string}||COMMUNICATION_TYPE_CODES
communication_number3|{string}||

#### Monetary Amount Subschema
| Name                                   | Type | Required? | String Validation Codes |
|:---------------------------------------|:-----|:----------|:------------------------|
Fix Me! Get the Monetary Amount Schema|||

#### Coverage Subschema
| Parameters           | Type                                       | Required? | String Validation Codes |
|:---------------------|:-------------------------------------------|:----------|:------------------------|
maintenance_type|{string}|Yes|DOMAIN_MAINTENANCE_TYPE_CODES
benefit_type|{string}||DOMAIN_INSURANCE_LINE_CODES
description|{string}||
coverage_level|{string}||COVERAGE_LEVEL_CODES
late_enrollment|Bool (Default : False)||
begin_date |datetime||
end_date|datetime||
enrollment_signature_date|datetime||
maintenance_effective_date|datetime||
premium_paid_to_date|datetime||
last_premium_paid_date|datetime||
spend_down_amount|Monetary Amount SubSchema||
premium_amount|Monetary Amount SubSchema||
expected_expenditure_amount|Monetary Amount SubSchema||
deductible_amount|Monetary Amount SubSchema||
copayment_amount|Monetary Amount SubSchema||
coinsurance_amount|Monetary Amount SubSchema||
coordination_of_benefits|List of Coordination of Benefits SubSchema||
providers|List of Provider SubSchema||


##### Coordination of Benefits Subschema
| Parameters             | Type     | Required? | String Validation Codes |
|:-----------------------|:---------|:----------|:------------------------|
payer_responsibility|{string}|Yes|DOMAIN_PAYER_RESPONSIBILITY_CODES
group_or_policy_number|{string}||
status|{string}|Yes|DOMAIN_COORDINATION_OF_BENEFITS_CODES

##### Provider Subschema
| Parameters                | Type              | Required? | String Validation Codes |
|:--------------------------|:------------------|:----------|:------------------------|
type|{string}|Yes|DOMAIN_PROVIDER_TYPE_CODES
entity_type|{string}|Yes|ENTITY_TYPE_CODES
patient_status|{string}||DOMAIN_ESTABLISHED_PATIENT_CODES
last_or_organization_name|{string}||
first_name|{string}||
middle_name|{string}||
prefix|{string}||
suffix|{string}||
ssn|{string}||
service_provider_number|{string}||
npi_id|{string}||
tax_id|{string}||
address’|Address SubSchema||


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

