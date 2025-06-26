{% macro log_run_end_results(results)%}

{% if execute%}

{% for res in results %}
    {% set tidy_message= res.message.replace("'",'"')%}
    {% set query -%}
        insert into MM_TEST_SF.dbt_meta_run_end_results values (
            '{{invocation_id}}',
            '{{res.node.unique_id}}',
            '{{res.status}}',
            '{{tidy_message}}',
            current_timestamp()

        );
        {%- endset %}
        {%  do run_query(query) %}
        {% endfor %}
        {% endif %}
        {% endmacro %}
        