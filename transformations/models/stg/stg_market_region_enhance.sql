{{
    config(
        pre_hook = [
            "DROP TABLE IF EXISTS EDW_DEV.STG.STG_MARKET_REGION_ENHANCE;",
            "CALL EDW_DEV.STG.REPLICATE_LIMIT('EDW_DEV.STG.STG_MARKET_REGION', 'EDW_DEV.STG.STG_MARKET_REGION_ENHANCE', 20);"
        ]
    )
}}
-- https://docs.getdbt.com/reference/resource-configs/pre-hook-post-hook
WITH LINEAGE AS (
    SELECT * FROM {{ ref('stg_market_region') }}
)
SELECT *
FROM {{ this }}
