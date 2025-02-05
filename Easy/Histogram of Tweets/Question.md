# Histogram of Tweets

## Problem Statement
Given a table containing Twitter tweet data, obtain a histogram of tweets posted per user in 2022. The output should include:
- The number of tweets posted per user (tweet count per user as the bucket).
- The number of users who fall into each bucket.

## Table Schema

**tweets Table:**
| Column Name | Type |
|------------|------|
| tweet_id   | integer |
| user_id    | integer |
| msg        | string |
| tweet_date | timestamp |

## Example Input

| tweet_id | user_id | msg | tweet_date |
|----------|--------|-----|------------|
| 214252   | 111    | Am considering taking Tesla private at $420. Funding secured. | 12/30/2021 00:00:00 |
| 739252   | 111    | Despite the constant negative press covfefe | 01/01/2022 00:00:00 |
| 846402   | 111    | Following @NickSinghTech on Twitter changed my life! | 02/14/2022 00:00:00 |
| 241425   | 254    | If the salary is so competitive why won’t you tell me what it is? | 03/01/2022 00:00:00 |
| 231574   | 148    | I no longer have a manager. I can't be managed | 03/23/2022 00:00:00 |

## Expected Output

| tweet_bucket | users_num |
|-------------|-----------|
| 1           | 2         |
| 2           | 1         |

### Explanation:
- Two users posted **exactly one tweet** in 2022.
- One user posted **exactly two tweets** in 2022.

## Edge Cases Considered:
- **Users with zero tweets in 2022**: These users won't appear in the dataset since only tweets from 2022 are counted.
- **Users with a high number of tweets**: The approach efficiently groups users regardless of tweet volume.
- **Multiple users with the same tweet count**: The aggregation ensures that the count is accurate.

This histogram provides insight into user engagement by analyzing tweet distributions, helping identify trends in activity levels. 🚀
