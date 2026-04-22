SELECT id_vente,id_client,id_produit,id_date,id_region,quantite,montant_total AS montant
FROM {{ source('techstore', 'Ventes') }}