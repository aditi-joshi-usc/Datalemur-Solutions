# SQL Solution: Filling Null Categories in Product Table

## Problem Statement

When accessing Accenture's retailer client's database, you observe that the `category` column in the `products` table contains null values. Your task is to write a query that returns the updated product table with all the category values filled in.

## Assumptions

- Each category is expected to be listed only once in the column and products within the same category should be grouped together based on sequential product IDs.
- The first product in each category will always have a defined category value.
  - For instance, the category for product ID 1 is 'Shoes', then the subsequent product IDs 2 and 3 will be categorised as 'Shoes'.
  - Similarly, product ID 4 is 'Jeans', then the following product ID 5 is categorised as 'Jeans' category, and so forth.

## Solution

```sql
WITH category_counter AS (
    SELECT 
        *, 
        COUNT(category) OVER(ORDER BY product_id) AS count_category
    FROM 
        products
)
SELECT 
    product_id,
    COALESCE(category, MAX(category) OVER(PARTITION BY count_category)) AS category,
    name 
FROM 
    category_counter;
```

## Explanation

1. **The Common Table Expression (CTE)**:
   ```sql
   WITH category_counter AS (
       SELECT 
           *, 
           COUNT(category) OVER(ORDER BY product_id) AS count_category
       FROM 
           products
   )
   ```
   This creates a temporary result set called `category_counter`. Inside this CTE, we use a window function `COUNT(category) OVER(ORDER BY product_id)` to count non-NULL category values as we scan through products in product_id order. This creates a "grouping" where all products meant to have the same category will have the same `count_category` value.

2. **The Main Query**:
   ```sql
   SELECT 
       product_id,
       COALESCE(category, MAX(category) OVER(PARTITION BY count_category)) AS category,
       name 
   FROM 
       category_counter;
   ```
   The main query uses `COALESCE` to return:
   - The original category if it's not NULL
   - Otherwise, it returns the maximum category value within each partition of the same `count_category` value

   Since only the first product in each category has a defined category, that value becomes the maximum (and only non-NULL) value in that partition, which fills in all the NULL values in that group.

## Example Input/Output

### Example Input
| product_id | category | name |
|------------|----------|------|
| 1 | Shoes | Sperry Boat Shoe |
| 2 | NULL | Adidas Stan Smith |
| 3 | NULL | Vans Authentic |
| 4 | Jeans | Levi 511 |
| 5 | NULL | Wrangler Straight Fit |
| 6 | Shirts | Lacoste Classic Polo |
| 7 | NULL | Nautica Linen Shirt |

### Example Output
| product_id | category | name |
|------------|----------|------|
| 1 | Shoes | Sperry Boat Shoe |
| 2 | Shoes | Adidas Stan Smith |
| 3 | Shoes | Vans Authentic |
| 4 | Jeans | Levi 511 |
| 5 | Jeans | Wrangler Straight Fit |
| 6 | Shirts | Lacoste Classic Polo |
| 7 | Shirts | Nautica Linen Shirt |
