# Two-Way Unique Relationships Query

This document describes the approach and provides the SQL query to find the number of two-way unique relationships from a `payments` table.

## Problem Recap

We need to identify **two-way unique relationships** where two parties have both sent money to each other. For example, given the following data:

| payer_id | recipient_id | amount |
|----------|--------------|--------|
| 101      | 201          | 30     |
| 201      | 101          | 10     |
| 101      | 301          | 20     |
| 301      | 101          | 80     |
| 201      | 301          | 70     |

There are two relationships:
- Between **101** and **201**
- Between **101** and **301**

## Approach

The approach uses a self-join on the `payments` table to verify the bidirectional transactions. The key points are:

- **Self-Join**: Join the table with itself where the `payer` of one row is the `recipient` in another and vice versa.
- **Ordering the Pair**: Use functions like `LEAST()` and `GREATEST()` to have a consistent order of the two IDs. This prevents duplicate counts for the same relationship.
- **Distinct Counting**: After the self-join, select distinct pairs and count them.

