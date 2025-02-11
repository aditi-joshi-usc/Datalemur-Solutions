# Employee Salary Analysis: Identifying Employees Earning More Than Their Direct Managers

Companies often perform salary analyses to ensure fair compensation practices. One useful analysis is to check if there are any employees who earn more than their direct managers.

## Problem Statement

As a HR Analyst, your task is to identify all employees who earn more than their direct managers. The output should include the employee's ID and name.

## Employee Table Schema

| Column Name    | Type    | Description                               |
| -------------- | ------- | ----------------------------------------- |
| employee_id    | integer | The unique ID of the employee.            |
| name           | string  | The name of the employee.                 |
| salary         | integer | The salary of the employee.               |
| department_id  | integer | The department ID of the employee.        |
| manager_id     | integer | The manager ID of the employee.           |

## Example Input

| employee_id | name             | salary | department_id | manager_id |
| ----------- | ---------------- | ------ | ------------- | ---------- |
| 1           | Emma Thompson    | 3800   | 1             | 6          |
| 2           | Daniel Rodriguez | 2230   | 1             | 7          |
| 3           | Olivia Smith     | 7000   | 1             | 8          |
| 4           | Noah Johnson     | 6800   | 2             | 9          |
| 5           | Sophia Martinez  | 1750   | 1             | 11         |
| 6           | Liam Brown       | 13000  | 3             | NULL       |
| 7           | Ava Garcia       | 12500  | 3             | NULL       |
| 8           | William Davis    | 6800   | 2             | NULL       |

## Example Output

| employee_id | employee_name |
| ----------- | ------------- |
| 3           | Olivia Smith  |

*Explanation:*  
Olivia Smith (employee_id 3) earns $7,000, which is more than her direct manager, William Davis (employee_id 8) who earns $6,800.

