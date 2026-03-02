with oi as (
  select * from {{ ref('stg_orders_items') }}
),
p as (
  select * from {{ ref('stg_orders_products') }}
)

select
  oi.order_item_id,
  oi.order_id,
  oi.user_id,
  oi.product_id,
  oi.status,
  oi.created_at,
  oi.order_item_date,
  oi.sale_price,
  p.name,
  p.category,
  p.brand,
  p.department,
  p.retail_price,
  p.cost
from oi
left join p
  on oi.product_id = p.product_id