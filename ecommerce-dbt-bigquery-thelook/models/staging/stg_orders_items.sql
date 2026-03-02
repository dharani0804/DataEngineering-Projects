With src as (
     select *
     from {{ source('raw','orders_items')}}
)
select
     id as order_item_id,
     order_id,
     user_id,
     product_id,
     status,
     created_at,
     shipped_at,
     delivered_at,
     returned_at,
     sale_price,
     date(created_at) as order_item_date
from src