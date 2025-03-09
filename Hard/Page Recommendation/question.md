#### Page Recommendation Query

**Facebook SQL Interview Question**

**Question:**
Write a query to recommend a page to a user. A recommendation is based on a page liked by user friends. Assume you have two tables: a two-column table of users and their friends, and a two-column table of users and the pages they liked.

**Assumptions:**
- Only recommend the top page to the user, and do not recommend pages that were already liked by the user.
- The top page is defined as the page with the highest number of followers.
- Output the user id and page recommended. Order the result in ascending order by user id.

**Tables:**

**Friendship Table:**
| Column Name | Type   |
|-------------|--------|
| id          | integer|
| user_id     | string |
| friend_id   | string |

**Example Input:**
| id | user_id | friend_id |
|----|---------|-----------|
| 1  | alice   | bob       |
| 2  | alice   | charles   |
| 3  | alice   | david     |

**Page Following Table:**
| Column Name | Type   |
|-------------|--------|
| id          | integer|
| user_id     | string |
| page_id     | string |

**Example Input:**
| id | user_id | page_id  |
|----|---------|----------|
| 1  | alice   | google   |
| 2  | alice   | facebook  |
| 3  | bob     | google   |
| 4  | bob     | linkedin  |
| 5  | bob     | facebook  |

**Example Output:**
| user_id | Page_Recommended |
|---------|------------------|
| alice   | linkedin         |

**Explanation:**
Alice's friend Bob is following Google, LinkedIn, and Facebook pages. However, since Alice is already following Google and Facebook, the only page that can be recommended to her is LinkedIn.
