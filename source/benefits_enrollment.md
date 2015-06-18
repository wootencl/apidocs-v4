# Benefits Enrollment Overview

## JSON Schema for 834 Benefits Enrollment
| Parameters          | Type                     | Description | Required? |
|:--------------------|:-------------------------|:------------|:----------|
reference_number|{string}|The reference number for the transaction.|Yes
purpose|{string}|The purpose of the transaction. Acceptable values see purpose codes.|Yes
action|{string}|The action of the transaction. Acceptable values see action codes. |Yes
master_policy_number|{string}|The master policy number for the sponsor.|No
payer|Payer Subschema|"The payer segment for the transaction. <br/>Reference: the <a href=""### Payer Subschema>payer subschema.</a>"|Yes
sponsor|Sponsor Subschema|The employer/sponsor segment for the transaction. See the sponsor subschema. |Yes
broker|Broker SubSchema|The broker segment for the transaction. See the broker subschema. |No
tpa|Broker SubSchema|The third party administrator segment for the transaction. See the broker subschema. |No
subscriber|Member Subschema|The subscriber/employee segment for the transaction. See the member subschema. |Yes
dependents|List of Member Subschema|A list of dependents covered under benefits by the subscriber. This should be based off of the same parameters as the member subschema. See the member subschema. |No
application_data|Dict|Reference the application data definition.|No

"<a name=""### Payer Subschema""></a>"
### Payer Subschema
| Parameters   | Type     | Description | Required? |
|:-------------|:---------|:------------|:----------|
name|{string}|The name of of the carrier/payer.|
tax_id|{string}|The tax ID of the carrier/payer.|

### Sponsor Subschema
| Parameters   | Type     | Description | Required? |
|:-------------|:---------|:------------|:----------|
name|{string}|The employer/sponsor of the benefits.|
tax_id|{string}|The tax id of the sponsor.|

### Broker Subschema
| Parameters   | Type     | Description | Required? |
|:-------------|:---------|:------------|:----------|
name|{string}|The name of the broker.|
tax_id|{string}|The tax ID of the broker.|
account_numbers|{string}|The account numbers of the broker.|

### Member Subschema
| Parameters              | Type                      | Description      | Required?                 |
|:------------------------|:--------------------------|:-----------------|:--------------------------|
last_name|{string}|The first name for the subscriber.|
first_name|{string}|The last name for the subscriber|
middle_name|{string}|The middle name for the subscriber.|
suffix|{string}|The suffix for the subscriber.|
address|Address Subschema|The address segment for the subscriber. See the address subschema. |
ssn|{string}|The social security number for the subscriber.|
member_id|{string}|The member id for the subscriber if already enrolled in benefits.|
subscriber_number|{string}|The subscriber number or ssn for the subscriber.|
gender|{string}|The gender for the subscriber. Acceptable values: see gender codes.|
group_or_policy_number|{string}|The group or policy number for this list item.|
relationship|{string}|The relationship of the subject of the transaction to the policyholder. Acceptable values: see relationship codes. |
maintenance_type|{string}|The type of benefit maintenance. Acceptable values: see types.|
maintenance_reason|{string}|The reason for benefit maintenance. Acceptable values: see reason codes.|
benefit_status|{string}|The benefit status for the subscriber. Acceptable values: see benefit status codes.|
employment_status|{string}|The employment status for the subscriber. Acceptable values: see employment status codes.|
student_status|{string}|The student status for the subscriber. Acceptable values: see student status codes.|
marital_status|{string}|The marital status for the subscriber. Acceptable values: see marital status codes.|
citizenship_status|{string}|The citizenship status for the subscriber. Acceptable values: see citizenship status codes.|
ethnicity|{string}|The ethnicity of the subscriber. Acceptable values: see ethnicity codes table below.|
handicapped|Bool (Default: False)|If the subscriber is handicapped it would need to be defined as True. The default is false for this parameter.|
cobra_qualifying_event|{string}|The cobra qualifying event for the subscriber. Acceptable values: See cobra qualifying event codes. |
confidentiality|{string}|The code indicating the address to insured information. |
medicare|Medicare SubSchema|The medicare segment for the transaction. See the medicare subschema. |
school|School SubSchema|The school segment for the transaction. See the school subschema. |
eligibility_begin_date|Datetime|The date benefits become eligible for the subscriber.|
eligibility_end_date|Datetime|The date benefits become ineligible for the subscriber.|
education_end_date|Datetime|The education end date for the subscriber.|
birth_date|Datetime|The date of birth for the subscriber.|
birth_sequence|Int|The birth sequence of the subscriber. This is only required when family members have the same birth date.|#Required when reporting family members with the same birth date
death_date|Datetime|The death date of the subscriber.|#Member Individual Death Date
contacts|List of Contact SubSchema|A list of contact information for the subscriber. See the contact subschema. |
employment_classes|List of String|The employment class codes for the subscriber. Acceptable values: see employment class codes. |
wages_amount|Monetary Amount Schema|The wage paid to the subscriber. Reference the monetary subschema. |
wages_paid_frequency|{string}|The frequency the subscriber is paid. Acceptable values: see wages paid frequency. |
spend_down_amount|Monetary Amount Schema|The spend down amount for the subscriber. Reference the monetary subschema. |
premium_amount|Monetary Amount Schema|The premium amount for to the subscriber. Reference the monetary subschema. |
expected_expenditure_amount|Monetary Amount Schema|The expected expenditure amount paid of the subscriber. Reference the monetary subschema. |
deductible_amount|Monetary Amount Schema|The deductible amount for the subscriber. Reference the monetary subschema. |
copayment_amount|Monetary Amount Schema|The co-payment amount for the subscriber. Reference the monetary subschema. |
coinsurance_amount|Monetary Amount Schema|The co-insurance selection amount for the subscriber. Reference the monetary subschema. |
substance_abuse|Bool (Default: False)|If the subscriber has a substance abuse this parameter would need to be defined as True. The default is False for this parameter.|
tobacco_use|Bool (Default: False)|If the subscriber uses tobacco this parameter would need to be defined as True. The default is False for this parameter.|
height|{string}|The height of the subscriber.|
weight|{string}|The weight of the subscriber.|
benefits|List of Coverage SubSchema|The list of benefit segment for the subscriber. See the coverage subschema below. |
maintenance_effective_date|datetime|The maintenance effective date of the subscriber.|


#### Address Subschema
| Parameter   | Type     | Description | Required? |
|:------------|:---------|:------------|:----------|
line|{string}|The subscriber’s street address information. (e.g. [“123 N MAIN ST”])|Yes
line2|{string}|The subscriber’s street address information. (e.g. [“123 N MAIN ST”])|
city|{string}|The subscriber’s city information. (e.g. “SAN MATEO”)|Yes
state|{string}|The subscriber’s state information. (e.g. “CA”)|
postal_code|{string}|The subscriber’s zip/postal code. (e.g. “94401”)|
country|{string}|The subscriber's country information. (e.g. “USA”)|
county|{string}|The subscriber's county information. (e.g. “SAN MATEO”)|

#### Medicare Subschema
| Parameters      | Type     | Description | Required? |
|:----------------|:---------|:------------|:----------|
plan|{string}|The medicare plan value for the subscriber. Acceptable values: see medicare plan codes.|Yes
eligibility_reason|{string}|The medicare eligibility reason codes for the subscriber. Acceptable values: see medicare eligibility reason codes.|

#### School Subschema
| Parameters | Type     | Description | Required? |
|:-----------|:---------|:------------|:----------|
name|{string}|The name of the dependents school.|

#### Contact Subschema
| Parameters              | Type     | Description | Required? |
|:------------------------|:---------|:------------|:-----------|
primary_communication_type|{string}|The type of primary communication. Acceptable values: see communication types.|Yes
primary_communication_number|{string}|The primary communication number for the subscriber.|Yes
communication_type2|{string}|The type of secondary communication. Acceptable values: see communication types.|
â€˜communication_number2|{string}|The secondary communication number for the subscriber.|
communication_type3|{string}|The type of tertiary communication. Acceptable values: see communication types.|
communication_number3|{string}|The tertiary communication number for the subscriber.|


#### Monetary Amount Subschema
| Parameters                             | Type | Description | Required? |
|:---------------------------------------|:-----|:------------|:----------|
currency|{string}|The type of currency. (e. g. USD)|
amount|{string}|The amount of currency. |

#### Coverage Subschema
| Parameters           | Type                                       | Description | Required? |
|:---------------------|:-------------------------------------------|:------------|:----------|
maintenance_type|{string}|The type of benefit maintenance. Acceptable values: see maintenance type codes. |Yes
benefit_type|{string}|The benefit type. Acceptable values: see insurance line codes. |
coverage_level|{string}|The coverage level of the subscriber. Acceptable values; see coverage level codes. |
late_enrollment|Bool (Default : False)|If the subscriber is a late enrollee it would need to be defined as True. The default is False for this parameter.|
begin_date|datetime|The beginning date of coverage for the subscriber.|
end_date|datetime|The end date of coverage for the subscriber.|
enrollment_signature_date|datetime|The enrollment signature date for the subscriber.|
maintenance_effective_date|datetime|The maintenance effective date for the subscriber.|
premium_paid_to_date|datetime|The premium paid to date for the subscriber. |
last_premium_paid_date|datetime|The last premium paid date for the subscriber. |
spend_down_amount|Monetary Amount SubSchema|"See the ""Monetary Amount"" subschema below."|
premium_amount|Monetary Amount SubSchema|"See the ""Monetary Amount"" subschema below."|
expected_expenditure_amount|Monetary Amount SubSchema|"See the ""Monetary Amount"" subschema below."|
deductible_amount|Monetary Amount SubSchema|"See the ""Monetary Amount"" subschema below."|
copayment_amount|Monetary Amount SubSchema|"See the ""Monetary Amount"" subschema below."|
coinsurance_amount|Monetary Amount SubSchema|"See the ""Monetary Amount"" subschema below."|
coordination_of_benefits|List of Coordination of Benefits SubSchema|List of the coordination of benefits segment. See the coordination of benefits subschema. |
providers|List of Provider SubSchema|List of the provider segment. See the provider subschema. |



##### Coordination of Benefits Subschema
| Parameters                | Type              | Description | Required? |
|:--------------------------|:------------------|:------------|:----------|
payer_responsibility|{string}|The payer responsibility. Acceptable values: see payer responsibility codes. |Yes
group_or_policy_number|{string}|The group or policy number for the subscribers additional plan.|
status|{string}|The status of the coordination of benefits. Acceptable values:  coordination of benefits codes.|Yes

##### Provider Subschema
| Parameters                | Type              | Description | Required? |
|:--------------------------|:------------------|:------------|:----------|
type|{string}|The type of provider. Acceptable values: see provider type codes. |Yes
entity_type|{string}|The entity type of the provider. Acceptable values: see entity type codes. |Yes
patient_status|{string}|The patient status for the provider. Acceptable values: see established patient codes. |
last_or_organization_name|{string}|Last name of the provider or the name of the organization.|
first_name|{string}|The first name of the provider. |
middle_name|{string}|The middle name of the provider. |
prefix|{string}|The prefix of the provider. |
suffix|{string}|The suffix of the provider. |
ssn|{string}|The SSN of the provider. |
service_provider_number|{string}|The provider service number. |
npi_id|{string}|The NPI id of the provider. |
tax_id|{string}|The tax id of the provider. |
addressâ€™|Address SubSchema|The address of the provider. See the address subschema. |


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

