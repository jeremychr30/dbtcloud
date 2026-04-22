SELECT DISTINCT categorie_produit AS categorie,ROW_NUMBER() OVER() AS id_categorie
FROM {{ ref('stg_produits') }}