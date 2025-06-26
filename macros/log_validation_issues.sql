{% macro log_validation_issues(model_name, issues_query) %}
  {% set insert_sql %}
    insert into MM_DB_TEST.MM_TEST_SF.data_quality_logs (
        table_name,
        column_name,
        issue_type,
        issue_description,
        record_id,
        logged_at
    )
    select
        '{{ model_name }}',
        column_name,
        issue_type,
        issue_description,
        record_id,
        current_timestamp()
    from (
        {{ issues_query }}
    ) as issues
  {% endset %}

  {{ log("Logging issues for model: " ~ model_name, info=True) }}
  {% do run_query(insert_sql) %}
{% endmacro %}
