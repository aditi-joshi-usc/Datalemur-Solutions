# Bloomberg Terminal: FAANG Stock Price Analysis

## Problem Statement

As a Data Analyst at Bloomberg, you are tasked with analyzing the historical performance of FAANG stocks (Facebook/Meta, Apple, Amazon, Netflix, Google/Alphabet) using data available through the Bloomberg terminal.

Your specific assignment is to identify the highest and lowest opening prices for each FAANG stock by month over the available time period in your dataset.

## Task Requirements

For each FAANG stock, you need to:
1. Identify the month and year with the highest opening price
2. Identify the month and year with the lowest opening price
3. Display these results in a formatted table
4. Sort the results by ticker symbol

## Database Schema

**Table: `stock_prices`**

| Column Name | Type | Description |
|-------------|------|-------------|
| date | datetime | The specified date (mm/dd/yyyy) of the stock data |
| ticker | varchar | The stock ticker symbol (e.g., AAPL) for the corresponding company |
| open | decimal | The opening price of the stock at the start of the trading day |
| high | decimal | The highest price reached by the stock during the trading day |
| low | decimal | The lowest price reached by the stock during the trading day |
| close | decimal | The closing price of the stock at the end of the trading day |

## Example Input Data

Below is a sample of the data for Apple Inc. (AAPL):

| date | ticker | open | high | low | close |
|------|--------|------|------|-----|-------|
| 01/31/2023 00:00:00 | AAPL | 142.28 | 142.70 | 144.34 | 144.29 |
| 02/28/2023 00:00:00 | AAPL | 146.83 | 147.05 | 149.08 | 147.41 |
| 03/31/2023 00:00:00 | AAPL | 161.91 | 162.44 | 165.00 | 164.90 |
| 04/30/2023 00:00:00 | AAPL | 167.88 | 168.49 | 169.85 | 169.68 |
| 05/31/2023 00:00:00 | AAPL | 176.76 | 177.33 | 179.35 | 177.25 |

## Expected Output Format

| ticker | highest_mth | highest_open | lowest_mth | lowest_open |
|--------|-------------|--------------|------------|-------------|
| AAPL | May-2023 | 176.76 | Jan-2023 | 142.28 |

## Explanation

The query results show that Apple Inc. (AAPL) had its highest opening price of $176.76 in May 2023 and its lowest opening price of $142.28 in January 2023.

## Notes
- Your analysis should cover all FAANG stocks: FB (now META), AAPL, AMZN, NFLX, and GOOGL
- You need to format the month and year as 'Mon-YYYY' (e.g., 'Jan-2023')
- The results must be sorted alphabetically by ticker symbol
- You should consider all available historical data in the dataset
