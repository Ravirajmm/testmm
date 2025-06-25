{% macro log_model_event(event, error_message=None) %}
  {% if execute %}
    {% set model_name = this.identifier if this is not none else 'UNKNOWN_MODEL' %}
    {% set run_by = env_var("DBT_USER", "unknown_user") %}
    
    insert into {{ target.database }}.{{ target.schema }}.dbt_model_logs (
      model_name,
      event,
      run_at,
      run_by,
      error_message
    ) values (
      '{{ model_name }}',
      '{{ event }}',
      current_timestamp,
      '{{ run_by }}',
      {% if error_message is not none %}'{{ error_message }}'{% else %}null{% endif %}
    );
  {% endif %}
{% endmacro %}
