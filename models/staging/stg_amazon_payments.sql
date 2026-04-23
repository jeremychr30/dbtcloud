SELECT DISTINCT PaymentMethod AS payment_method
FROM {{ source('raw', 'raw_amazon_sales') }}