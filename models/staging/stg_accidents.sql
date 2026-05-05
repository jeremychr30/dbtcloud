WITH source AS (
    SELECT * 
    FROM {{source('openmeteo', 'raw_accident')}}
),

cleaned AS (
    SELECT
        SAFE_CAST(Num_Acc AS INT64) AS accident_id,
        DATE(
            SAFE_CAST(an AS INT64),
            SAFE_CAST(mois AS INT64),
            SAFE_CAST(jour AS INT64)
        ) AS date,
        SAFE_CAST(SUBSTR(hrmn, 1, 2) AS INT64) AS hour,
        SAFE_CAST(lat AS FLOAT64) AS lat,
        SAFE_CAST(long AS FLOAT64) AS lon,
        dep,
        com,
        adr
    FROM source
     WHERE Num_Acc IS NOT NULL
      AND an IS NOT NULL
      AND mois IS NOT NULL
      AND jour IS NOT NULL
)

SELECT * FROM cleaned
