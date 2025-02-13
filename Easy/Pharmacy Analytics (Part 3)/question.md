# Total Drug Sales per Manufacturer

## Problem Statement

CVS Health wants to analyze its **pharmacy sales** and evaluate the performance of different **manufacturers**.

Write a SQL query to calculate the **total drug sales** for each manufacturer. The result should be:
- **Rounded to the nearest million**.
- **Formatted as "$X million"**.
- **Sorted in descending order of total sales**.
- In case of **ties**, sort alphabetically by manufacturer name.

This data will be displayed on a **dashboard for business stakeholders**, so proper formatting is required.

---

## Table: `pharmacy_sales`

| Column Name   | Type      | Description                                          |
|--------------|----------|------------------------------------------------------|
| `product_id` | integer  | Unique identifier for the product                   |
| `units_sold` | integer  | Number of units sold                                |
| `total_sales` | decimal  | Total sales revenue from the product               |
| `cogs`       | decimal  | Cost of Goods Sold (direct cost of producing drug)  |
| `manufacturer` | varchar  | Manufacturer of the drug                           |
| `drug`       | varchar  | Name of the drug                                    |

---

## Example Input

| product_id | units_sold | total_sales  | cogs        | manufacturer  | drug              |
|------------|-----------|-------------|------------|--------------|-------------------|
| 94         | 132362    | 2041758.41  | 1373721.70 | Biogen       | UP and UP        |
| 9          | 37410     | 293452.54   | 208876.01  | Eli Lilly    | Zyprexa          |
| 50         | 90484     | 2521023.73  | 2742445.90 | Eli Lilly    | Dermasorb        |
| 61         | 77023     | 500101.61   | 419174.97  | Biogen       | Varicose Relief  |
| 136        | 144814    | 1084258.00  | 1006447.73 | Biogen       | Burkhart         |

---

## Expected Output

| manufacturer | sale       |
|-------------|-----------|
| Biogen      | $4 million |
| Eli Lilly   | $3 million |

---

## SQL Query

```sql
SELECT 
    manufacturer, 
    CONCAT('$', ROUND(SUM(total_sales) / 1000000), ' million') AS sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC, manufacturer ASC;
