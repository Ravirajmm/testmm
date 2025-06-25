{{ config(
    materialized='table',
    post_hook="{{log_error(this.identifier,'success','')}}"
) }}

SELECT 'ABC' as NAME