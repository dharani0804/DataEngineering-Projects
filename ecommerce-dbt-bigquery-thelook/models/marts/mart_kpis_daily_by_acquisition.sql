with orders as (
  select
    order_date as date,
    country,
    traffic_source,
    order_id,
    user_id
  from {{ ref('int_orders_enriched') }}
),

sales as (
  select
    order_item_date as date,
    user_id,
    sum(sale_price) as user_revenue
  from {{ ref('int_order_items_enriched') }}
  group by 1,2
),

agg as (
  select
    o.date,
    o.country,
    o.traffic_source,
    count(distinct o.order_id) as orders,
    count(distinct o.user_id) as ordering_users
  from orders o
  group by 1,2,3
),

rev as (
  select
    o.date,
    o.country,
    o.traffic_source,
    sum(s.user_revenue) as revenue
  from orders o
  left join sales s
    on o.date = s.date
   and o.user_id = s.user_id
  group by 1,2,3
)

select
  a.date,
  a.country,
  a.traffic_source,
  a.orders,
  a.ordering_users,
  r.revenue,
  safe_divide(r.revenue, a.orders) as aov
from agg a
left join rev r
  on a.date = r.date
 and a.country = r.country
 and a.traffic_source = r.traffic_source