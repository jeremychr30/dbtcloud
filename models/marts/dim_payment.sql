SELECT
    {{dbt_utils.generate_surrogate_key(['payment_method'])}} AS payment_id,
    payment_method
FROM {{ref('stg_amazon_payments')}}