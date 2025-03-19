# Problem Statement

For every customer that bought **Photoshop**, return a list of the customers, and the total spent on all the products *except* for Photoshop products.

Sort your answer by customer ids in ascending order.

## Table Schema: adobe_transactions

- **customer_id** (integer)
- **product** (string)
- **revenue** (integer)

## Example Input

| customer_id | product        | revenue |
|-------------|----------------|---------|
| 123         | Photoshop      | 50      |
| 123         | Premier Pro    | 100     |
| 123         | After Effects  | 50      |
| 234         | Illustrator    | 200     |
| 234         | Premier Pro    | 100     |

## Example Output

| customer_id | revenue |
|-------------|---------|
| 123         | 150     |

**Explanation:**  
- **Customer 123**: Bought Photoshop, then spent $100 on Premier Pro and $50 on After Effects, totaling $150 on products other than Photoshop.  
- **Customer 234**: Is not included because they didn't purchase Photoshop.
