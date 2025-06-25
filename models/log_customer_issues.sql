{% for row in dbt_utils.get_query_results_as_dict(validate_customer_data('customers')) %}
    {{ log_validation_issues('customers', row['column_name'], row['issue_type'], row['issue_description'], row['record_id']) }}
{% endfor %}
