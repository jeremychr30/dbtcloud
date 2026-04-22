SELECT id_produit,nom_produit,categorie_produit
FROM {{ source('techstore', 'Produits') }}
