# Policy Holders with Three or More Calls

## Problem Statement

UnitedHealth Group (UHG) has a program called **Advocate4Me**, where policyholders can call an advocate for support regarding **claims, benefits, drug coverage, authorizations, medical records, emergency assistance, and member portal services**.

Write a **SQL query** to count the number of **UHG policyholders** who have made **three or more calls**. Each call is uniquely identified by the `case_id` column.

---

## Table: `callers`

| Column Name        | Type      | Description                                      |
|-------------------|----------|--------------------------------------------------|
| `policy_holder_id` | integer  | Unique identifier for the policyholder          |
| `case_id`         | varchar  | Unique identifier for each call case            |
| `call_category`   | varchar  | Type of call (e.g., emergency assistance)       |
| `call_date`       | timestamp | Date and time when the call was made           |
| `call_duration_secs` | integer  | Duration of the call in seconds              |

---

## Example Input

| policy_holder_id | case_id                                  | call_category           | call_date              | call_duration_secs |
|-----------------|----------------------------------------|-------------------------|------------------------|--------------------|
| 1               | f1d012f9-9d02-4966-a968-bf6c5bc9a9fe   | emergency assistance    | 2023-04-13T19:16:53Z   | 144                |
| 1               | 41ce8fb6-1ddd-4f50-ac31-07bfcce6aaab   | authorisation           | 2023-05-25T09:09:30Z   | 815                |
| 2               | 9b1af84b-eedb-4c21-9730-6f099cc2cc5e   | claims assistance       | 2023-01-26T01:21:27Z   | 992                |
| 2               | 8471a3d4-6fc7-4bb2-9fc7-4583e3638a9e   | emergency assistance    | 2023-03-09T10:58:54Z   | 128                |
| 2               | 38208fae-bad0-49bf-99aa-7842ba2e37bc   | benefits                | 2023-06-05T07:35:43Z   | 619                |

---

## Expected Output

| policy_holder_count |
|---------------------|
| 1                   |

---


