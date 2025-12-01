with 
    source as (
        select * from {{ ref('test_seed') }}
    ),

    renamed as(
        select 
            id as event_id,
            date as date_field,
            type as type_name
        from source
    )

select * from renamed