SELECT v.id_vente,v.id_client,v.id_produit,v.montant,v.id_date
FROM {{ ref('stg_ventes') }} v