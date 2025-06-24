{% macro log_model_execution(model_name, status) %}
    {% set run_started = run_started_at.isoformat() %}
    {% set run_ended = modules.datetime.datetime.now().isoformat() %} {# Corrected line #}
    {% set user = env_var("DBT_USER", "unknown_user") %}
    {% set env = target.name %}

    insert into MM_DB_TEST.MM_TEST_SF.audit_log (
        model_name,
        run_started_at,
        run_ended_at,
        status,
        executed_by,
        environment
    )
    values (
        '{{ model_name }}',
        TO_TIMESTAMP_NTZ('{{ run_started }}'),
        TO_TIMESTAMP_NTZ('{{ run_ended }}'),
        '{{ status }}',
        '{{ user }}',
        '{{ env }}'
    );
{% endmacro %}