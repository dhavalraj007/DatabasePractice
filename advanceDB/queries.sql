-- products
SELECT
    product_name,
    list_price,
    category_id
FROM
    production.products
ORDER BY
    product_name DESC;

-- to get categories also
SELECT
    product_name,
    category_name,
    list_price
FROM
    production.products p
INNER JOIN production.categories c 
    ON c.category_id = p.category_id
ORDER BY
    product_name DESC;

-- to get brand name also
SELECT
    product_name,
    category_name,
    brand_name,
    list_price
FROM
    production.products p
INNER JOIN production.categories c ON c.category_id = p.category_id
INNER JOIN production.brands b ON b.brand_id = p.brand_id
ORDER BY
    product_name DESC;


-- get customer details with the ordered product name
SELECT
	first_name,
	last_name,
	product_name,
	p.list_price,
	quantity,
	discount
from
	sales.order_items oi inner join sales.orders ord on ord.order_id = oi.order_id  
	inner join sales.customers c on ord.customer_id = c.customer_id 
	inner join production.products  p on oi.product_id = p.product_id



