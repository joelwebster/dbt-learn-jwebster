{{
  config(
    materialized='view'
  )
}}

with orders as (
    select * from {{ ref('stg_ticket_orders') }}
),

events as (
    select * from {{ ref('stg_events') }}
),

issued_tickets as (
    select * from {{ ref('stg_tickets_issued') }}
)

-- main query
select
    event_id,
    name as event_name,
    sum(case when issued_tickets.status = 'valid' then 1 else 0 end) as tickets_sold,
    sum(case when issued_tickets.status = 'voided' then 1 else 0 end)  as tickets_refunded

from events

left join issued_tickets using (event_id)
left join orders using (order_id)
group by 1,2
