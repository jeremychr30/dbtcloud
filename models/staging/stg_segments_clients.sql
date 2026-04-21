SELECT id_hotel,nom_hotel,ville,pays
FROM {{source('travelcorp','hotels')}}
WHERE id_hotel IS NOT NULL