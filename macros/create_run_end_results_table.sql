{% macro create_run_end_results_table()%}

{{log('Creating dbt_meta_run_end_results table if not exists',info=True)}}
create table if not exists MM_TEST_SF.dbt_meta_run_end_results (
run_invocation_id text,
model text,
Status text,
message text,
Updated timestamp
)
{% endmacro%}
