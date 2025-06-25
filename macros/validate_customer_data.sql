{% macro validate_customer_data(model_name) %}
    {% set results = [] %}

    with source_data as (
        select * from {{ ref(model_name) }}
    ),

    null_checks as (
        select id as record_id, 'customer_name' as column_name, 'null_check' as issue_type, 'Name is null' as issue_description
        from source_data
        where customer_name is null

        union all

        select id, 'phone_number', 'format_check', 'Phone number is invalid'
        from source_data
        where not regexp_like(phone_number, '^[0-9]{10}$')
    )

    select * from null_checks
{% endmacro %}
