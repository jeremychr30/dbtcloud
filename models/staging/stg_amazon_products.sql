SELECT DISTINCT
    ProductID AS product_id,
    ProductName AS product_name,
    Category AS category,
    Brand AS brand
FROM {{ source('raw', 'raw_amazon_sales') }}