SELECT DISTINCT
    CustomerID AS customer_id,
    CustomerName AS customer_name,
    City AS city,
    State AS state,
    Country AS country
FROM {{source('raw', 'raw_amazon_sales')}}