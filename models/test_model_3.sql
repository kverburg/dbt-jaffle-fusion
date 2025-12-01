{%- set event_names = dbt_utils.get_column_values(
    table=ref('test_model_1'),
    column='type_name',
    default=['A', 'B', 'C']
) -%}

select {{ event_names }} as location_names