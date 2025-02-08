## SQL Query to Retrieve Top Three Cities with Highest Completed Trade Orders

### Problem Statement
Assume you're given the tables containing completed trade orders and user details in a Robinhood trading system.

Write a query to retrieve the top three cities that have the highest number of completed trade orders listed in descending order. Output the city name and the corresponding number of completed trade orders.

### Tables
#### `trades` Table:
| Column Name | Type | Description |
|-------------|------|-------------|
| order_id    | integer | Unique ID of the trade order |
| user_id     | integer | ID of the user who made the order |
| quantity    | integer | Quantity of stocks traded |
| status      | string  | Status of the trade order ('Completed', 'Cancelled') |
| date        | timestamp | Date and time of the order |
| price       | decimal (5,2) | Price per stock |

#### Example Input for `trades` Table:
| order_id | user_id | quantity | status    | date                  | price |
|----------|--------|----------|-----------|-----------------------|-------|
| 100101   | 111    | 10       | Cancelled | 08/17/2022 12:00:00   | 9.80  |
| 100102   | 111    | 10       | Completed | 08/17/2022 12:00:00   | 10.00 |
| 100259   | 148    | 35       | Completed | 08/25/2022 12:00:00   | 5.10  |
| 100264   | 148    | 40       | Completed | 08/26/2022 12:00:00   | 4.80  |
| 100305   | 300    | 15       | Completed | 09/05/2022 12:00:00   | 10.00 |
| 100400   | 178    | 32       | Completed | 09/17/2022 12:00:00   | 12.00 |
| 100565   | 265    | 2        | Completed | 09/27/2022 12:00:00   | 8.70  |

#### `users` Table:
| Column Name | Type | Description |
|-------------|------|-------------|
| user_id     | integer | Unique ID of the user |
| city        | string  | City where the user is located |
| email       | string  | User's email address |
| signup_date | datetime | Date and time when the user signed up |

#### Example Input for `users` Table:
| user_id | city          | email                       | signup_date         |
|---------|--------------|-----------------------------|---------------------|
| 111     | San Francisco | rrok10@gmail.com           | 08/03/2021 12:00:00 |
| 148     | Boston        | sailor9820@gmail.com       | 08/20/2021 12:00:00 |
| 178     | San Francisco | harrypotterfan182@gmail.com | 01/05/2022 12:00:00 |
| 265     | Denver        | shadower_@hotmail.com      | 02/26/2022 12:00:00 |
| 300     | San Francisco | houstoncowboy1122@hotmail.com | 06/30/2022 12:00:00 |

### Expected Output:
| city          | total_orders |
|--------------|--------------|
| San Francisco | 3            |
| Boston        | 2            |
| Denver        | 1            |

### Explanation:
- San Francisco has the highest number of completed trade orders with **3** orders.
- Boston holds the second position with **2** orders.
- Denver ranks third with **1** order.
