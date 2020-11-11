select
    id as payment_id,
    orderid as order_id,
    amount/100 as payment_amount,
    paymentmethod as payment_method,
    status

from {{ source('stripe','payment') }}
where status = 'success'