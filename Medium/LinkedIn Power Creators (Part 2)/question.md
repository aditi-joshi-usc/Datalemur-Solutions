# LinkedIn Power Creator Identification Problem

## Background

The LinkedIn Creator team is looking for power creators—individuals who use their personal profile as a company or influencer page. A profile is considered a power creator if the number of followers on their personal profile exceeds the follower count of every company they work for. When a person works for multiple companies, only the company with the largest follower base is considered for this comparison.

## Task

Write an SQL query that returns the IDs (`profile_id`) of the LinkedIn power creators in ascending order.

## Table Schemas

### 1. `personal_profiles`
This table contains the details of individuals’ personal LinkedIn profiles.

| Column Name | Data Type | Description                         |
|-------------|-----------|-------------------------------------|
| profile_id  | integer   | The unique ID of the personal profile. |
| name        | string    | The name of the profile owner.          |
| followers   | integer   | The number of followers on the personal profile. |

**Example Input:**

| profile_id | name           | followers |
|------------|----------------|-----------|
| 1          | Nick Singh     | 92,000    |
| 2          | Zach Wilson    | 199,000   |
| 3          | Daliana Liu    | 171,000   |
| 4          | Ravit Jain     | 107,000   |
| 5          | Vin Vashishta  | 139,000   |
| 6          | Susan Wojcicki | 39,000    |

### 2. `employee_company`
This table links personal profiles with the companies they work for.

| Column Name          | Data Type | Description                                |
|----------------------|-----------|--------------------------------------------|
| personal_profile_id  | integer   | The ID of the personal profile (foreign key to `personal_profiles`). |
| company_id           | integer   | The ID of the company the person works for. |

**Example Input:**

| personal_profile_id | company_id |
|---------------------|------------|
| 1                   | 4          |
| 1                   | 9          |
| 2                   | 2          |
| 3                   | 1          |
| 4                   | 3          |
| 5                   | 6          |
| 6                   | 5          |

### 3. `company_pages`
This table contains details about company pages on LinkedIn.

| Column Name | Data Type | Description                               |
|-------------|-----------|-------------------------------------------|
| company_id  | integer   | The unique ID of the company.             |
| name        | string    | The name of the company.                  |
| followers   | integer   | The number of followers on the company page. |

**Example Input:**

| company_id | name                           | followers  |
|------------|--------------------------------|------------|
| 1          | The Data Science Podcast       | 8,000      |
| 2          | Airbnb                         | 700,000    |
| 3          | The Ravit Show                 | 6,000      |
| 4          | DataLemur                      | 200        |
| 5          | YouTube                        | 1,600,000  |
| 6          | DataScience.Vin                | 4,500      |
| 9          | Ace The Data Science Interview | 4,479      |

## Expected Output

The query should return a result set with a single column `profile_id` in ascending order containing only the IDs of the power creators.

**Example Output:**

| profile_id |
|------------|
| 1          |
| 3          |
| 4          |
| 5          |

**Explanation:**

- **Profile 1 (Nick Singh):**  
  - Associated with companies 4 and 9.  
  - Maximum company followers = max(200, 4,479) = 4,479.  
  - Since 92,000 > 4,479, Nick Singh qualifies.

- **Profile 2 (Zach Wilson):**  
  - Works for company 2 (700,000 followers).  
  - Since 199,000 < 700,000, does not qualify.

- **Profile 3 (Daliana Liu):**  
  - Works for company 1 (8,000 followers).  
  - Since 171,000 > 8,000, qualifies.

- **Profile 4 (Ravit Jain):**  
  - Works for company 3 (6,000 followers).  
  - Since 107,000 > 6,000, qualifies.

- **Profile 5 (Vin Vashishta):**  
  - Works for company 6 (4,500 followers).  
  - Since 139,000 > 4,500, qualifies.

- **Profile 6 (Susan Wojcicki):**  
  - Works for company 5 (1,600,000 followers).  
  - Since 39,000 < 1,600,000, does not qualify.

## Assumptions

- A person can work at multiple companies.
- For individuals employed at multiple companies, consider only the company with the largest follower count.
- The output should be sorted in ascending order by `profile_id`.

---

End of Problem Statement.
