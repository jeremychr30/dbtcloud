SELECT
    customer_id,
    customer_name,
    {{dbt_utils.generate_surrogate_key(['city', 'state', 'country'])}} AS geo_id
FROM {{ref('stg_amazon_customers')}}