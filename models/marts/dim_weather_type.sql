SELECT DISTINCT
    weathercode,
    CASE
        WHEN weathercode BETWEEN 0 AND 3 THEN 'Clear/Cloudy'
        WHEN weathercode BETWEEN 45 AND 48 THEN 'Fog'
        WHEN weathercode BETWEEN 51 AND 67 THEN 'Rain'
        WHEN weathercode BETWEEN 71 AND 77 THEN 'Snow'
        WHEN weathercode >= 80 THEN 'Heavy Rain'
        ELSE 'Other'
    END AS weather_type

FROM {{ ref('stg_weather') }}