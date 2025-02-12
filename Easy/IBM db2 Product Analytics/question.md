# Q3 2023 Query Histogram

Below is an example approach to generate a histogram showing the number of **unique queries** executed by each employee during **Q3 2023** (July 1, 2023 through September 30, 2023), as well as the count of employees who executed **no queries**.

---

## Table Definitions

### `queries` Table

| Column Name      | Type      | Description                                         |
|------------------|-----------|-----------------------------------------------------|
| `employee_id`    | integer   | The ID of the employee who executed the query.      |
| `query_id`       | integer   | The unique identifier for each query (Primary Key). |
| `query_starttime`| datetime  | The timestamp when the query started.               |
| `execution_time` | integer   | The duration of the query execution in seconds.     |

### `employees` Table

| Column Name    | Type    | Description                              |
|----------------|---------|------------------------------------------|
| `employee_id`  | integer | The ID of the employee (Primary Key).    |
| `full_name`    | string  | The full name of the employee.           |
| `gender`       | string  | The gender of the employee.              |

---

## Objective

1. Count **distinct** (`unique`) queries per employee during **Q3 2023**:
   - **Q3 2023** means `query_starttime >= '2023-07-01'` AND `query_starttime < '2023-10-01'`.
2. Count how many employees have **0 unique queries** (i.e., did not run any queries in that period).
3. Build a histogram:
   - `unique_queries` = how many unique queries an employee ran (e.g., 0, 1, 2, 3, ...)
   - `employee_count` = how many employees fall into that category.

---

