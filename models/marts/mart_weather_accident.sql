WITH base AS (
    SELECT *
    FROM {{ ref('fct_accident_weather') }}
),

enriched AS (
    SELECT
        *,
        (temperature_max + temperature_min) / 2 AS temperature_avg,
        CASE
            WHEN precipitation > 0 THEN 'Rain'
            WHEN snowfall > 0 THEN 'Snow'
            ELSE 'No precipitation'
        END AS weather_type
    FROM base
),

joined AS (
    SELECT
        e.*,
        wt.weathercode
    FROM enriched e
    LEFT JOIN {{ ref('dim_weather_type') }} wt
        ON e.weather_type = wt.weather_type
),

kpi AS (
    SELECT
        city_id,
        COUNT(*) AS nb_days,
        AVG(nb_accidents) AS avg_accidents_per_day,
        AVG(CASE WHEN precipitation > 0 THEN 1 ELSE 0 END) AS pct_days_with_rain,
        AVG(temperature_avg) AS avg_temperature,
        AVG(CASE WHEN precipitation > 0 THEN nb_accidents END) AS avg_accidents_rain,
        AVG(CASE WHEN precipitation = 0 THEN nb_accidents END) AS avg_accidents_no_rain
    FROM joined
    GROUP BY city_id
)

SELECT * FROM kpi