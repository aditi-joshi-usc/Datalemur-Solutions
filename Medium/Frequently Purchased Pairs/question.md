

# Walmart Product Combinations Analysis

## Problem Statement
Write a query to determine the count of unique product combinations that are purchased together in the same transaction from Walmart's transaction data. The analysis should:
- Consider only transactions with at least two products
- Display output in ascending order of product combinations
- Count unique combinations (e.g., if apples and bananas are bought together in two transactions, count as one combination)

## Example
If there are:
- Two transactions where apples and bananas are bought together
- One transaction where bananas and soy milk are bought together
The total count of unique combinations would be 2.

## Tables

### transactions
| Column Name      | Type      |
|-----------------|-----------|
| transaction_id  | integer   |
| product_id      | integer   |
| user_id         | integer   |
| transaction_date| datetime  |

#### Sample Data
| transaction_id | product_id | user_id | transaction_date        |
|---------------|------------|----------|------------------------|
| 231574        | 111        | 234     | 03/01/2022 12:00:00   |
| 231574        | 444        | 234     | 03/01/2022 12:00:00   |
| 231574        | 222        | 234     | 03/01/2022 12:00:00   |
| 137124        | 111        | 125     | 03/05/2022 12:00:00   |

### products
| Column Name   | Type    |
|--------------|---------|
| product_id   | integer |
| product_name | string  |

#### Sample Data
| product_id | product_name      |
|------------|------------------|
| 111        | apple            |
| 222        | soy milk         |
| 333        | instant oatmeal  |
| 444        | banana           |
| 555        | chia seed        |

## Expected Output
| combination           |
|----------------------|
| 111","222","444     |

## Notes
- The `products` table may or may not be needed for the solution
- Problem statement updated as of April 17th, 2023
