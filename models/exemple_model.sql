SELECT DISTINCT c.id_client, c.nom, c.prenom, dv.annee
FROM `luxevoyages-493908.TravelCorp.clients` c
JOIN `luxevoyages-493908.TravelCorp.reservationsVoitures` rv ON c.id_client = rv.id_client
JOIN `luxevoyages-493908.TravelCorp.dates` dv ON rv.id_date = dv.id_date
JOIN `luxevoyages-493908.TravelCorp.reservationsHotels` rh ON c.id_client = rh.id_client
JOIN `luxevoyages-493908.TravelCorp.dates` dh ON rh.id_date = dh.id_date
JOIN `luxevoyages-493908.TravelCorp.reservationsVols` rvol ON c.id_client = rvol.id_client
JOIN `luxevoyages-493908.TravelCorp.dates` dvol ON rvol.id_date = dvol.id_date
WHERE dv.annee = dh.annee
AND dv.annee = dvol.annee