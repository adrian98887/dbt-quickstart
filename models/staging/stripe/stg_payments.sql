select id as payment_id, 
    orderid as order_id, 
    paymentmethod as payment_method, 
    status, amount / 100 as amount, 
c   reated as created_as

from raw.stripe.payment