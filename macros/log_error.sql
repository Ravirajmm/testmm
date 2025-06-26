{% macro log_error(model_Name, status, error_message)%}
{% set sql%}
insert into MM_TEST_SF.error_log (
event_time,
model_Name,
status,
error_message,
run_started_at,
environment,
invocation_id
)
values (
    current_timestamp,
    '{{this.identifier}}',
    '{{status}}',
    '{{error_message | replace ("'","' '")}}',
    '{{run_started_at}}',
    '{{target.name}}',
    '{{invocation_id}}'
    
)
{% endset%}
{% do run_query(sql)%}
{% endmacro%}