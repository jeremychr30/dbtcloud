{{ config(materialized='table') }}

SELECT DISTINCT c.id_client, c.nom, c.prenom, dv.annee
FROM {{ source('travelcorp', 'clients') }} c
JOIN {{ source('travelcorp', 'reservationsVoitures') }} rv ON c.id_client = rv.id_client
JOIN {{ source('travelcorp', 'dates') }} dv ON rv.id_date = dv.id_date
JOIN {{ source('travelcorp', 'reservationsHotels') }} rh ON c.id_client = rh.id_client
JOIN {{ source('travelcorp', 'dates') }} dh ON rh.id_date = dh.id_date
JOIN {{ source('travelcorp', 'reservationsVols') }} rvol ON c.id_client = rvol.id_client
JOIN {{ source('travelcorp', 'dates') }} dvol ON rvol.id_date = dvol.id_date
WHERE dv.annee = dh.annee
AND dv.annee = dvol.annee