# Visa ApplePay Transaction Analysis

## Problem Statement
Calculate the total transaction volume for each merchant where the transaction was performed via ApplePay. Include merchants with no ApplePay transactions (showing their total as 0). Display results in descending order of transaction volume.

**Note:** Pay attention to possible spelling variations of "ApplePay" in the data.

## Tables

### transactions
| Column Name | Type |
|-------------|------|
| merchant_id | integer |
| transaction_amount | integer |
| payment_method | varchar |

#### Sample Data
| merchant_id | transaction_amount | payment_method |
|-------------|-------------------|----------------|
| 1 | 600 | Contactless Chip |
| 1 | 850 | apple pay |
| 1 | 500 | Apple Pay |
| 2 | 560 | Magstripe |
| 2 | 400 | Samsung Pay |
| 4 | 1200 | apple pay |

## Expected Output
| merchant_id | total_transaction |
|-------------|-------------------|
| 1 | 1350 |
| 4 | 1200 |
| 2 | 0 |

## Explanation
- **Merchant 1**: Has two ApplePay transactions (one listed as "apple pay" and one as "Apple Pay") totaling $1,350
- **Merchant 4**: Has one ApplePay transaction totaling $1,200
- **Merchant 2**: Has no ApplePay transactions, so total is 0

## Challenge Notes
- Must handle case-insensitive matching for "ApplePay" (appears as both "apple pay" and "Apple Pay")
- Must include all merchants in output, even those with zero ApplePay transactions
- Results must be sorted in descending order by total transaction amount
