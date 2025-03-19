# SQL Problem: Calculating the Percentage of Invalid Searches

## Problem Description
Assume you are given the table below containing the information on the searches attempted and the percentage of invalid searches by country. Write a query to obtain the percentage of invalid searches.

**Output requirements:**  
- The result should display the country (in ascending order), the total number of search attempts, and the overall percentage of invalid searches (rounded to 2 decimal places).

**Notes:**
- `num_search` represents the number of searches attempted.
- `invalid_result_pct` represents the percentage of invalid searches as a decimal.
- Rows where either `num_search` or `invalid_result_pct` is null should be excluded.
- To compute the percentage properly (and avoid integer division), multiply by **100.0**.

## Table: `search_category`
| Column Name        | Type    |
|--------------------|---------|
| country            | string  |
| search_cat         | string  |
| num_search         | integer |
| invalid_result_pct | decimal |

## Example Input
| country | search_cat | num_search | invalid_result_pct |
|---------|------------|------------|--------------------|
| UK      | home       | null       | null               |
| UK      | tax        | 98000      | 1.00               |
| UK      | travel     | 100000     | 3.25               |

## Example Output
| country | total_search | invalid_searches_pct |
|---------|--------------|----------------------|
| UK      | 198000       | 2.14                 |

**Explanation:**  
For the UK:
- **Tax searches:** 98,000 searches with 1.00% invalid results yield 980 invalid searches.
- **Travel searches:** 100,000 searches with 3.25% invalid results yield 3,250 invalid searches.
- **Total invalid searches:** 980 + 3,250 = 4,230.
- **Total searches:** 98,000 + 100,000 = 198,000.
- **Overall percentage:** (4230 / 198000) * 100.0 ≈ 2.14%.

## SQL Query
```sql
SELECT country,
       SUM(num_search) AS total_search,
       ROUND((SUM(num_search * invalid_result_pct) / SUM(num_search)) * 100.0, 2) AS invalid_searches_pct
FROM search_category
WHERE num_search IS NOT NULL
  AND invalid_result_pct IS NOT NULL
GROUP BY country
ORDER BY country ASC;
