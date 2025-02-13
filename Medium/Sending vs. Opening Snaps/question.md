# Snapchat Activity Breakdown by Age Group

## **Problem Statement**
You are given tables containing information on Snapchat users, including their ages and time spent sending and opening snaps. Your task is to obtain a breakdown of the time spent sending vs. opening snaps as a percentage of total time spent on these activities, grouped by age group. The output should round the percentage to **two decimal places**.

---

## **Tables Description**

### **activities Table**
| Column Name   | Type    | Description |
|--------------|--------|-------------|
| activity_id  | integer | Unique identifier for the activity. |
| user_id      | integer | Unique identifier for the user. |
| activity_type | string  | Type of activity ('send', 'open', 'chat'). |
| time_spent   | float   | Time spent on the activity (in minutes). |
| activity_date | datetime | Timestamp when the activity occurred. |

### **age_breakdown Table**
| Column Name   | Type    | Description |
|--------------|--------|-------------|
| user_id      | integer | Unique identifier for the user. |
| age_bucket   | string  | Age group of the user ('21-25', '26-30', '31-35'). |

---

## **Example Input**

### **activities Table**
| activity_id | user_id | activity_type | time_spent | activity_date |
|------------|--------|--------------|------------|---------------|
| 7274       | 123    | open         | 4.50       | 06/22/2022 12:00:00 |
| 2425       | 123    | send         | 3.50       | 06/22/2022 12:00:00 |
| 1413       | 456    | send         | 5.67       | 06/23/2022 12:00:00 |
| 1414       | 789    | chat         | 11.00      | 06/25/2022 12:00:00 |
| 2536       | 456    | open         | 3.00       | 06/25/2022 12:00:00 |

### **age_breakdown Table**
| user_id | age_bucket |
|--------|-----------|
| 123    | 31-35     |
| 456    | 26-30     |
| 789    | 21-25     |

---

## **Example Output**
| age_bucket | send_perc | open_perc |
|------------|----------|----------|
| 26-30     | 65.40    | 34.60    |
| 31-35     | 43.75    | 56.25    |

---

## **Solution Approach**
1. **Filter the activities table** to include only 'send' and 'open' activities.
2. **Join the activities table with the age_breakdown table** to get the user's age group.
3. **Group by age bucket** and calculate the total time spent on sending and opening snaps.
4. **Compute the percentage of time spent** on each activity.
5. **Round the percentages to two decimal places** and return the result.

---

## **SQL Query Solution**
```sql
SELECT 
    ab.age_bucket,
    ROUND(100.0 * SUM(CASE WHEN a.activity_type = 'send' THEN a.time_spent ELSE 0 END) / SUM(a.time_spent), 2) AS send_perc,
    ROUND(100.0 * SUM(CASE WHEN a.activity_type = 'open' THEN a.time_spent ELSE 0 END) / SUM(a.time_spent), 2) AS open_perc
FROM activities a
JOIN age_breakdown ab ON a.user_id = ab.user_id
WHERE a.activity_type IN ('send', 'open')
GROUP BY ab.age_bucket;
```

### **Explanation**
1. The query joins the `activities` table with the `age_breakdown` table on `user_id`.
2. It filters for only `'send'` and `'open'` activities.
3. It groups the data by `age_bucket`.
4. It calculates the **percentage of time spent sending snaps**:
   - `(SUM(time spent sending) / SUM(total time spent)) * 100`
5. It calculates the **percentage of time spent opening snaps**:
   - `(SUM(time spent opening) / SUM(total time spent)) * 100`
6. The result is rounded to **two decimal places**.

---

## **Edge Cases Considered**
- Users who have only participated in one type of activity (`send` or `open`).
- Users with no recorded activity should be excluded from the breakdown.
- Handling integer division by ensuring **multiplication with `100.0`** instead of `100`.

---

## **Time Complexity Analysis**
- **Joining tables (`JOIN`)** runs in **O(N)** time, where **N** is the number of users.
- **Filtering activities (`WHERE activity_type IN ('send', 'open')`)** reduces unnecessary calculations.
- **Aggregations (`SUM`)** and **grouping (`GROUP BY`)** both run in **O(N log N)**.

### **Overall Complexity: O(N log N)**

---

## **Conclusion**
This SQL query efficiently computes the breakdown of Snapchat activity based on age groups. By using filtering, grouping, and aggregation, we obtain an accurate **percentage distribution of time spent sending and opening snaps**.
