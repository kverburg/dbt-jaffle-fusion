with 
    source as (
        select * from {{ ref('test_seed') }}
    )

select * 
from source
where type = 'type1'