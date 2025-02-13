# Manufacturers with Losses in Pharmacy Sales

## Problem Statement

CVS Health is analyzing its **pharmacy sales data** to determine which drugs resulted in **losses**. Each drug is manufactured by a **single manufacturer**.

Write a SQL query to identify **manufacturers associated with drugs that incurred losses** and calculate the **total amount of losses incurred**.

### Expected Output:
- **Manufacturer name**
- **Number of drugs that resulted in losses**
- **Total losses (absolute value)**

The output should be **sorted in descending order** based on **total losses**, displaying the highest losses first.

---

## Formula for Loss Calculation

A drug incurs a **loss** if:
```
total_sales < cogs
```

**Total Loss** for a drug:
```
total_loss = ABS(total_sales - cogs)
```


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

| product_id | units_sold | total_sales  | cogs        | manufacturer  | drug                         |
|------------|-----------|-------------|------------|--------------|------------------------------|
| 156        | 89514     | 3130097.00  | 3427421.73 | Biogen       | Acyclovir                    |
| 25         | 222331    | 2753546.00  | 2974975.36 | AbbVie       | Lamivudine and Zidovudine    |
| 50         | 90484     | 2521023.73  | 2742445.90 | Eli Lilly    | Dermasorb TA Complete Kit    |
| 98         | 110746    | 813188.82   | 140422.87  | Biogen       | Medi-Chord                   |

---

## Expected Output

| manufacturer | drug_count | total_loss  |
|-------------|-----------|------------|
| Biogen      | 1         | 297324.73  |
| AbbVie      | 1         | 221429.36  |
| Eli Lilly   | 1         | 221422.17  |

---
