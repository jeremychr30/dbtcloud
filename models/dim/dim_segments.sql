SELECT DISTINCT segment_client AS segment,ROW_NUMBER() OVER() AS id_segment
FROM {{ ref('stg_clients') }}