--{% for row in dbt_utils.get_query_results_as_dict(validate_customer_data('customers')) %}
  --  {{ log_validation_issues('customers', row['column_name'], row['issue_type'], row['issue_description'], row['record_id']) }}
--{% endfor %}

-- {% set results = dbt_utils.get_query_results_as_dict(validate_customer_data('customers')) %}

-- {% for row in results %}
--     {% do log_validation_issues('customers', row['column_name'], row['issue_type'], row['issue_description'], row['record_id']) %}
-- {% endfor %}
-- {% set results = dbt_utils.get_query_results_as_dict(validate_customer_data('customers')) %}

-- {% for row in results %}
--     {% do log_validation_issues('customers', row['column_name'], row['issue_type'], row['issue_description'], row['record_id']) %}
-- {% endfor %}



-- macros/log_customer_issues.sql

{% macro log_customer_issues() %}
    {% set results = dbt_utils.get_query_results_as_dict("{{ validate_customer_data('customers') }}") %}

    {% for row in results %}
        {{ log_validation_issues(
            'customers',
            row['column_name'],
            row['issue_type'],
            row['issue_description'],
            row['record_id']
        ) }}
    {% endfor %}
{% endmacro %}


