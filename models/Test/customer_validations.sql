-- -- depends_on: {{ ref('customers') }}

-- {{ config(materialized='table') }}

-- with issues as (
--     {{ validate_customer_data('customers') }}
-- )

-- select * from issues

with source_data as (
    select * from {{ ref('customers') }}
),

null_checks as (
    select CUSTOMER_ID as record_id, 'FIRST_NAME' as column_name, 'null_check' as issue_type, 'Name is null' as issue_description
    from source_data
    where FIRST_NAME is null

    union all

    select CUSTOMER_ID, 'PHONE_1', 'format_check', 'Phone number is invalid'
    from source_data
    where not regexp_like(PHONE_1, '^[0-9()\\s-]{10,}$')
)

select * from null_checks

{% do log_validation_issues('customers', 'select * from null_checks') %}

