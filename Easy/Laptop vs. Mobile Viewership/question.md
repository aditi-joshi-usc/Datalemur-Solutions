# Calculate Total Viewership by Device Type

## **Problem Statement**
Given a table on user viewership categorized by device type (`laptop`, `tablet`, and `phone`), write a query to calculate:
1. The **total viewership for laptops** (`laptop_views`).
2. The **total viewership for mobile devices**, where mobile is defined as the sum of **tablet** and **phone** viewership (`mobile_views`).

## **Table Schema**
### **`viewership` Table:**
| Column Name  | Type   | Description |
|-------------|--------|-------------|
| user_id     | integer | Unique identifier for each user |
| device_type | string  | Device used for viewership (`'laptop'`, `'tablet'`, `'phone'`) |
| view_time   | timestamp | Timestamp of the view |

## **Example Input**
| user_id | device_type | view_time            |
|---------|------------|----------------------|
| 123     | tablet     | 01/02/2022 00:00:00  |
| 125     | laptop     | 01/07/2022 00:00:00  |
| 128     | laptop     | 02/09/2022 00:00:00  |
| 129     | phone      | 02/09/2022 00:00:00  |
| 145     | tablet     | 02/24/2022 00:00:00  |

## **Expected Output**
| laptop_views | mobile_views |
|-------------|--------------|
| 2           | 3            |

## **Explanation**
- **Laptops (`laptop_views`)**:
  - There are **2** views from laptops (`user_id 125` and `user_id 128`).
- **Mobiles (`mobile_views`)**:
  - **Tablet views:** `user_id 123`, `user_id 145` → **2 views**
  - **Phone views:** `user_id 129` → **1 view**
  - **Total mobile views:** `2 (tablet) + 1 (phone) = 3`

## **Edge Cases Considered**
- **No laptop views** → The `laptop_views` count should be `0`.
- **No mobile views** → The `mobile_views` count should be `0`.
- **Users with multiple views on different devices** → Each view is counted separately.
- **Dataset with missing or new device types** → The query should only consider `'laptop'`, `'tablet'`, and `'phone'`.

## **Use Case**
This query helps in analyzing **device-based user engagement**, providing insights into which device types contribute the most to total viewership. 📊🚀
