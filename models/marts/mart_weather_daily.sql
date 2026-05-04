WITH base AS (
    SELECT *
    FROM {{ ref('fct_accident_weather') }}
)

SELECT
    date_id,
    city_id,
    nb_accidents,
    temperature_max,
    temperature_min,
    (temperature_max + temperature_min) / 2 AS temperature_avg,
    precipitation,
    snowfall,
    windspeed,
    CASE 
        WHEN precipitation > 0 THEN 'Rain'
        WHEN snowfall > 0 THEN 'Snow'
        ELSE 'No precipitation'
    END AS weather_type
FROM base