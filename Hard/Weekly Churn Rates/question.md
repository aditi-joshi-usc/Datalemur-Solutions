#### Churn Rate Analysis for June 2022

**Facebook SQL Interview Question**

**Question:**
Facebook is analyzing its user signup data for June 2022. Write a query to generate the churn rate by week in June 2022. Output the week number (1, 2, 3, 4, ...) and the corresponding churn rate rounded to 2 decimal places.

**Assumptions:**
- If the last_login date is within 28 days of the signup_date, the user can be considered churned.
- If the last_login is more than 28 days after the signup date, the user didn't churn.

**Users Table:**
| Column Name  | Type       |
|--------------|------------|
| user_id      | integer    |
| signup_date  | datetime   |
| last_login    | datetime   |

**Users Example Input:**
| user_id | signup_date          | last_login           |
|---------|----------------------|----------------------|
| 1001    | 06/01/2022 12:00:00  | 07/05/2022 12:00:00 |
| 1002    | 06/03/2022 12:00:00  | 06/15/2022 12:00:00 |
| 1004    | 06/02/2022 12:00:00  | 06/15/2022 12:00:00 |
| 1006    | 06/15/2022 12:00:00  | 06/27/2022 12:00:00 |
| 1012    | 06/16/2022 12:00:00  | 07/22/2022 12:00:00 |

**Example Output:**
| signup_week | churn_rate |
|-------------|------------|
| 1           | 66.67      |
| 3           | 50.00      |

**Explanation:**
User ids **1001**, **1002**, and **1004** signed up in the first week of June 2022. Out of the 3 users, **1002** and **1004**'s last login is within 28 days from the signup date, hence they are considered churned users.

To calculate the churn rate, we take the number of churned users divided by the total users who signed up in the week. Hence, the calculation for week 1 is: 
- Churned users: 2
- Total users: 3

**Churn Rate Calculation:**
\[
\text{Churn Rate} = \left(\frac{\text{Churned Users}}{\text{Total Users}} \times 100\right) = \left(\frac{2}{3} \times 100\right) = 66.67\%
\]
