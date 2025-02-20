# Accenture Subject Matter Expert (SME) Identification

## Problem Statement

Accenture needs to identify Subject Matter Experts (SMEs) among their employees based on their domain expertise and years of experience. Your task is to write a SQL query that identifies employees who qualify as SMEs according to specific criteria.

## SME Qualification Criteria

An employee qualifies as a Subject Matter Expert if they meet **either** of the following criteria:

1. They have **8 or more years** of work experience in a **single domain**.
2. They have **12 or more years** of work experience **across two different domains** combined.

## Assumptions

* An employee can only be considered an SME if they meet the experience requirements in either one or two domains.
* Cases where an employee has experience in more than two domains can be disregarded for SME qualification.
* This criteria was revised effective June 12th, 2023.

## Database Schema

**Table: `employee_expertise`**

| Column Name | Type | Description |
|-------------|------|-------------|
| employee_id | integer | Unique identifier for each employee |
| domain | string | The professional domain/field of expertise |
| years_of_experience | integer | Number of years of experience in the specified domain |

## Example Input Data

| employee_id | domain | years_of_experience |
|-------------|--------|---------------------|
| 101 | Digital Transformation | 9 |
| 102 | Supply Chain | 6 |
| 102 | IoT | 7 |
| 103 | Change Management | 4 |
| 104 | DevOps | 5 |
| 104 | Cloud Migration | 5 |
| 104 | Agile Transformation | 5 |

## Expected Output

| employee_id |
|-------------|
| 101 |
| 102 |

## Explanation

- **Employee 101** qualifies as an SME because they have 9 years of experience in "Digital Transformation", which exceeds the minimum requirement of 8 years in a single domain.
  
- **Employee 102** qualifies as an SME because they have a combined 13 years of experience across two domains (6 years in "Supply Chain" + 7 years in "IoT"), which exceeds the minimum requirement of 12 years across two domains.

- **Employee 103** does not qualify as an SME as they only have 4 years of experience in one domain, which falls short of both criteria.
  
- **Employee 104** has experience across three domains, so their case is disregarded based on the assumption that only employees with one or two domains are considered for SME qualification.

## Task

Write a SQL query that identifies and returns the employee_id of all employees who qualify as Subject Matter Experts based on the given criteria.
