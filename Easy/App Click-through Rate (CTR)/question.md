# SQL Interview Question: Click-Through Rate (CTR) Calculation

## Problem Statement  
Assume you have an `events` table on Facebook app analytics. Write a SQL query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.

### Definition and Notes:
- **Click-Through Rate (CTR) Formula**:  
  \[
  \text{CTR} = 100.0 \times \frac{\text{Number of Clicks}}{\text{Number of Impressions}}
  \]
- **To avoid integer division**, multiply the CTR by `100.0`, not `100`.

## Table: `events`  

| Column Name  | Type      |
|-------------|----------|
| app_id      | integer  |
| event_type  | string   |
| timestamp   | datetime |

### Example Input:
| app_id | event_type  | timestamp            |
|--------|------------|----------------------|
| 123    | impression | 07/18/2022 11:36:12  |
| 123    | impression | 07/18/2022 11:37:12  |
| 123    | click      | 07/18/2022 11:37:42  |
| 234    | impression | 07/18/2022 14:15:12  |
| 234    | click      | 07/18/2022 14:16:12  |

### Example Output:
| app_id | ctr  |
|--------|------|
| 123    | 50.00 |
| 234    | 100.00 |

### Explanation:
For App 123:
- It received **2 impressions** and **1 click**.
- CTR calculation:  
  \[
  \frac{1}{2} \times 100.0 = 50.00\%
  \]
- Thus, the CTR for App 123 is **50.00%**.

For App 234:
- It received **1 impression** and **1 click**.
- CTR calculation:  
  \[
  \frac{1}{1} \times 100.0 = 100.00\%
  \]
- Thus, the CTR for App 234 is **100.00%**.

### Expected SQL Query:
Write a query to compute the CTR for each `app_id` in 2022.
