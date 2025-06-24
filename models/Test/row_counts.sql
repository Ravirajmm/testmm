
-- depends_on: {{ ref('customers') }}
-- depends_on: {{ ref('customers_seed') }}

{{ compare_row_counts('customers_seed', 'customers') }}

select 'Row counts match' as message


