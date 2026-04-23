SELECT
    product_id,
    product_name,
    {{dbt_utils.generate_surrogate_key(['category'])}} AS category_id,
    {{dbt_utils.generate_surrogate_key(['brand'])}} AS brand_id
FROM {{ref('stg_amazon_products')}}