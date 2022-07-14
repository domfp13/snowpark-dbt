{{
    config(
        post_hook = [
            "ALTER WAREHOUSE SMALL SUSPEND;"
        ]
    )
}}
WITH EPHEMERAL_ONE AS (
    SELECT * FROM {{ ref('stg_market_ephemeral_one') }}
),
EPHEMERAL_TWO AS (
    SELECT * FROM {{ ref('stg_market_ephemeral_two') }}
)
SELECT *
FROM EPHEMERAL_ONE
UNION ALL
SELECT *
FROM EPHEMERAL_TWO
