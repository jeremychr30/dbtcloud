WITH source AS (
    SELECT * 
    FROM {{ source('openmeteo', 'raw_weather') }}
),

cleaned AS (
    SELECT
        city,
        DATE(date) AS date,
        SAFE_CAST(temperature_2m_max AS FLOAT64) AS temperature_max,
        SAFE_CAST(temperature_2m_min AS FLOAT64) AS temperature_min,
        SAFE_CAST(precipitation_sum AS FLOAT64) AS precipitation,
        SAFE_CAST(snowfall_sum AS FLOAT64) AS snowfall,
        SAFE_CAST(windspeed_10m_max AS FLOAT64) AS windspeed,
        SAFE_CAST(weathercode AS INT64) AS weathercode
    FROM source
)

SELECT * FROM cleaned