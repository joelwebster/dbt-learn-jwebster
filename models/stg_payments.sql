select
    id as payment_id,
    orderid as order_id,
    amount/100 as payment_amount,
    status

from raw.stripe.payment
where status = 'success'