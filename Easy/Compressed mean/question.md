# Calculating the Mean Number of Items per Order

This guide explains how to calculate the **mean number of items per order** using two values in the `items_per_order` table:

1. `item_count` – The number of items in a particular type of order.  
2. `order_occurrences` – The number of orders that have that specific item count.

---

## 1. Table Definition

### `items_per_order`

| Column Name        | Type    | Description                                             |
|--------------------|---------|---------------------------------------------------------|
| `item_count`       | integer | The count of items in an order (1, 2, 3, etc.).         |
| `order_occurrences`| integer | How many orders have that item count.                  |

---

## 2. Example Data

| item_count | order_occurrences |
|------------|-------------------|
| 1          | 500               |
| 2          | 1000              |
| 3          | 800               |
| 4          | 1000              |

In this example:
- **500 orders** contain exactly **1 item**,
- **1000 orders** contain exactly **2 items**,
- **800 orders** contain exactly **3 items**,
- **1000 orders** contain exactly **4 items**.

---

## 3. Mean Calculation

The formula for the mean (arithmetic average) number of items per order is:

\[
\text{Mean} = \frac{\sum(\text{item_count} \times \text{order_occurrences})}{\sum(\text{order_occurrences})}
\]

### Example Calculation

1. **Total items** =  
   \[
   (1 \times 500) + (2 \times 1000) + (3 \times 800) + (4 \times 1000) = 500 + 2000 + 2400 + 4000 = 8900
   \]

2. **Total orders** =  
   \[
   500 + 1000 + 800 + 1000 = 3300
   \]

3. **Mean** =  
   \[
   \frac{8900}{3300} = 2.6969... \approx 2.7
   \]

Hence, the **mean number of items per order** is **2.7**.

---

