SELECT p.id_produit,p.nom_produit,c.id_categorie
FROM {{ ref('stg_produits') }} p
JOIN {{ ref('dim_categories') }} c ON p.categorie_produit = c.categorie