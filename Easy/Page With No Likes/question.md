# Find Facebook Pages with Zero Likes

## Problem Statement
Given two tables containing data about Facebook Pages and their respective likes, write a query to return the IDs of Facebook pages that have **zero likes**. The output should be **sorted in ascending order** based on the page IDs.

## Table Schema

### **`pages` Table:**
| Column Name | Type    |
|-------------|--------|
| page_id     | integer |
| page_name   | varchar |

### **`page_likes` Table:**
| Column Name | Type    |
|-------------|--------|
| user_id     | integer |
| page_id     | integer |
| liked_date  | datetime |

## Example Input

### **`pages` Table:**
| page_id | page_name              |
|---------|------------------------|
| 20001   | SQL Solutions          |
| 20045   | Brain Exercises        |
| 20701   | Tips for Data Analysts |

### **`page_likes` Table:**
| user_id | page_id | liked_date          |
|---------|--------|--------------------|
| 111     | 20001  | 04/08/2022 00:00:00 |
| 121     | 20045  | 03/12/2022 00:00:00 |
| 156     | 20001  | 07/25/2022 00:00:00 |

## Expected Output

| page_id |
|---------|
| 20701   |

### **Explanation**
- Page **20001** has been liked by two users (**111** and **156**), so it is **excluded**.
- Page **20045** has been liked by user **121**, so it is **excluded**.
- Page **20701** has **no likes**, so it is **included** in the result.

## **Edge Cases Considered**
- **Pages with multiple likes**: These should be excluded.
- **Pages with zero likes**: These should be included.
- **No likes in `page_likes` table**: If `page_likes` is empty, all pages should be included.
- **Pages without any records in `page_likes`**: Ensure that missing entries are handled properly.

This query efficiently finds Facebook Pages that have never received a like, helping to identify inactive or less engaging pages. 🚀
