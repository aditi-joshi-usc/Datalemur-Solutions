select item_count as mode 
from items_per_order
WHERE order_occurrences = (select MAX(order_occurrences) from items_per_order)
order by mode;








