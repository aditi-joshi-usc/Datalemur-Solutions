# SQL Query: Count Tax Filings for TurboTax and QuickBooks  

## Problem Statement  
Intuit provides a range of tax filing products, including TurboTax and QuickBooks, available in various versions.  
Each user can file taxes once a year using only one product.  

Write a query to determine the total number of tax filings made using TurboTax and QuickBooks.  

## Table: `filed_taxes`  

| Column Name  | Type     |
|-------------|----------|
| filing_id   | integer  |
| user_id     | varchar  |
| filing_date | datetime |
| product     | varchar  |

## Example Input  

| filing_id | user_id | filing_date | product                   |
|----------|--------|------------|---------------------------|
| 1        | 1      | 4/14/2019   | TurboTax Desktop 2019      |
| 2        | 1      | 4/15/2020   | TurboTax Deluxe           |
| 3        | 1      | 4/15/2021   | TurboTax Online           |
| 4        | 2      | 4/07/2020   | TurboTax Online           |
| 5        | 2      | 4/10/2021   | TurboTax Online           |
| 6        | 3      | 4/07/2020   | TurboTax Online           |
| 7        | 3      | 4/15/2021   | TurboTax Online           |
| 8        | 3      | 3/11/2022   | QuickBooks Desktop Pro    |
| 9        | 4      | 4/15/2022   | QuickBooks Online         |

## Expected Output  

| turbotax_total | quickbooks_total |
|---------------|------------------|
| 7             | 2                |

## Explanation  
- A total of **7 tax filings** were made using **TurboTax**.  
- A total of **2 tax filings** were made using **QuickBooks**.  

Any version of TurboTax (e.g., "TurboTax Desktop 2019", "TurboTax Deluxe", "TurboTax Online") counts towards the TurboTax total. Similarly, any version of QuickBooks (e.g., "QuickBooks Desktop Pro", "QuickBooks Online") counts towards the QuickBooks total.  
