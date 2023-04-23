with payments as (
    select * from {{ ref('stg_payments') }}
),

orders as (
    select * from {{ ref('stg_orders') }}

),

orders_payment as (
    select order_id, sum(case when status = 'success' then amount end) as amount
    from payments
    group by 1
),

final as (
    select orders.customer_id,
        orders.order_id,
        orders.order_date,
        coalesce(orders_payment.amount,0) as amount

    from orders
    left join orders_payment using (order_id)
)

select * from final

