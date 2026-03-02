with o as (
  select * from {{ ref('stg_orders') }}
),
u as (
  select * from {{ ref('stg_orders_users') }}
)

select
  o.order_id,
  o.user_id,
  o.status,
  o.created_at,
  o.order_date,
  o.num_of_item,
  u.gender,
  u.age,
  u.city,
  u.state,
  u.country,
  u.traffic_source,
  u.user_created_at
from o
left join u
  on o.user_id = u.user_id