# SQL Problem: Identifying Repeat Purchasers

## Problem Description
Assume you are given the table below containing information on user purchases. Write a query to obtain the **number of users** who purchased the same product on **two or more different days**. **Output** the number of unique users.

**Note:**  
On 26 Oct 2022, the purchases data set was expanded, so the official output may vary from previous versions.

## Table: `purchases`
| Column Name   | Type     |
|---------------|----------|
| user_id       | integer  |
| product_id    | integer  |
| quantity      | integer  |
| purchase_date | datetime |

## Example Input
| user_id | product_id | quantity | purchase_date        |
|---------|------------|----------|----------------------|
| 536     | 3223       | 6        | 01/11/2022 12:33:44  |
| 827     | 3585       | 35       | 02/20/2022 14:05:26  |
| 536     | 3223       | 5        | 03/02/2022 09:33:28  |
| 536     | 1435       | 10       | 03/02/2022 08:40:00  |
| 827     | 2452       | 45       | 04/09/2022 00:00:00  |

## Example Output
```
repeat_purchasers 1
```
