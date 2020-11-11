{{
  config(
    materialized='view'
  )
}}


with orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (
    
    select * from {{ ref ('stg_payments') }}

),

order_payments as (
    select
        order_id,
        sum(payment_amount) as payment_amount

    from payments
    group by 1
),

final as (

    select
        orders.order_id,
        orders.customer_id,
        coalesce(order_payments.payment_amount,0) as payment_amount

    from orders

    left join order_payments using (order_id)

)

select * from final
