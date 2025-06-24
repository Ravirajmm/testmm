with row_diff as (
    {{ compare_row_counts('customers', 'policies') }}
)

select * from row_diff
