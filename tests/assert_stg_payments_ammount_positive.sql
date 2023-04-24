with payments as (
    select * from {{ ref('stg_payments') }}
)


select order_id, sum(amount)
from payments 
where amount < 0
group by order_id
