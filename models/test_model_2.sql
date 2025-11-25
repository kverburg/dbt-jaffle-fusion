{% set types = dbt_utils.get_column_values(
    table=ref('test_model_1'), 
    column='type_name', 
    default=['type_1','type_2']
) %}

with
    events as (
        select *
        from
            {{ ref('test_model_1') }}
    ),

    event_counts as (
        select
            date_field,
            {% for type_name in types -%}
                count(case when type_name = '{{ type_name }}' then event_id end) as {{ type_name }}_count 
            {%- if not loop.last %},
            {% endif -%}
            {% endfor %}
        from
            events
        group by
            date_field
    )

select * from event_counts
