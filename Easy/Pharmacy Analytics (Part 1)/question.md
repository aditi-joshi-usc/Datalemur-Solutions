# Top 3 Most Profitable Drugs

## Problem Statement

CVS Health wants to analyze its **pharmacy sales** and determine how well different drugs are selling. Each drug is produced by only **one manufacturer**.

Write a SQL query to find the **top 3 most profitable drugs**, along with their **total profit**. The result should be displayed in **descending order of total profit**.

---

## Formula for Total Profit

Total Profit = Total Sales - Cost of Goods Sold (COGS)


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
| 9          | 37410     | 293452.54   | 208876.01  | Eli Lilly    | Zyprexa           |
| 34         | 94698     | 600997.19   | 521182.16  | AstraZeneca  | Surmontil         |
| 61         | 77023     | 500101.61   | 419174.97  | Biogen       | Varicose Relief   |
| 136        | 144814    | 1084258.00  | 1006447.73 | Biogen       | Burkhart          |

---

## Expected Output

| drug             | total_profit |
|-----------------|-------------|
| Zyprexa         | 84576.53     |
| Varicose Relief | 80926.64     |
| Surmontil       | 79815.03     |

---
