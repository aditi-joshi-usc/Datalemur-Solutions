# Facebook Advertiser Payment Status Update Problem

## Background

Apple’s Facebook advertiser management system tracks the payment status of each advertiser. You are provided with two tables:

1. **advertiser Table** – Contains information about advertisers and their current payment status.
2. **daily_pay Table** – Contains current payment information for advertisers (only includes advertisers who have made a payment on that day).

Your goal is to update the payment status of Facebook advertisers based on whether they made a payment on day T, according to predefined status transition rules.

---

## Payment Status Transitions

The advertisers’ statuses can be one of the following:
- **NEW:** Advertisers who are newly registered.
- **EXISTING:** Advertisers who have made payments in the past and have made a payment on day T.
- **CHURN:** Advertisers who have made payments in the past but did not make a payment on day T.
- **RESURRECT:** Advertisers whose status was previously CHURN but have now made a payment on day T.

The status transitions are outlined in the table below:

| # | Current Status | Updated Status | Payment on Day T |
|---|----------------|----------------|------------------|
| 1 | NEW            | EXISTING     | Paid             |
| 2 | NEW            | CHURN        | Not paid         |
| 3 | EXISTING       | EXISTING     | Paid             |
| 4 | EXISTING       | CHURN        | Not paid         |
| 5 | CHURN          | RESURRECT    | Paid             |
| 6 | CHURN          | CHURN        | Not paid         |
| 7 | RESURRECT      | EXISTING     | Paid             |
| 8 | RESURRECT      | CHURN        | Not paid         |

**Summary:**

- **No Payment on Day T (Rows 2, 4, 6, and 8):**  
  Regardless of the current status, if an advertiser does not make a payment on day T, their new status is updated to **CHURN**.

- **Payment on Day T (Rows 1, 3, 5, and 7):**  
  - If the advertiser’s current status is **CHURN** and they make a payment, they are updated to **RESURRECT**.
  - For any other current status with a payment, update the status to **EXISTING**.

---

## Table Schemas and Example Data

### 1. Advertiser Table

This table stores the current payment status of each advertiser.

| Column Name | Data Type | Description                                         |
|-------------|-----------|-----------------------------------------------------|
| user_id     | string    | Unique identifier for the advertiser.             |
| status      | string    | The current payment status of the advertiser.       |

**Example Input:**

| user_id | status    |
|---------|-----------|
| bing    | NEW       |
| yahoo   | NEW       |
| alibaba | EXISTING  |

### 2. daily_pay Table

This table stores the current payment information for advertisers who have made a payment on day T.

| Column Name | Data Type | Description                                 |
|-------------|-----------|---------------------------------------------|
| user_id     | string    | Unique identifier for the advertiser.     |
| paid        | decimal   | The payment amount made on day T.           |

**Example Input:**

| user_id | paid   |
|---------|--------|
| yahoo   | 45.00  |
| alibaba | 100.00 |
| target  | 13.00  |

*Note:* Only advertisers who have made a payment on day T are listed in this table.

---

## Expected Output

The output should include each advertiser’s user ID alongside their updated payment status (`new_status`). The results should be sorted by the user ID in ascending order.

**Example Output:**

| user_id | new_status |
|---------|------------|
| bing    | CHURN      |
| yahoo   | EXISTING   |
| alibaba | EXISTING   |

**Explanation:**
- **bing:**  
  No payment record exists in the `daily_pay` table for "bing," so regardless of the current status (NEW), the status is updated to **CHURN**.

- **yahoo:**  
  A payment of 45.00 is present, so starting from a status of NEW, "yahoo" is updated to **EXISTING** (Row 1).

- **alibaba:**  
  As an existing advertiser who has made a recent payment, "alibaba" remains **EXISTING** (Row 3).

---

## Task Summary

Write an SQL query that:

1. **Joins** the `advertiser` table with the `daily_pay` table (using the advertiser’s `user_id`) to determine if an advertiser made a payment on day T.
2. **Updates** the advertiser's status based on the following logic:
   - If **no payment** record exists for an advertiser in the `daily_pay` table, update the status to **CHURN**.
   - If a payment record exists:
     - If the current status is **CHURN**, update to **RESURRECT**.
     - Otherwise, update to **EXISTING**.
3. **Returns** the advertiser’s `user_id` and updated status (`new_status`).
4. **Sorts** the output by `user_id` in ascending order.

Good luck writing your query!
