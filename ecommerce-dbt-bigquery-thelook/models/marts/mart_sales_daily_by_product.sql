select
  order_item_date as date,
  category,
  brand,
  sum(sale_price) as revenue,
  count(*) as units_sold,
  sum(sale_price - cost) as gross_margin,
  safe_divide(sum(sale_price - cost), sum(sale_price)) as gross_margin_pct,
  safe_divide(sum(sale_price), count(*)) as avg_item_price
from {{ ref('int_order_items_enriched') }}
group by 1,2,3