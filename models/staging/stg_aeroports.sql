SELECT id_aeroport,nom_aeroport,ville,pays
FROM {{source('travelcorp','aeroports')}}
WHERE id_aeroport IS NOT NULL