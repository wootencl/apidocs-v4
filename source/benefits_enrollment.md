# Benefits Enrollment Overview

## JSON Schema for 834 Benefits Enrollment
| Name                 | Type                     | Required? | String Validation Codes |
|:---------------------|:-------------------------|:----------|:------------------------|
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
| Name   | Type     | Required? | String Validation Codes |
|:-------|:---------|:----------|:------------------------|
name|{string}||
tax_id|{string}||

### Sponsor Subschema
| Name   | Type     | Required? | String Validation Codes |
|:-------|:---------|:----------|:------------------------|
name|{string}||
tax_id|{string}||

### Broker Subschema
| Name            | Type     | Required? | String Validation Codes |
|:----------------|:---------|:----------|:------------------------|
name|{string}||
tax_id|{string}||
account_numbers|{string}||

### Member Subschema
| Name                        | Type                      | Required?                                                        | String Validation Codes |
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
| Name        | Type     | Required? | String Validation Codes |
|:------------|:---------|:----------|:-------|
line|{string}|Yes|
line2|{string}||
city|{string}|Yes|
state|{string}||
postal_code|{string}||
country|{string}||
county|{string}||

#### Medicare Subschema
| Name               | Type     | Required? | String Validation Codes |
|:-------------------|:---------|:----------|:------------------------|
plan|{string}|Yes|DOMAIN_MEDICARE_PLAN_CODES
eligibility_reason|{string}||DOMAIN_MEDICARE_ELIGIBILITY_REASON_CODES

#### School Subschema
| Name | Type     | Required? | String Validation Codes |
|:-----|:---------|:----------|:------------------------|
name|{string}||

#### Contact Subschema
| Name                         | Type     | Required? | String Validation Codes |
|:-----------------------------|:---------|:----------|:------------------------|
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
| Name                        | Type                                       | Required? | String Validation Codes |
|:----------------------------|:-------------------------------------------|:----------|:------------------------|
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
| Name                   | Type     | Required? | String Validation Codes |
|:-----------------------|:---------|:----------|:------------------------|
payer_responsibility|{string}|Yes|DOMAIN_PAYER_RESPONSIBILITY_CODES
group_or_policy_number|{string}||
status|{string}|Yes|DOMAIN_COORDINATION_OF_BENEFITS_CODES

##### Provider Subschema
| Name                      | Type              | Required? | String Validation Codes |
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
|:-----------------------------|
|spouse |
