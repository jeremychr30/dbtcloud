SELECT
    {{dbt_utils.generate_surrogate_key(['status_name'])}} AS status_id,
    status_name
FROM {{ref('stg_amazon_status')}}