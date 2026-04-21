SELECT id_client,nom,prenom,email,pays
FROM {{source('travelcorp','clients')}}
WHERE id_client IS NOT NULL