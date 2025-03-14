
select COUNT(distinct (payer_id , recipient_id) )/2 as unique_relationships
from payments
where 
(recipient_id, payer_id) in (
select payer_id , recipient_id 
from payments
);
