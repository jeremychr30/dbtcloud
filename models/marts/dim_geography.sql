SELECT
    {{dbt_utils.generate_surrogate_key(['city', 'state', 'country'])}} AS geo_id,
    city,
    state,
    country
FROM {{ ref('stg_amazon_geography') }}