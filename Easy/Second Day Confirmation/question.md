Write a query to display the user IDs of those who did not confirm their sign-up on the first day but confirmed on the second day.

Definition:

action_date refers to the date when users activated their accounts and confirmed their sign-up through text messages.

emails Table:
Column Name | Type
------------|------
email_id | integer
user_id | integer
signup_date | datetime

emails Example Input:
email_id | user_id | signup_date
---------|--------|------------
125 | 7771 | 06/14/2022 00:00:00
433 | 1052 | 07/09/2022 00:00:00

texts Table:
Column Name | Type
------------|------
text_id | integer
email_id | integer
signup_action | string ('Confirmed', 'Not confirmed')
action_date | datetime

texts Example Input:
text_id | email_id | signup_action | action_date
--------|---------|--------------|------------
6878 | 125 | Confirmed | 06/14/2022 00:00:00
6997 | 433 | Not Confirmed | 07/09/2022 00:00:00
7000 | 433 | Confirmed | 07/10/2022 00:00:00

Example Output:
user_id
-------
1052

Explanation:
Only User 1052 confirmed their sign-up on the second day.

