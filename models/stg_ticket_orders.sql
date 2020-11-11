select
    id as order_id,
    status,
    refund_amount

from {{ source('ticket_tailor','orders') }}