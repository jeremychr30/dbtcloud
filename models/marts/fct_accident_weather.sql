{{config(
    materialized='table',
    partition_by={
        "field": "date_id",
        "data_type": "date"
    },
    cluster_by=["city_id", "weathercode"]
)}}

WITH accidents AS (
    SELECT
        date,
        hour,
        COUNT(*) AS nb_accidents
    FROM {{ref('stg_accidents')}}
    WHERE dep = '75'
    GROUP BY date,hour
),

weather AS (
    SELECT *
    FROM {{ref('stg_weather')}}
)
SELECT
    w.date AS date_id,
    c.city_id,
    w.weathercode,
    w.temperature_max,
    w.temperature_min,
    w.precipitation,
    w.snowfall,
    w.windspeed,
    a.hour,
    COALESCE(a.nb_accidents, 0) AS nb_accidents
FROM weather w
LEFT JOIN accidents a ON w.date = a.date
LEFT JOIN {{ref('dim_city')}} c ON w.city = c.city_name