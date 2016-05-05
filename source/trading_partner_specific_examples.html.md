---
layout: 2column
---

# Trading Partner-Specific Examples
Some trading partners vary slightly in terms of their required inputs and what
output they produce. This page is intended to capture these differences for easy
reference.

## Anthem BCBS

### PPO Enrollment
Here's an example for PPO enrollment with Anthem.

<pre><code class="javascript">
{
    "action": "Change",
    "dependents": [{
            "address": {
                "city": "CAMP HILL",
                "line": "100 MARKET ST",
                "line2": "",
                "postal_code": "17011",
                "state": "PA"
            },
            "benefit_status": "Active",
            "benefits": [
                {
                    "begin_date": "2015-09-01",
                    "benefit_type": "Preferred Provider Organization",
                    "description": "1K4C",
                    "late_enrollment": false,
                    "maintenance_type": "Addition"
                },
                {
                    "begin_date": "2015-09-01",
                    "benefit_type": "Dental",
                    "description": "1QCS",
                    "late_enrollment": false,
                    "maintenance_type": "Addition"
                }
            ],
            "birth_date": "1985-12-12",
            "eligibility_begin_date": "2015-09-01",
            "employment_status": "Full-time",
            "first_name": "JANE",
            "gender": "Female",
            "group_or_policy_number": "A12345",
            "handiPApped": false,
            "last_name": "FOX",
            "maintenance_reason": "Initial Enrollment",
            "maintenance_type": "Addition",
            "relationship": "Spouse",
            "ssn": "999999992",
            "subscriber_number": "999999991",
            "substance_abuse": false,
            "tobacco_use": false
        },
        {
                "address": {
                    "city": "CAMP HILL",
                    "line": "100 MARKET ST",
                    "line2": "",
                    "postal_code": "17011",
                    "state": "PA"
                },
                "benefit_status": "Active",
                "benefits": [
                    {
                        "begin_date": "2015-09-01",
                        "benefit_type": "Preferred Provider Organization",
                        "description": "1K4C",
                        "late_enrollment": false,
                        "maintenance_type": "Addition"
                    },
                    {
                        "begin_date": "2015-09-01",
                        "benefit_type": "Dental",
                        "description": "1QCS",
                        "late_enrollment": false,
                        "maintenance_type": "Addition"
                    }
                ],
                "birth_date": "2011-01-01",
                "eligibility_begin_date": "2015-09-01",
                "employment_status": "Full-time",
                "first_name": "JODY",
                "gender": "Female",
                "group_or_policy_number": "A12345",
                "handiPApped": false,
                "last_name": "FOX",
                "maintenance_reason": "Initial Enrollment",
                "maintenance_type": "Addition",
                "relationship": "Child",
                "ssn": "999999993",
                "subscriber_number": "999999991",
                "substance_abuse": false,
                "tobacco_use": false
            }],
    "purpose": "Original",
    "payer": {
        "name": "WELLPOINT COMPANY",
        "tax_id": "953760001"
    },
    "sponsor": {
        "name": "AGBANAYI CONSTRUCTION",
        "tax_id": "123456789"
    },
    "subscriber": {
        "address": {
            "city": "CAMP HILL",
            "line": "100 MARKET ST",
            "line2": "",
            "postal_code": "17011",
            "state": "PA"
        },
        "benefit_status": "Active",
        "benefits": [
            {
                "begin_date": "2015-09-01",
                "benefit_type": "Preferred Provider Organization",
                "description": "1K4C",
                "late_enrollment": false,
                "maintenance_type": "Addition"
            },
            {
                "begin_date": "2015-09-01",
                "benefit_type": "Dental",
                "description": "1QCS",
                "late_enrollment": false,
                "maintenance_type": "Addition"
            }
        ],
        "birth_date": "1980-11-11",
        "hire_date": "2015-08-02",
        "eligibility_begin_date": "2015-09-01",
        "employment_status": "Full-time",
        "first_name": "JOE",
        "gender": "Male",
        "group_or_policy_number": "A12345",
        "handiPApped": false,
        "last_name": "FOX",
        "maintenance_reason": "Initial Enrollment",
        "maintenance_type": "Addition",
        "relationship": "Self",
        "ssn": "999999991",
        "subscriber_number": "999999991",
        "substance_abuse": false,
        "tobacco_use": false
    },
    "trading_partner_id": "anthem_enrollment_test"
}
</code></pre>

### HMO Enrollment

Here's an HMO enrollment example.

<pre><code class="javascript">
{
  "payer": {
    "name": "WELLPOINT COMPANY",
    "tax_id": "953760001"
  },
  "subscriber": {
    "maintenance_type": "Addition",
    "first_name": "JOHN",
    "last_name": "SMITH",
    "benefits": [
      {
        "maintenance_type": "Addition",
        "begin_date": "2015-09-01",
        "description": "1K3T",
        "providers": [
          {
            "service_provider_number": "8DK332"
          }
        ],
        "benefit_type": "Health Maintenance Organization",
        "late_enrollment": false
      },
      {
        "maintenance_type": "Addition",
        "benefit_type": "Dental",
        "late_enrollment": false,
        "begin_date": "2015-09-01",
        "description": "1QCS"
      }
    ],
    "relationship": "Self",
    "subscriber_number": "999999991",
    "benefit_status": "Active",
    "gender": "Male",
    "employment_status": "Full-time",
    "group_or_policy_number": "A12345",
    "maintenance_reason": "Initial Enrollment",
    "handicapped": false,
    "hire_date": "2015-08-02",
    "eligibility_begin_date": "2015-09-01",
    "ssn": "999999991",
    "address": {
      "city": "CAMP HILL",
      "line": "100 MARKET ST",
      "postal_code": "17011",
      "line2": "APT 3G",
      "state": "PA"
    },
    "birth_date": "1980-10-10",
    "substance_abuse": false,
    "tobacco_use": false
  },
  "purpose": "Original",
  "trading_partner_id": "anthem_enrollment_test",
  "action": "Change",
  "dependents": [
    {
      "maintenance_type": "Addition",
      "first_name": "JANE",
      "last_name": "SMITH",
      "benefits": [
        {
          "maintenance_type": "Addition",
          "begin_date": "2015-09-01",
          "description": "1K3T",
          "providers": [
            {
              "service_provider_number": "8DK332"
            }
          ],
          "benefit_type": "Health Maintenance Organization",
          "late_enrollment": false
        },
        {
          "maintenance_type": "Addition",
          "benefit_type": "Dental",
          "late_enrollment": false,
          "begin_date": "2015-09-01",
          "description": "1QCS"
        }
      ],
      "relationship": "Child",
      "subscriber_number": "999999991",
      "benefit_status": "Active",
      "gender": "Female",
      "group_or_policy_number": "A12345",
      "maintenance_reason": "Initial Enrollment",
      "handicapped": false,
      "eligibility_begin_date": "2015-09-01",
      "ssn": "999999992",
      "address": {
        "city": "CAMP HILL",
        "line": "100 MARKET ST",
        "postal_code": "17011",
        "line2": "APT 3G",
        "state": "PA"
      },
      "birth_date": "2013-05-05",
      "substance_abuse": false,
      "tobacco_use": false
    }
  ],
  "sponsor": {
    "name": "AGBANAYI CONSTRUCTION",
    "tax_id": "123456789"
  }
}
</code></pre>
