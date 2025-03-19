# SQL Problem: Average Annual Revenue per Salesforce Customer by Market Segment

## Problem Description

Assuming Salesforce operates on a per user (per seat) pricing model, we have a table containing contracts data and another table containing customer demographics. Write a query to calculate the average annual revenue per Salesforce customer in three market segments: SMB, Mid-Market, and Enterprise. 

**Output Requirements:**  
- The result should display one row with three columns: `smb_avg_revenue`, `mid_avg_revenue`, and `enterprise_avg_revenue`.

**Assumptions:**
- **Yearly seat cost** refers to the cost per seat.
- Each customer may have one or more contracts, and the annual revenue per customer is the sum of revenue from all contracts.
- **Market segment definitions:**
  - **SMB:** less than 100 employees
  - **Mid-Market:** 100 to 999 employees
  - **Enterprise:** 1000 employees or more  
- The terms "average deal size" and "average revenue" both refer to the average annual revenue generated per customer in each market segment.

## Table Structures

### contracts Table
| Column Name      | Type    |
|------------------|---------|
| customer_id      | integer |
| num_seats        | integer |
| yearly_seat_cost | integer |
| *Example Row:*   |         |
| 2690             | 50      | 25         |

### customers Table
| Column Name    | Type     |
|----------------|----------|
| customer_id    | integer  |
| name           | varchar  |
| employee_count | integer  |
| *Example Row:* |          |
| 4520           | DBT Labs | 500        |

## Example Input

### contracts
| customer_id | num_seats | yearly_seat_cost |
|-------------|-----------|------------------|
| 2690        | 50        | 25               |
| 4520        | 200       | 50               |
| 4520        | 150       | 50               |
| 4520        | 150       | 50               |
| 7832        | 878       | 50               |

### customers
| customer_id | name       | employee_count |
|-------------|------------|----------------|
| 2690        | DataLemur  | 99             |
| 4520        | DBT Labs   | 500            |
| 7832        | GitHub     | 1000           |

*Note:* Although the sample input for GitHub in some examples shows 878 employees, to classify GitHub as an Enterprise customer (as explained below), its `employee_count` should be **1000 or more**.

## Example Output

| smb_avg_revenue | mid_avg_revenue | enterprise_avg_revenue |
|-----------------|-----------------|------------------------|
| 1250            | 25000           | 43900                  |

**Explanation:**

- **SMB (DataLemur):**  
  - DataLemur (customer ID 2690) is classified as SMB (employee_count < 100).  
  - Has a single contract with 50 seats at a yearly seat cost of $25.  
  - Revenue: 50 * 25 = **$1,250**.

- **Mid-Market (DBT Labs):**  
  - DBT Labs (customer ID 4520) is the only Mid-Market customer (employee_count between 100 and 999).  
  - Has three contracts totaling 200 + 150 + 150 = **500 seats** at a yearly seat cost of $50.  
  - Revenue: 500 * 50 = **$25,000**.

- **Enterprise (GitHub):**  
  - GitHub (customer ID 7832) is classified as Enterprise (employee_count >= 1000).  
  - Has one contract with **878 seats** at a yearly seat cost of $50.  
  - Revenue: 878 * 50 = **$43,900**.

## SQL Query

```sql
WITH customer_revenue AS (
  SELECT 
    c.customer_id,
    SUM(ct.num_seats * ct.yearly_seat_cost) AS annual_revenue,
    c.employee_count
  FROM contracts ct
  JOIN customers c ON ct.customer_id = c.customer_id
  GROUP BY c.customer_id, c.employee_count
)
SELECT 
  ROUND(AVG(CASE WHEN employee_count < 100 THEN annual_revenue END), 0) AS smb_avg_revenue,
  ROUND(AVG(CASE WHEN employee_count BETWEEN 100 AND 999 THEN annual_revenue END), 0) AS mid_avg_revenue,
  ROUND(AVG(CASE WHEN employee_count >= 1000 THEN annual_revenue END), 0) AS enterprise_avg_revenue
FROM customer_revenue;
