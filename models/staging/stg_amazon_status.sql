SELECT DISTINCT
    OrderStatus AS status_name
FROM {{ source('raw', 'raw_amazon_sales') }}