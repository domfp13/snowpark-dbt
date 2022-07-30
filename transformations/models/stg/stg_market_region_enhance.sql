{{
    config(
        pre_hook = [
            "DROP TABLE IF EXISTS {{ this }};",
            "CALL EDW_DEV.STG.REPLICATE_LIMIT('{{ ref('stg_market_region') }}', '{{ this }}', 50);"
        ]
    )
}}
-- https://docs.getdbt.com/reference/resource-configs/pre-hook-post-hook
WITH LINEAGE AS (
    SELECT * FROM {{ ref('stg_market_region') }}
)
SELECT *
FROM {{ this }}
