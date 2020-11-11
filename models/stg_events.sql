select
    id as event_id,
    name,
    total_issued_tickets,
    total_orders

from {{ source('ticket_tailor','events') }}