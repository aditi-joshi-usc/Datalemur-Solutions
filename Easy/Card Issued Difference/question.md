# Monthly Credit Card Issuance Disparity

This query calculates, for each credit card, the difference between the **highest** monthly issuance (peak) and the **lowest** monthly issuance (trough), then orders the results by the largest disparity.

---

## Table Definition

### `monthly_cards_issued`

| Column Name     | Type      | Description                                       |
|-----------------|-----------|---------------------------------------------------|
| `card_name`     | string    | The name of the credit card                       |
| `issued_amount` | integer   | The number of cards issued in a particular month  |
| `issue_month`   | integer   | The month of issuance (1–12)                      |
| `issue_year`    | integer   | The year of issuance                              |

---

## Example Data

| card_name              | issued_amount | issue_month | issue_year |
|------------------------|---------------|------------|-----------|
| Chase Freedom Flex     | 55000         | 1          | 2021      |
| Chase Freedom Flex     | 60000         | 2          | 2021      |
| Chase Freedom Flex     | 65000         | 3          | 2021      |
| Chase Freedom Flex     | 70000         | 4          | 2021      |
| Chase Sapphire Reserve | 170000        | 1          | 2021      |
| Chase Sapphire Reserve | 175000        | 2          | 2021      |
| Chase Sapphire Reserve | 180000        | 3          | 2021      |

---

