SELECT DISTINCT
    city AS city_id,
    city AS city_name
    
FROM {{ref('stg_weather')}}