
-- depends_on: {{ ref('customers') }}
-- depends_on: {{ ref('customers_seed') }}

{{ config(
    materialized='table'
    
) }}

{{ compare_row_counts('customers_seed', 'customers') }}






