With src as (
     select *
     from {{ source('raw','events')}}
)

select
      id as event_id,
      event_type,
      user_id,
      session_id,
      created_at,
      traffic_source
from src
