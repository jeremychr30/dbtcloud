WITH accidents AS (
    SELECT
        date,
        COUNT(*) AS nb_accidents
    FROM {{ref('stg_accidents')}}
    WHERE dep = '75'
    GROUP BY date
),

weather AS (
    SELECT *
    FROM {{ref('stg_weather')}}
    WHERE city = 'Paris'
)

SELECT
    w.date AS date_id,
    w.city AS city_id,
    w.weathercode,
    w.temperature_max,
    w.temperature_min,
    w.precipitation,
    w.snowfall,
    w.windspeed,
    COALESCE(a.nb_accidents, 0) AS nb_accidents
FROM weather w
LEFT JOIN accidents a ON w.date = a.date