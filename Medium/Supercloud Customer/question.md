# Microsoft Azure Supercloud Customer Analysis

## Problem Statement
Identify customers who qualify as "Supercloud customers" - those who have purchased at least one product from every product category available in Azure's product catalog.

## Definition
A Supercloud customer is defined as a customer who has:
- Purchased at least one product
- From every product category
- Listed in the `products` table

## Tables

### customer_contracts
| Column Name  | Type    |
|-------------|---------|
| customer_id | integer |
| product_id  | integer |
| amount      | integer |

#### Sample Data
| customer_id | product_id | amount |
|------------|------------|---------|
| 1          | 1         | 1000    |
| 1          | 3         | 2000    |
| 1          | 5         | 1500    |
| 2          | 2         | 3000    |
| 2          | 6         | 2000    |

### products
| Column Name       | Type   |
|------------------|--------|
| product_id       | integer|
| product_category | string |
| product_name     | string |

#### Sample Data
| product_id | product_category | product_name               |
|------------|-----------------|---------------------------|
| 1          | Analytics       | Azure Databricks          |
| 2          | Analytics       | Azure Stream Analytics    |
| 4          | Containers      | Azure Kubernetes Service  |
| 5          | Containers      | Azure Service Fabric      |
| 6          | Compute         | Virtual Machines          |
| 7          | Compute         | Azure Functions           |

## Expected Output
| customer_id |
|------------|
| 1          |

## Explanation
- Customer 1 qualifies as a Supercloud customer because they:
  - Purchased products from Analytics category
  - Purchased products from Containers category
  - Purchased products from Compute category
- Customer 2 is not a Supercloud customer because they:
  - Did not purchase any products from the Containers category

## Notes
- A customer must have at least one purchase in each product category to qualify
- The amount spent in each category is not relevant for this analysis
- Only the presence of a purchase in each category matters
