WITH dates AS (
    SELECT DISTINCT order_date
    FROM {{ref('stg_amazon_orders')}}
)

SELECT
    CAST(order_date AS STRING) AS date_id,
    order_date AS date,
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    EXTRACT(DAY FROM order_date) AS day,
    EXTRACT(WEEK FROM order_date) AS week,
    EXTRACT(QUARTER FROM order_date) AS quarter
FROM dates