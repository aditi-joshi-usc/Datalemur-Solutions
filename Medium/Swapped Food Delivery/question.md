# Zomato Delivery System: Order Swapping Correction Challenge

## Problem Statement

Zomato, a leading online food delivery platform, has encountered a technical issue in their delivery system. Due to a bug in the delivery driver instructions, each food item has been incorrectly swapped with the item in the next row. Your task as a data analyst is to write a SQL query that corrects this swapping error and returns the proper pairing of order IDs and food items.

## Special Condition
If the last item has an odd order ID, it should remain unchanged (not be swapped). This preserves the integrity of the final order in the sequence.

## Database Schema

**Table: `orders`**

| Column Name | Type | Description |
|-------------|------|-------------|
| order_id | integer | The unique identifier for each Zomato order |
| item | string | The name of the food item in each order |

## Example

### Input Data (Incorrect Order-Item Pairings)
| order_id | item |
|----------|------|
| 1 | Chow Mein |
| 2 | Pizza |
| 3 | Pad Thai |
| 4 | Butter Chicken |
| 5 | Eggrolls |
| 6 | Burger |
| 7 | Tandoori Chicken |

### Expected Output (Corrected Order-Item Pairings)
| corrected_order_id | item |
|------------------|------|
| 1 | Pizza |
| 2 | Chow Mein |
| 3 | Butter Chicken |
| 4 | Pad Thai |
| 5 | Burger |
| 6 | Eggrolls |
| 7 | Tandoori Chicken |

## Explanation
- Order IDs 1 and 2 are swapped back to their correct pairings
- Order IDs 3 and 4 are swapped back to their correct pairings
- Order IDs 5 and 6 are swapped back to their correct pairings
- Order ID 7 (being the last odd-numbered order) maintains its original item pairing

## Task
Write a SQL query that corrects the swapped order-item pairings according to the given rules and returns the data in ascending order of the corrected order IDs.
