With src as (
     select *
     from {{ source('raw','orders')}}
)

select order_id,
       user_id,
       status,
       created_at,
       date(created_at) as order_date,
       num_of_item
from src