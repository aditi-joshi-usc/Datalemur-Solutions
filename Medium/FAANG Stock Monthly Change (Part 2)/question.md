# FAANG Stocks: Inter-Month Performance Analysis

The Bloomberg terminal is the go-to resource for financial professionals, offering convenient access to a wide array of financial datasets. As a Data Analyst at Bloomberg, you have access to historical data on stock performance for the FAANG stocks.

## Problem Overview

You are tasked with analyzing the inter-month change in percentage for each FAANG stock by month over the years. The analysis involves calculating the percentage change in the closing price from one month to the next using the formula:

**Inter-month change in percentage** = ((Current month's closing price - Previous month's closing price) / Previous month's closing price) x 100

For each FAANG stock, you need to display:
- **ticker** (the stock ticker symbol)
- **date** (the last day of the month where the closing price is captured)
- **close** (the closing price for that date)
- **intermth_change_pct** (the inter-month percentage change rounded to two decimal places)

The results should be sorted by ticker symbol and date in chronological order.

---

## Database Schema: `stock_prices`

| Column Name | Data Type | Description                                                                |
|-------------|-----------|----------------------------------------------------------------------------|
| date        | datetime  | The specified date (mm/dd/yyyy) of the stock data.                         |
| ticker      | varchar   | The stock ticker symbol (e.g., AAPL) for the corresponding company.        |
| open        | decimal   | The opening price of the stock at the start of the trading day.            |
| high        | decimal   | The highest price reached by the stock during the trading day.             |
| low         | decimal   | The lowest price reached by the stock during the trading day.              |
| close       | decimal   | The closing price of the stock at the end of the trading day.              |

---

## Example Input

Below is a sample of randomly selected data for AAPL, AMZN, and GOOG:

| date                | ticker | open   | high   | low    | close  |
|---------------------|--------|--------|--------|--------|--------|
| 01/31/2020 00:00:00  | AAPL   | 74.06  | 81.96  | 73.19  | 77.38  |
| 02/29/2020 00:00:00  | AAPL   | 76.07  | 81.81  | 64.09  | 68.34  |
| 03/31/2020 00:00:00  | AAPL   | 70.57  | 76.00  | 53.15  | 63.57  |
| 01/31/2020 00:00:00  | AMZN   | 93.75  | 102.79 | 90.77  | 100.44 |
| 02/29/2020 00:00:00  | AMZN   | 100.53 | 109.30 | 90.56  | 94.19  |
| 03/31/2020 00:00:00  | AMZN   | 95.32  | 99.82  | 81.30  | 97.49  |
| 01/31/2020 00:00:00  | GOOG   | 67.08  | 75.16  | 67.08  | 71.71  |
| 02/29/2020 00:00:00  | GOOG   | 73.10  | 76.61  | 63.55  | 66.97  |
| 03/31/2020 00:00:00  | GOOG   | 67.58  | 70.51  | 50.68  | 58.14  |

---

## Example Output

| ticker | date                | close  | intermth_change_pct |
|--------|---------------------|--------|---------------------|
| AAPL   | 01/31/2020 00:00:00  | 77.38  | NULL                |
| AAPL   | 02/29/2020 00:00:00  | 68.34  | -11.68              |
| AAPL   | 03/31/2020 00:00:00  | 63.57  | -6.98               |
| AMZN   | 01/31/2020 00:00:00  | 100.44 | NULL                |
| AMZN   | 02/29/2020 00:00:00  | 94.19  | -6.22               |
| AMZN   | 03/31/2020 00:00:00  | 97.49  | 3.50                |
| GOOG   | 01/31/2020 00:00:00  | 71.71  | NULL                |
| GOOG   | 02/29/2020 00:00:00  | 66.97  | -6.61               |
| GOOG   | 03/31/2020 00:00:00  | 58.14  | -13.19              |

---

## Additional Analysis Observations

- **AAPL (Apple Inc.)**:  
  Decrease in Feb 2020 (-11.68%) followed by a smaller decrease in Mar 2020 (-6.98%).

- **AMZN (Amazon.com Inc.)**:  
  Decrease in Feb 2020 (-6.22%), but an increase in Mar 2020 (3.50%).

- **GOOG (Alphabet Inc.)**:  
  Similar pattern to AAPL with a drop in Feb 2020 (-6.61%) followed by a further decline in Mar 2020 (-13.19%).

---

## Task Summary

Write an SQL query that accomplishes the following:

1. **Identify the Last Day of Each Month:**  
   For each FAANG stock in the `stock_prices` table, determine the record corresponding to the last day of the month. This will be used as the monthly closing price.

2. **Calculate the Inter-Month Change in Percentage:**  
   For each stock, compute the percentage change using:

   ```
   (Current month's closing price - Previous month's closing price) / Previous month's closing price * 100
   ```
   Round the result to two decimal places. For the first month available for a stock (where no previous month exists), return `NULL` for `intermth_change_pct`.

3. **Output Requirements:**  
- Display the `ticker`, `date`, `close`, and `intermth_change_pct` for each record.
- Ensure the results are sorted by `ticker` (alphabetically) and `date` in chronological order.

---

Good luck writing your query and performing the analysis!
