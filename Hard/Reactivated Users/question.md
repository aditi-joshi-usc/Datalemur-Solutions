#### Reactivated Users Query

**Facebook SQL Interview Question**

**Question:**
Imagine you're provided with a table containing information about user logins on Facebook in 2022. Write a query that determines the number of reactivated users for a given month. Reactivated users are those who were inactive the previous month but logged in during the current month.

**Assumptions:**
- The `user_logins` table only contains data for the year 2022 and there are no missing dates within that period.
- For instance, if a user whose first login date is on 3 March 2022, we assume that they had previously logged in during the year 2021. Although the data for their previous logins is not present in the `user_logins` table, we consider these users as reactivated users.

**User Logins Table:**
| Column Name | Type     |
|-------------|----------|
| user_id     | integer  |
| login_date   | datetime |

**Example Input:**
| user_id | login_date           |
|---------|----------------------|
| 123     | 02/22/2022 12:00:00  |
| 112     | 03/15/2022 12:00:00  |
| 245     | 03/28/2022 12:00:00  |
| 123     | 05/01/2022 12:00:00  |
| 725     | 05/25/2022 12:00:00  |

**Example Output:**
| mth | reactivated_users |
|-----|-------------------|
| 2   | 1                 |
| 3   | 2                 |
| 5   | 2                 |

**Explanation:**
- In February 2022, we have 1 reactivated user, user 123. They had previously logged in during 2021 and recently reactivated their account in February 2022.
- In March 2022, we have 2 reactivated users. Users 112 and 245 were inactive in the previous months but logged in during March 2022, indicating that they reactivated their accounts.
- Moving on to May 2022, we still have 2 reactivated users. User 123, who had previously reactivated in February 2022, reactivated their account again in May 2022. Additionally, user 725, who was inactive in the previous months, logged in during May 2022, indicating that they reactivated their account once again.
