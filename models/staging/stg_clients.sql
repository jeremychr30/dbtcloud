SELECT id_client,nom_client AS nom,email_client,segment_client
FROM {{ source('techstore', 'Clients') }}