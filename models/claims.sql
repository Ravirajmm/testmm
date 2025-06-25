{{ log("DB: " ~ target.database ~ " | Schema: " ~ target.schema, info=True) }}
SELECT * FROM {{ ref('claims_seed') }}
