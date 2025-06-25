{% macro log_customer_issues() %}
  {% set insert_query %}
    insert into MM_DB_TEST.MM_TEST_SF.data_quality_logs (
        table_name,
        column_name,
        issue_type,
        issue_description,
        record_id,
        logged_at
    )
    values (
        'customers',
        'PHONE_1',
        'format_check',
        'Phone number is invalid',
        '1234',  -- <-- Try static first
        current_timestamp()
    )
  {% endset %}

  {{ log(insert_query, info=True) }}
  {% do run_query(insert_query) %}
{% endmacro %}
