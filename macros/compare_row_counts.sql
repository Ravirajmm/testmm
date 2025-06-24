{% macro compare_row_counts(model_a, model_b) %}
    SELECT
        '{{ model_a }}' AS model_a,
        '{{ model_b }}' AS model_b,
        (SELECT COUNT(*) FROM {{ ref(model_a) }}) AS count_a,
        (SELECT COUNT(*) FROM {{ ref(model_b) }}) AS count_b
{% endmacro %}
