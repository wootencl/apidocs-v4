# Benefits Enrollment Overview

words...

## JSON Schema for 834 Benefits Enrollment
Name             | Type          | Required? | Values
-----------------|---------------|-----------|-------
reference_number|{string}|Yes|
purpose|{string}|Yes|
action|{string}|Yes|
master_policy_number|{string}||
payer|Payer Subschema|Yes|
sponsor|Sponser Subschema|Yes|
broker|Broker SubSchema||
tpa|Broker SubSchema||
subscriber|Member Subschema|Yes|
dependents|List of Member Subschema||
application_data|Dict||

### Payer Subschema
Name             | Type          | Required? | Values
-----------------|---------------|-----------|-------
name|{string}||
tax_id|{string}||

### Sponser Subschema
Name             | Type          | Required? | Values
-----------------|---------------|-----------|-------
name|{string}||
tax_id|{string}||

### Broker Subschema
Name             | Type          | Required? | Values
-----------------|---------------|-----------|-------
Name|Type|Required|Values
name|{string}||
tax_id|{string}||
account_numbers|{string}||

### Member Subschema
Name             | Type          | Required? | Values
-----------------|---------------|-----------|-------
name|{string}||
last_name|{string}||
first_name|{string}||
middle_name|{string}||
suffix|{string}||
address|Address Subschema||
ssn|{string}||
member_id|{string}||
subscriber_number|{string}||
gender:|{string}||
group_or_policy_number|{string}||
relationship|{string}||
maintenance_type|{string}||
maintenance_reason|{string}||
benefit_status|{string}||
employment_status|{string}||
student_status|{string}||
marital_status|{string}||
citizenship_status|{string}||
ethnicity|{string}||
handicapped|Bool (Default: False)||
cobra_qualifying_event|{string}||
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
employment_classes|List of String||
wages_amount|Monetary Amount Schema||
wages_paid_frequency|{string}||
spend_down_amount|Monetary Amount Schema||
premium_amount|Monetary Amount Schema||
expected_expenditure_amount|Monetary Amount Schema||
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
Name             | Type          | Required? | Values
-----------------|---------------|-----------|-------
line|{string}|Yes|
line2|{string}||
city|{string}|Yes|
state|{string}||
postal_code|{string}||
country|{string}||
county|{string}||

#### Medicare Subschema
Name             | Type          | Required? | Values
-----------------|---------------|-----------|-------
plan|{string}|Yes|
eligibility_reason|{string}||

#### School Subschema
Name             | Type          | Required? | Values
-----------------|---------------|-----------|-------
name|{string}||

#### Contact Subschema
Name             | Type          | Required? | Values
-----------------|---------------|-----------|-------
name|{string}||
primary_communication_type|{string}|yes|
primary_communication_number|{string}|yes|
communication_type2|{string}||
‘communication_number2|{string}||
communication_type3|{string}||
communication_number3|{string}||

#### Monetary Amount Subschema
Name             | Type          | Required? | Values
-----------------|---------------|-----------|-------
Fix Me! Get the Monetary Amount Schema|||

#### Coverage Subschema
Name             | Type          | Required? | Values
-----------------|---------------|-----------|-------
maintenance_type|{string}|Yes|
benefit_type|{string}||
description|{string}||
coverage_level|{string}||
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
Name             | Type          | Required? | Values
-----------------|---------------|-----------|-------
payer_responsibility|{string}|Yes|
group_or_policy_number|{string}||
status|{string}|Yes|

##### Payer Subschema
Name             | Type          | Required? | Values
-----------------|---------------|-----------|-------
type|{string}|Yes|
entity_type|{string}|Yes|
patient_status|{string}||
last_or_organization_name|{string}||
first_name|{string}||
middle_name|{string}||
prefix|{string}||
suffix|{string}||
ssn|{string}||
service_provider_number|{string}||
npi_id|{string}||
tax_id|{string}||
address|Address SubSchema||





