
show tables;

set SQL_safe_updates = 0;	

-- updated all customer email address from example.com to gmail.com
UPDATE Customers 
SET 
    Customer_Email = REPLACE(Customer_Email,
        'example.com',
        'gmail.com')	
WHERE
    Customer_Email LIKE '%example.com';

-- Update order_status for those orders which are delivered
UPDATE orders 
SET 
    order_status = 'Delivered'
WHERE
    orderId IN (SELECT 
            orderId
        FROM
            Deliveries
        WHERE
            Delivery_status = 'Delivered');

-- Top performing cuisine  

SELECT 
    Cuisine, SUM(Quantity) AS Qty
FROM
    Restaurants r
        LEFT JOIN
    Orders_item ot ON r.RestaurantId = ot.RestaurantId
GROUP BY Cuisine
ORDER BY Qty DESC;

-- Total sales or revenue over a period.
SELECT 
    SUM(Quantity) AS sales,
    SUM(ROUND(price * Quantity, 2)) AS Revenue
FROM
    orders o
        LEFT JOIN
    Orders_item ot ON o.OrderId = ot.OrderId
WHERE
    order_date BETWEEN '2024-10-01' AND '2024-11-01';

-- Top-performing products
desc Menu_Items;
SELECT 
    ItemName, SUM(Quantity) AS Qty
FROM
    Menu_Items mi
        LEFT JOIN
    Orders_item ot ON mi.RestaurantId = ot.RestaurantId
GROUP BY ItemName
ORDER BY Qty DESC;

-- Average transaction value

SELECT 
    ROUND(AVG(amount), 2) AS Average_trunsaction_Value
FROM
    payments;

-- Frequency of customer orders.
desc orders;
SELECT 
    CustomerId, COUNT(OrderId) AS Frequency
FROM
    orders
GROUP BY CustomerId
ORDER BY Frequency DESC;

-- Restaurant contributing the most to sales.

SELECT 
    r.RestaurantName, ROUND(SUM(total_amount), 2) AS sales
FROM
    Restaurants r
        LEFT JOIN
    Orders o ON r.RestaurantId = o.RestaurantId
GROUP BY r.RestaurantName
ORDER BY sales DESC
LIMIT 5;

-- Number of orders yet to deliver

SELECT 
    COUNT(DISTINCT orderId) AS Pending_orders
FROM
    Deliveries
WHERE
    Delivery_status NOT IN ('Delivered');
    
-- Delivary time difference between estimated_delivery_time and actual_delivery_time

SELECT 
    orderId,
    MAX(TIMEDIFF(TIME(actual_delivery_time),
            TIME(estimated_delivery_time))) AS time_diff
FROM
    Deliveries
WHERE
    actual_delivery_time IS NOT NULL
GROUP BY OrderId
ORDER BY time_diff DESC;

-- Find the customers from mumbai and their order details Customername, restaurant, address, order amount
SELECT 
    customerName,
    Customer_address,
    RestaurantName,
    Restaurant_address,
    total_amount
FROM
    Customers c
        LEFT JOIN
    orders o ON c.CustomerId = o.CustomerId
        LEFT JOIN
    Restaurants R ON o.RestaurantId = r.RestaurantId
WHERE
    Customer_address LIKE '%Mumbai%';

-- total sales
SELECT 
    ROUND(SUM(total_amount)) AS total_sales
FROM
    orders;
-- Top performing Restaurant

SELECT 
    RestaurantName,
    Restaurant_address,
    ROUND(SUM(o.total_amount * Quantity)) AS total_revenue,
    rank() over (order by SUM(o.total_amount * Quantity) desc) as Revenue_Rank
FROM
    Restaurants r
        LEFT JOIN
    orders o ON r.RestaurantId = o.RestaurantId
        LEFT JOIN
    Orders_item ot ON o.orderid = ot.orderid
GROUP BY RestaurantName , Restaurant_address
ORDER BY total_revenue DESC
LIMIT 5;

-- Customers who have not made any purchases

SELECT 
    CustomerId, CustomerName
FROM
    customers
WHERE
    CustomerId NOT IN (SELECT DISTINCT
            customerId
        FROM
            orders);

-- Top 5 customers

SELECT 
    CustomerName,
    Customer_address,
    ROUND(SUM(o.total_amount * Quantity)) AS total_revenue,
    rank() over (order by SUM(o.total_amount * Quantity) desc) as Revenue_Rank
FROM
    Customers c
        LEFT JOIN
    orders o ON c.CustomerId = o.CustomerId
        LEFT JOIN
    Orders_item ot ON o.orderid = ot.orderid
GROUP BY CustomerName , Customer_address
ORDER BY total_revenue DESC
LIMIT 5;

-- Customer order summery

Create view customer_order_summary as(SELECT 
    c.CustomerName,
    c.Customer_phone,
    c.Customer_Email,
    c.Customer_address,
    o.order_date,
    r.RestaurantName,
    GROUP_CONCAT(m.ItemName) as orders,
    SUM(ot.Quantity) as Qty,
    ROUND(SUM(ot.price * ot.Quantity)) AS Ordervalue,
    o.Order_status
FROM
    Customers C
        INNER JOIN
    Orders o ON c.CustomerId = o.CustomerId
        LEFT JOIN
    Restaurants r ON o.RestaurantId = r.RestaurantId
        INNER JOIN
    Menu_Items M ON r.RestaurantId = m.RestaurantId
        INNER JOIN
    orders_item ot ON o.OrderId = ot.OrderId
GROUP BY c.CustomerName , c.Customer_phone , c.Customer_Email , c.Customer_address , o.order_date , r.RestaurantName,o.Order_status);

-- Max order value of each customer

select CustomerName,Max(Ordervalue) from customer_order_summary group by CustomerName;

-- resturant overview
create view resturant_system as (Select r.RestaurantName,r.Cuisine,group_concat(m.ItemName) as menu_items,sum(m.Price) as Price,
r.Restaurant_address, round(sum(ot.price),2) as total_amount,count(c.Customerid) as cutomer_foot_fall,round(avg(rating),1) as rating
from Restaurants r 
left join
menu_items m
on r.RestaurantId = m.RestaurantId
left join
orders o
on r.RestaurantId = o.RestaurantId
left join
customers c
on o.Customerid = c.Customerid
left join
orders_item ot
on o.OrderId = ot.OrderId
group by r.RestaurantName,r.Cuisine, r.Restaurant_address);

select * from resturant_system;
