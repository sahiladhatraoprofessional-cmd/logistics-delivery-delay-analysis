CREATE DATABASE logistics_project;
USE logistics_project;

CREATE TABLE orders (
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Ship_Date DATE,
    Delivery_Date DATE,
    City VARCHAR(50),
    Region VARCHAR(20),
    Warehouse VARCHAR(10),
    Product_Category VARCHAR(50),
    Shipping_Mode VARCHAR(20),
    Distance_km INT,
    Shipping_Cost DECIMAL(10,2),
    Order_Value DECIMAL(10,2)
);

#Total Orders
SELECT COUNT(*) AS total_orders
FROM orders;

#Average Delivery Time
SELECT AVG(DATEDIFF(Delivery_Date, Ship_Date)) AS avg_delivery_days
FROM orders;

#Region Delay
SELECT 
Region,
AVG(DATEDIFF(Delivery_Date, Ship_Date)) AS avg_delivery_days
FROM orders
GROUP BY Region
ORDER BY avg_delivery_days DESC;

#Warehouse Performance

SELECT 
Warehouse,
AVG(DATEDIFF(Delivery_Date, Ship_Date)) AS avg_delivery_days
FROM orders
GROUP BY Warehouse
ORDER BY avg_delivery_days DESC;

#Shipping Mode Impact

SELECT 
Shipping_Mode,
AVG(DATEDIFF(Delivery_Date, Ship_Date)) AS avg_delivery_days,
AVG(Shipping_Cost) AS avg_shipping_cost
FROM orders
GROUP BY Shipping_Mode;
