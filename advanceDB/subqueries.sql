-- order details of customers from newyork
select * from sales.orders
where customer_id in (select customer_id from sales.customers where city='New York');



select distinct city from sales.customers order by city;	-- all cities


-- names of all city where order is >10
select c.city, count(o.order_id) as countOrders
from sales.orders o 
inner join sales.customers c on o.customer_id=c.customer_id 
group by city 
having count(o.order_id)>10;

-- order count for each brand
select b.brand_name,count(o.order_id) as countOrders
from (((production.brands b inner join production.products p on b.brand_id=p.brand_id)
	inner join sales.order_items oi on p.product_id = oi.product_id)
	inner join sales.orders o on oi.order_id = o.order_id)
group by b.brand_name;

-- customers with more than 2 orders
select customer_id,first_name,last_name
from sales.customers c
where exists (select count(*) from sales.orders o 
		where customer_id = c.customer_id group by customer_id having count(*) > 2)
order by first_name,last_name;

--products that were ordered with quantity more than 2
select product_name
from production.products
where product_id in (select product_id from sales.order_items where quantity>=2);


-- most ordered brand from each city
select * from sales.orders; 

with subq as ( select c.city,b.brand_name,count(o.order_id) as countOrders
from ( ( ( (production.brands b inner join production.products p on b.brand_id=p.brand_id) 
	inner join sales.order_items oi on p.product_id = oi.product_id)
	inner join sales.orders o on oi.order_id = o.order_id)
	inner join sales.customers c on o.customer_id=c.customer_id)
	group by c.city,b.brand_name)
select a.city,a.brand_name
from subq a inner join (select city,MAX(countOrders) as maxOrder from subq group by city) b
	on  a.city=b.city and a.countOrders = b.maxOrder;

