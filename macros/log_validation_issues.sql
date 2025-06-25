{% macro log_validation_issues(table_name, column_name, issue_type, issue_desc, record_id) %}
    insert into {{ target.database }}.{{ target.schema }}.data_quality_logs (
        table_name,
        column_name,
        issue_type,
        issue_description,
        record_id,
        logged_at
    )
    values (
        '{{ table_name }}',
        '{{ column_name }}',
        '{{ issue_type }}',
        '{{ issue_desc }}',
        '{{ record_id }}',
        current_timestamp()
    )
{% endmacro %}
