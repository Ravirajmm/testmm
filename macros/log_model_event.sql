{% macro log_model_event(event, error_message=None) %}
  {% set model_name = this.name %}
  {% set run_by = env_var('DBT_USER', env_var('USER', 'unknown_user')) %}

  insert into mm_db_test.mm_test_sf.dbt_model_logs (
    model_name,
    event,
    run_at,
    run_by,
    error_message
  ) values (
    '{{ model_name }}',
    '{{ event }}',
    current_timestamp(),
    '{{ run_by }}',
    {% if error_message %}'{{ error_message }}'{% else %}null{% endif %}
  );
{% endmacro %}
