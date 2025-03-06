WITH cte AS(

  SELECT 
    card_name, issued_amount, DENSE_RANK() OVER(PARTITION BY card_name ORDER BY issue_year, issue_month) AS rankid
    
  FROM monthly_cards_issued
)

SELECT card_name, issued_amount
FROM cte 
WHERE rankid = 1
ORDER BY issued_amount DESC;
