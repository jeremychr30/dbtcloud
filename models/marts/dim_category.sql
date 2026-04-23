SELECT DISTINCT
    {{dbt_utils.generate_surrogate_key(['category'])}} AS category_id,
    category AS category_name
FROM {{ ref('stg_amazon_products') }}