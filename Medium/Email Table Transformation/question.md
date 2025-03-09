#### Email Table Transformation

**Facebook SQL Interview Question**

**Question:**
Each Facebook user can designate a personal email address, a business email address, and a recovery email address. Unfortunately, the table is currently in the wrong format, so you need to transform its structure to show the following columns: user id, personal email, business email, and recovery email. Sort your answer by user id in ascending order.

**Users Table:**
| Column Name | Type    |
|-------------|---------|
| user_id     | integer |
| email_type  | varchar |
| email       | varchar |

**Users Example Input:**
| user_id | email_type | email                      |
|---------|------------|----------------------------|
| 123     | personal   | hello@nicksingh.com       |
| 123     | business   | nick@datalemur.com        |
| 123     | recovery   | ns2se@virginia.edu        |
| 234     | personal   | aubrey1986@gmail.com       |
| 234     | business   | mgmt@ovo.com               |

**Example Output:**
| user_id | personal                 | business                | recovery                |
|---------|--------------------------|-------------------------|-------------------------|
| 123     | hello@nicksingh.com     | nick@datalemur.com     | ns2se@virginia.edu     |
| 234     | aubrey1986@gmail.com     | mgmt@ovo.com           |                         |

**Explanation:**
This task is basically just asking you to pivot/transform the shape of the data. It's all the same data as the input above, just in a different format. Each row will represent a single user with all three of their emails listed. The first row shows User ID 123; their personal email is **hello@nicksingh.com**, their business email is **nick@datalemur.com**, and their recovery email is **ns2se@virginia.edu**.
