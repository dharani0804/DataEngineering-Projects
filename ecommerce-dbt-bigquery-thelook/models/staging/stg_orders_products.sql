With src as (
     select *
     from {{ source('raw','products')}}
)

select 
     id as product_id,
     category,
     brand,
     name,
     cost,
     retail_price,
     department
from src