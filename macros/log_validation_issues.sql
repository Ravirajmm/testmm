{% macro log_validation_issues(table_name, column_name, issue_type, issue_desc, Customer_Id) %}
    {% set query %}
    insert into {{ target.database }}.{{ target.schema }}.data_quality_logs (
        table_name,
        column_name,
        issue_type,
        issue_description,
        Customer_Id,
        logged_at
    )
    values (
        '{{ table_name }}',
        '{{ column_name }}',
        '{{ issue_type }}',
        '{{ issue_desc }}',
        '{{ Customer_Id }}',
        current_timestamp()
    )
    {% endset %}

    {% do run_query(query) %}
{% endmacro %}
