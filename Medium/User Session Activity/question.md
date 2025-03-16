# User Session Activity: Twitter SQL Interview Question

This document outlines the problem, displays the example input and output, presents an Oracle SQL solution, and discusses the approach used to rank users based on their total session durations.

---

## Problem Description

Assume you are given a table containing Twitter user session activities. Your task is to write a query that ranks users according to their total session durations (in minutes) in descending order for each session type between the start date (`2022-01-01`) and the end date (`2022-02-01`).

**Output:**  
List the user ID, session type, and the ranking of the total session duration.

**Table:** `sessions`

| Column Name   | Data Type                                       |
|---------------|-------------------------------------------------|
| session_id    | integer                                         |
| user_id       | integer                                         |
| session_type  | string ("like", "reply", "retweet")             |
| duration      | integer (in minutes)                            |
| start_date    | timestamp                                       |

---

## Example Input

| session_id | user_id | session_type | duration | start_date            |
|------------|---------|--------------|----------|-----------------------|
| 6368       | 111     | like         | 3        | 12/25/2021 12:00:00   |
| 1742       | 111     | retweet      | 6        | 01/02/2022 12:00:00   |
| 8464       | 222     | reply        | 8        | 01/16/2022 12:00:00   |
| 7153       | 111     | retweet      | 5        | 01/28/2022 12:00:00   |
| 3252       | 333     | reply        | 15       | 01/10/2022 12:00:00   |

---

## Example Output

| user_id | session_type | ranking |
|---------|--------------|---------|
| 333     | reply        | 1       |
| 222     | reply        | 2       |
| 111     | retweet      | 1       |

**Explanation:**
- For **reply** sessions:  
  - User 333 logged a total of 15 minutes, and user 222 logged 8 minutes.  
  Hence, user 333 is ranked 1 and user 222 is ranked 2.
- For **retweet** sessions:  
  - User 111 logged a total of 11 minutes (6 + 5 minutes) and is ranked 1.
- The session from 12/25/2021 (session type: like for user 111) is excluded because it is outside of the specified date range.

---

## SQL Solution

Below is the Oracle SQL query that calculates the total session duration per user for each session type within the given date range and ranks them accordingly:

```sql
SELECT 
    user_id,
    session_type,
    RANK() OVER (PARTITION BY session_type 
                 ORDER BY total_duration DESC) AS ranking
FROM (
    SELECT 
        user_id,
        session_type,
        SUM(duration) AS total_duration
    FROM sessions
    WHERE start_date BETWEEN TO_DATE('2022-01-01', 'YYYY-MM-DD')
                         AND TO_DATE('2022-02-01', 'YYYY-MM-DD')
    GROUP BY user_id, session_type
) t
ORDER BY session_type, ranking;
