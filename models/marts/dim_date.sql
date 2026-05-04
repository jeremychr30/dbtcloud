WITH dates AS (
    SELECT DISTINCT date
    FROM {{ ref('stg_weather') }}
)

SELECT
    date AS date_id,
    EXTRACT(YEAR FROM date) AS year,
    EXTRACT(MONTH FROM date) AS month,
    EXTRACT(DAY FROM date) AS day,
    EXTRACT(DAYOFWEEK FROM date) AS day_of_week,
    FORMAT_DATE('%A', date) AS day_name,
    FORMAT_DATE('%B', date) AS month_name

FROM dates