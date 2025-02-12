# Q3 2023 Unique Query Histogram

This guide demonstrates how to generate a histogram displaying:
1. The **number of unique queries** each employee ran during **Q3 2023** (from July 1, 2023 to September 30, 2023).  
2. The **count of employees** who ran exactly that many unique queries (including those who ran none).

---

## 1. Data Model

### `queries` Table
| Column Name       | Type      | Description                                             |
|-------------------|-----------|---------------------------------------------------------|
| `employee_id`     | integer   | The ID of the employee who executed the query.          |
| `query_id`        | integer   | The unique identifier for each query (Primary Key).     |
| `query_starttime` | datetime  | The timestamp when the query started (Q3 2023 filter).  |
| `execution_time`  | integer   | The duration of the query execution in seconds.         |

### `employees` Table
| Column Name    | Type    | Description                               |
|----------------|---------|-------------------------------------------|
| `employee_id`  | integer | The ID of the employee (Primary Key).     |
| `full_name`    | string  | The full name of the employee.            |
| `gender`       | string  | The gender of the employee.               |

---

## 2. Objective

- **Count distinct queries** by `employee_id` where `query_starttime` is **between** July 1, 2023 and September 30, 2023 (inclusive of July 1, exclusive of October 1).
- **Group** employees by their number of **unique** queries.
- **Include** employees who did not run any queries in this timeframe (their unique query count is 0).

---

## 3. Example Data

### 3.1 Sample `queries` (Partial)

| employee_id | query_id | query_starttime      | execution_time |
|-------------|----------|----------------------|----------------|
| 226         | 856987   | 07/01/2023 01:04:43  | 2698           |
| 132         | 286115   | 07/01/2023 03:25:12  | 2705           |
| 221         | 33683    | 07/01/2023 04:34:38  | 91             |
| 240         | 17745    | 07/01/2023 14:33:47  | 2093           |
| 110         | 413477   | 07/02/2023 10:55:14  | 470            |

### 3.2 Sample `employees`

| employee_id | full_name          | gender |
|-------------|--------------------|--------|
| 1           | Judas Beardon      | Male   |
| 2           | Lainey Franciotti  | Female |
| 3           | Ashbey Strahan     | Male   |
| ...         | ...                | ...    |

---
