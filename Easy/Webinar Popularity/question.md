# Marketing Touch Webinar Percentage Query

This document describes the approach and provides the SQL query to calculate the percentage of marketing touches that were "webinar" events in April 2022. The result is rounded to the nearest integer and returned as `webinar_pct`.

#### Problem Recap

- We have a `marketing_touches` table containing the following columns:
  - **event_id** (integer)
  - **contact_id** (integer)
  - **event_type** (string)
  - **event_date** (date)
- We need to determine the percentage of events that were of type `"webinar"` among all marketing touches in April 2022.
- **Example:** In the provided sample data, there is 1 webinar event out of 8 events in April 2022, which gives a ratio of 1/8 = 12.5% and rounds to **13%**.

#### Approach

1. **Filter by Date:**  
   We limit our analysis to events that occurred in April 2022. This can be done using a condition on `event_date`, such as:
   - `event_date >= '2022-04-01' AND event_date < '2022-05-01'`
  
2. **Count Total Marketing Touches:**  
   Use the `COUNT(*)` function to count all events in this date range.

3. **Count Webinar Events:**  
   Use a conditional aggregation, counting only rows where `event_type = 'webinar'`.

4. **Calculate the Percentage:**  
   The percentage is calculated as
```
   (Number of Webinar Events / Total Events) * 100

```

Then, round the result to the nearest integer.

#### SQL Query

Below is the complete SQL query that implements the solution:

```sql
SELECT ROUND(100 * 
          SUM(CASE WHEN event_type = 'webinar' THEN 1 ELSE 0 END) / COUNT(*)
         ) AS webinar_pct
FROM marketing_touches
WHERE event_date >= '2022-04-01'
AND event_date < '2022-05-01';
