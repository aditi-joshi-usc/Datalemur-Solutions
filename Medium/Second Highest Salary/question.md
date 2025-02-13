# Finding the Second Highest Salary

## **Problem Statement**
As an HR analyst at a tech company, you are tasked with analyzing employee salaries. Your manager wants to understand the pay distribution and asks you to determine the **second highest salary** among all employees.

If multiple employees share the same second highest salary, **display it only once**.

---

## **Schema Description**
The **employee** table has the following structure:

| Column Name   | Type     | Description                                  |
|--------------|---------|----------------------------------------------|
| employee_id  | integer | The unique ID of the employee.              |
| name        | string  | The name of the employee.                    |
| salary      | integer | The salary of the employee.                  |
| department_id | integer | The department ID of the employee.           |
| manager_id   | integer | The manager ID of the employee.              |

---

## **Example Input**
| employee_id | name            | salary | department_id | manager_id |
|------------|----------------|--------|--------------|-----------|
| 1          | Emma Thompson  | 3800   | 1            | 6         |
| 2          | Daniel Rodriguez | 2230  | 1            | 7         |
| 3          | Olivia Smith   | 2000   | 1            | 8         |

---

## **Example Output**
| second_highest_salary |
|----------------------|
| 2230                |

The second highest salary is **$2,230**, which appears only once in the output.

---

