SELECT id_agence_voiture,nom_agence,ville,pays
FROM {{source('travelcorp','agences')}}
WHERE id_agence_voiture IS NOT NULL