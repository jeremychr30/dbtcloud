SELECT DISTINCT
    City AS city,
    State AS state,
    Country AS country
FROM {{ source('raw', 'raw_amazon_sales') }}