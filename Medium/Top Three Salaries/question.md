# Identifying High Earners in Each Department

## Problem Statement

As part of an ongoing analysis of salary distribution within the company, your manager has requested a report identifying **high earners** in each department. A "high earner" within a department is defined as an employee with a salary **ranking among the top three salaries** (including ties) within that department.

You are to display each qualifying employee's:
- **Department name**
- **Employee name**
- **Salary**

### Additional Details & Requirements

1. **Join** the `employee` and `department` tables to retrieve department names.
2. Use a **ranking window function** so that employees with **the same salary** receive the same rank.
3. Select only the top three ranks **per department** (i.e., `rank <= 3`).
4. Sort the results by:
   1. **Department name** in ascending order,
   2. **Salary** in descending order,
   3. **Employee name** in ascending order (when there’s a tie in salary).

> **Note**: As of June 18th, the requirement for unique salaries has been removed, and we have **revised the sorting order** for the results.

---

## Schemas

### `employee` Table

| Column         | Type     | Description                         |
|----------------|----------|-------------------------------------|
| employee_id    | integer  | The unique ID of the employee       |
| name           | string   | The name of the employee            |
| salary         | integer  | The salary of the employee          |
| department_id  | integer  | The department ID of the employee   |
| manager_id     | integer  | The manager ID of the employee      |

**Example Input** (truncated):

| employee_id | name             | salary | department_id | manager_id |
|-------------|------------------|--------|--------------|-----------|
| 1           | Emma Thompson    | 3800   | 1            | 6         |
| 2           | Daniel Rodriguez | 2230   | 1            | 7         |
| 3           | Olivia Smith     | 2000   | 1            | 8         |
| 4           | Noah Johnson     | 6800   | 2            | 9         |
| 5           | Sophia Martinez  | 1750   | 1            | 11        |
| 6           | Liam Brown       | 13000  | 3            |           |
| 7           | Ava Garcia       | 12500  | 3            |           |
| 8           | William Davis    | 6800   | 2            |           |
| 9           | Isabella Wilson  | 11000  | 3            |           |
| 10          | James Anderson   | 4000   | 1            | 11        |

---

### `department` Table

| Column          | Type     | Description                    |
|-----------------|----------|--------------------------------|
| department_id   | integer  | The department ID (primary key)|
| department_name | string   | The name of the department     |

**Example Input**:

| department_id | department_name |
|---------------|-----------------|
| 1             | Data Analytics  |
| 2             | Data Science    |

---

## Desired Output

Display only those employees whose salary rank (within each department) is in the top three. Order the rows by:
1. **department_name** ASC
2. **salary** DESC
3. **name** ASC (tiebreaker for same salary)

---

## Example Output

| department_name | name              | salary |
|-----------------|-------------------|--------|
| Data Analytics  | James Anderson    | 4000   |
| Data Analytics  | Emma Thompson     | 3800   |
| Data Analytics  | Daniel Rodriguez  | 2230   |
| Data Science    | Noah Johnson      | 6800   |
| Data Science    | William Davis     | 6800   |

**Explanation**:
1. In **Data Analytics**, the top three salaries are 4000 (James Anderson), 3800 (Emma Thompson), and 2230 (Daniel Rodriguez). 
2. In **Data Science**, we have two employees earning 6800: Noah Johnson and William Davis. Both appear, with Noah listed first alphabetically (`Noah Johnson` before `William Davis`).

---

