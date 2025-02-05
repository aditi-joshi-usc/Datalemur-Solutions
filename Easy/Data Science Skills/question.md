# Finding Candidates for Data Science Job

## Problem Statement
Given a table of candidates and their skills, find candidates who possess **all** of the required skills for a Data Science job:
- **Python**
- **Tableau**
- **PostgreSQL**

The output should list the `candidate_id`s of such candidates, sorted in ascending order.

## Table Schema

**candidates Table:**
| Column Name    | Type    |
|---------------|--------|
| candidate_id  | integer |
| skill         | varchar |

## Example Input

| candidate_id | skill      |
|-------------|------------|
| 123         | Python      |
| 123         | Tableau     |
| 123         | PostgreSQL  |
| 234         | R           |
| 234         | PowerBI     |
| 234         | SQL Server  |
| 345         | Python      |
| 345         | Tableau     |

## Expected Output

| candidate_id |
|-------------|
| 123         |

### Explanation:
- Candidate **123** is included because they have **all three required skills**.
- Candidate **345** is **excluded** because they are **missing** PostgreSQL.

## Edge Cases Considered:
- **Candidates with extra skills:** Candidates may have more skills than required, but they must still have **all three required skills**.
- **Candidates missing one or more skills:** If a candidate lacks any of the three skills, they should be excluded.
- **No duplicates in the table:** The assumption ensures that each `candidate_id`-`skill` pair appears only once.

This query efficiently identifies the best-suited candidates for a Data Science job by filtering and grouping based on the required skill set. 🚀
