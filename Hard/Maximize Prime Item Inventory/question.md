# Warehouse Batch Optimization Problem

**Effective April 3rd 2024, the problem statement has been updated to provide additional clarity.**

## Problem Overview

Amazon wants to maximize the storage capacity of its **500,000 square-foot warehouse** by following these rules:

1. **Prioritize Prime Batches:**
   - A specific prime product batch (defined by the `item_category` column) must be maintained.
   - For example, if the prime product batch includes 1 laptop and 1 side table, that combined set represents one batch. You cannot add an additional laptop without also adding a corresponding side table.

2. **Utilize Remaining Space for Non-Prime Batches:**
   - After stocking the maximum possible prime batches, any remaining square footage will be used to stock non-prime batches.
   - Non-prime items also come in batch sets and cannot be separated into individual items.
   - **Important:** Non-prime items must always be in stock to meet customer demand, so the non-prime batch count should never be zero.

3. **Item Count Constraints:**
   - Items are stocked in whole-number batch sets (integers only).

## Inventory Table Structure

| Column Name    | Data Type |
|----------------|-----------|
| item_id        | integer   |
| item_type      | string    |
| item_category  | string    |
| square_footage | decimal   |

## Example Input

| item_id | item_type      | item_category     | square_footage |
|---------|----------------|-------------------|----------------|
| 1374    | prime_eligible | mini refrigerator | 68.00          |
| 4245    | not_prime      | standing lamp     | 26.40          |
| 2452    | prime_eligible | television        | 85.00          |
| 3255    | not_prime      | side table        | 22.60          |
| 1672    | prime_eligible | laptop            | 8.50           |

## Example Output

| item_type      | item_count |
|----------------|------------|
| prime_eligible | 9285       |
| not_prime      | 6          |

## Task

Write an SQL query that fulfills the following objectives:

- **Maximize the number of prime batches** that can be stored within a 500,000 square-foot warehouse, while ensuring that there is always enough remaining space for at least one non-prime batch.
- After prioritizing the prime batches, **allocate any remaining space to non-prime batches**.
- Return an output that lists the `item_type` (with `prime_eligible` first, followed by `not_prime`) along with the **maximum number of batches** that can be stocked for each.

