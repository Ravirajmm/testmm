{% macro init_error_log() %}
    {% set create_table_query %}
        create table if not exists MM_TEST_SF.error_log (
            event_time timestamp,
            model_name text,
            status text,
            error_message text,
            job_id text,
            run_started_at timestamp,
            environment text,
            invocation_id text
            
        )
        {% endset %}
        {% do run_query(create_table_query) %}
        {% endmacro %}
        