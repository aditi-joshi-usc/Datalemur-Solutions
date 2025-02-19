# Google Sensor Measurement Analysis

## Problem Statement
Calculate the sum of odd-numbered and even-numbered measurements separately for each day from a Google sensor dataset. The measurements should be considered odd or even based on their sequential order within each day.

## Definitions
- **Odd-numbered measurements**: Within a day, measurements taken at 1st, 3rd, 5th times
- **Even-numbered measurements**: Within a day, measurements taken at 2nd, 4th, 6th times

## Table Structure

### measurements
| Column Name | Type |
|-------------|------|
| measurement_id | integer |
| measurement_value | decimal |
| measurement_time | datetime |

#### Sample Data
| measurement_id | measurement_value | measurement_time |
|----------------|-------------------|------------------|
| 131233 | 1109.51 | 07/10/2022 09:00:00 |
| 135211 | 1662.74 | 07/10/2022 11:00:00 |
| 523542 | 1246.24 | 07/10/2022 13:15:00 |
| 143562 | 1124.50 | 07/11/2022 15:00:00 |
| 346462 | 1234.14 | 07/11/2022 16:45:00 |

## Expected Output
| measurement_day | odd_sum | even_sum |
|-----------------|---------|----------|
| 07/10/2022 00:00:00 | 2355.75 | 1662.74 |
| 07/11/2022 00:00:00 | 1124.50 | 1234.14 |

## Explanation
**For 07/10/2022:**
- 1st measurement (odd): 1109.51
- 2nd measurement (even): 1662.74
- 3rd measurement (odd): 1246.24
- Odd sum: 1109.51 + 1246.24 = 2355.75
- Even sum: 1662.74

**For 07/11/2022:**
- 1st measurement (odd): 1124.50
- 2nd measurement (even): 1234.14
- Odd sum: 1124.50
- Even sum: 1234.14

## Notes
- The measurement sequence is determined by the chronological order of measurements within each day
- Results should include the measurement day with time set to 00:00:00
- Both odd_sum and even_sum columns must be included for each day

This question was revised on April 15th, 2023.
