SELECT
    OrderID AS order_id,
    OrderDate AS order_date,
    CustomerID AS customer_id,
    ProductID AS product_id,
    SellerID AS seller_id,
    PaymentMethod AS payment_method,
    OrderStatus AS order_status,
    Quantity AS quantity,
    UnitPrice AS unit_price,
    Discount AS discount,
    Tax AS tax,
    ShippingCost AS shipping_cost,
    TotalAmount AS total_amount
FROM {{source('raw', 'raw_amazon_sales')}}