{{ log("DB: " ~ target.database ~ " | Schema: " ~ target.schema, info=True) }}
SELECT * FROM {{ ref('policies_seed') }}
