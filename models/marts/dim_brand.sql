SELECT DISTINCT
    {{dbt_utils.generate_surrogate_key(['brand'])}} AS brand_id,
    brand AS brand_name
FROM {{ref('stg_amazon_products')}}