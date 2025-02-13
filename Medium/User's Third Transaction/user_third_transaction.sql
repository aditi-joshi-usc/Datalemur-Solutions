WITH ranked_transac AS
(
    SELECT 
        user_id, spend, transaction_date,
    RANK() OVER(
        PARTITION BY 
            user_id 
        ORDER BY 
            transaction_date
    ) AS rank
FROM 
    transactions
)

SELECT 
    user_id, spend, transaction_date
FROM 
    ranked_transac
WHERE 
    rank = 3;
