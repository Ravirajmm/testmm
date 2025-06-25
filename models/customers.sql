{{ log("DB: " ~ target.database ~ " | Schema: " ~ target.schema, info=True) }}

{{ config(
    post_hook = "{{ log_model_event('success') }}"
) }}

SELECT * FROM {{ ref('customers_seed') }}