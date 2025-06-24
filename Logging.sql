{% macro log_model_execution(model_name, status) %}
    {% set run_started = run_started_at | string %}
    {% set run_ended = run_ended_at | string %}
    {% set user = env_var("DBT_USER", "unknown_user") %}
    {% set env = target.name %}

    insert into analytics.audit_log (
        model_name,
        run_started_at,
        run_ended_at,
        status,
        executed_by,
        environment
    )
    values (
        '{{ model_name }}',
        '{{ run_started }}',
        '{{ run_ended }}',
        '{{ status }}',
        '{{ user }}',
        '{{ env }}'
    )
{% endmacro %}