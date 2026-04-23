SELECT DISTINCT
    SellerID AS seller_id
FROM {{source('raw', 'raw_amazon_sales')}}