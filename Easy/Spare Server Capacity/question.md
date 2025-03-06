# Microsoft Azure Data Center Capacity Planning

## Question
Microsoft Azure's capacity planning team wants to understand how much data its customers are using and how much spare capacity is left in each of its data centers. You’re given three tables: `customers`, `data_centers`, and `forecasted_demand`.

Write a query to find each data center’s total unused server capacity. Output the data center ID in ascending order and the total spare capacity.

### Definitions
- **monthly_capacity**: The total monthly server capacity for each data center.
- **monthly_demand**: The server demand for each customer.

### Tables

#### datacenters Table
| Column Name      | Type    |
|------------------|---------|
| datacenter_id    | integer |
| name             | string  |
| monthly_capacity | integer |

#### Example Input for datacenters
| datacenter_id | name        | monthly_capacity |
|---------------|-------------|------------------|
| 1             | London      | 100              |
| 3             | Amsterdam   | 250              |
| 4             | Hong Kong   | 400              |

#### forecasted_demand Table
| Column Name      | Type    |
|------------------|---------|
| customer_id      | integer |
| datacenter_id    | integer |
| monthly_demand   | integer |

#### Example Input for forecasted_demand
| customer_id | datacenter_id | monthly_demand |
|-------------|---------------|-----------------|
| 109         | 4             | 120             |
| 144         | 3             | 60              |
| 144         | 4             | 105             |
| 852         | 1             | 60              |
| 852         | 3             | 178             |

### Example Output
| datacenter_id | spare_capacity |
|---------------|----------------|
| 1             | 40             |
| 3             | 12             |
| 4             | 175            |
