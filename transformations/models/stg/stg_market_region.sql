{{
    config(
        pre_hook = [
            "DROP TABLE IF EXISTS EDW_DEV.STG.STG_MARKET_REGION_LIMIT;"
        ],
        post_hook = [
            "CALL EDW_DEV.STG.REPLICATE_LIMIT('{{ this }}', 'EDW_DEV.STG.STG_MARKET_REGION_LIMIT', 5);"
        ]
    )
}}
-- https://docs.getdbt.com/reference/resource-configs/pre-hook-post-hook
WITH RAWTABLE AS (
    SELECT COUNTRY_MARKET_REGION_ID,
           COUNTRY_ID,
           MARKET_REGION_NAME,
           SYS_UPDATE_TS
    FROM {{ ref('raw_market_region')}}
)
SELECT COUNTRY_MARKET_REGION_ID::INT          AS COUNTRY_MARKET_REGION_ID,
       COUNTRY_ID::INT                        AS COUNTRY_ID,
       TRIM(MARKET_REGION_NAME)::VARCHAR      AS MARKET_REGION_NAME,
       TO_TIMESTAMP(SYS_UPDATE_TS)::TIMESTAMP AS SYS_UPDATE_TS
FROM RAWTABLE
