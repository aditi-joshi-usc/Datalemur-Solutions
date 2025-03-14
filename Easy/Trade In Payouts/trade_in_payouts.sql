

select a.store_id, sum(b.payout_amount) as payout_total

from trade_in_transactions as a 
left join trade_in_payouts as b
on a.model_id = b.model_id

group by a.store_id

order by payout_total desc;
