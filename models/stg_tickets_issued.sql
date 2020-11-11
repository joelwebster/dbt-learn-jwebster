select
    id,
    event_id,
    order_id,
    status,
    voided_at

from {{ source('ticket_tailor','issued_tickets') }}