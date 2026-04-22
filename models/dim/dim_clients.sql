SELECT c.id_client,c.nom,s.id_segment
FROM {{ ref('stg_clients') }} c
JOIN {{ ref('dim_segments') }} s ON c.segment_client = s.segment