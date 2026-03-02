with orders as (
  select
    order_date as date,
    order_id,
    user_id
  from {{ ref('int_orders_enriched') }}
),

sales as (
  select
    order_item_date as date,
    sum(sale_price) as revenue,
    count(*) as units_sold,
    sum(sale_price - cost) as gross_margin
  from {{ ref('int_order_items_enriched') }}
  group by 1
),

order_counts as (
  select
    date,
    count(*) as orders,
    count(distinct user_id) as ordering_users
  from orders
  group by 1
)

select
  oc.date,
  oc.orders,
  oc.ordering_users,
  s.revenue,
  s.units_sold,
  safe_divide(s.revenue, oc.orders) as aov,
  safe_divide(s.units_sold, oc.orders) as avg_items_per_order,
  s.gross_margin,
  safe_divide(s.gross_margin, s.revenue) as gross_margin_pct
from order_counts oc
left join sales s
  on oc.date = s.date