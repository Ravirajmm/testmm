-- depends_on: {{ ref('customers') }}

{{ config(materialized='table') }}

with issues as (
    {{ validate_customer_data('customers') }}
)

select * from issues
