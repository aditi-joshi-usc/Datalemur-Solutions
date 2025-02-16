# SQL Query: Calculate Final Account Balance

## Problem Statement  
Given a table containing information about bank deposits and withdrawals made using PayPal, write a query to retrieve the final account balance for each account, taking into account all the transactions recorded in the table. Assume that there are no missing transactions.

## Table: `transactions`

| Column Name      | Type    |
|-----------------|---------|
| transaction_id  | integer |
| account_id      | integer |
| amount         | decimal |
| transaction_type | varchar |

## Example Input  

| transaction_id | account_id | amount | transaction_type |
|--------------|------------|--------|----------------|
| 123          | 101        | 10.00  | Deposit        |
| 124          | 101        | 20.00  | Deposit        |
| 125          | 101        | 5.00   | Withdrawal     |
| 126          | 201        | 20.00  | Deposit        |
| 128          | 201        | 10.00  | Withdrawal     |

## Expected Output  

| account_id | final_balance |
|------------|--------------|
| 101        | 25.00        |
| 201        | 10.00        |

## Explanation  
For `account_id = 101`:  
- Deposits: $10.00 + $20.00 = $30.00  
- Withdrawals: $5.00  
- Final Balance: $30.00 - $5.00 = $25.00  

For `account_id = 201`:  
- Deposits: $20.00  
- Withdrawals: $10.00  
- Final Balance: $20.00 - $10.00 = $10.00  
