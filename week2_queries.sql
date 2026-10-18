

CREATE TABLE orders (
    order_id INT,
    customer_name VARCHAR(100),
    product VARCHAR(100),
    quantity INT,
    price DECIMAL(10, 2)
);

INSERT INTO orders VALUES
(1, 'Aisha', 'Face Wash', 2, 200),
(2, 'Rahul', 'Moisturizer', 1, 350),
(3, 'Aisha', 'Sunscreen', 3, 400),
(4, 'Priya', 'Face Wash', 1, 200),
(5, 'Rahul', 'Sunscreen', 2, 400);


CREATE TABLE customers (
    customer_name VARCHAR(100),
    city VARCHAR(100)
);

INSERT INTO customers VALUES
('Aisha', 'Delhi'),
('Rahul', 'Mumbai'),
('Priya', 'Chandigarh');




SELECT *
FROM orders;


-- 2. Filter orders placed by Aisha
SELECT *
FROM orders
WHERE customer_name LIKE 'Aisha';


-- 3. Sort orders by price from highest to lowest
SELECT *
FROM orders
ORDER BY price DESC;


-- 4. Calculate total revenue
SELECT SUM(quantity * price) AS total_revenue
FROM orders;


-- 5. Calculate revenue by product
SELECT
    CAST(product AS VARCHAR(100)) AS product_name,
    SUM(quantity * price) AS total_revenue
FROM orders
GROUP BY CAST(product AS VARCHAR(100));


-- 6. Find top customers by revenue
SELECT
    CAST(customer_name AS VARCHAR(100)) AS customer,
    SUM(quantity * price) AS total_revenue
FROM orders
GROUP BY CAST(customer_name AS VARCHAR(100))
ORDER BY total_revenue DESC;


-- 7. Calculate average order value
SELECT AVG(quantity * price) AS average_order_value
FROM orders;


-- 8. Count total orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- 9. Classify orders using CASE
SELECT
    order_id,
    CAST(customer_name AS VARCHAR(100)) AS customer,
    quantity * price AS revenue,
    CASE
        WHEN quantity * price >= 800 THEN 'High Value'
        ELSE 'Regular'
    END AS order_category
FROM orders;


-- 10. Find customers with revenue of at least 1000
SELECT
    CAST(customer_name AS VARCHAR(100)) AS customer,
    SUM(quantity * price) AS total_revenue
FROM orders
GROUP BY CAST(customer_name AS VARCHAR(100))
HAVING SUM(quantity * price) >= 1000;


-- 11. Combine orders and customer details using INNER JOIN
SELECT
    o.order_id,
    CAST(o.customer_name AS VARCHAR(100)) AS customer,
    o.product,
    o.price,
    c.city
FROM orders AS o
INNER JOIN customers AS c
    ON CAST(o.customer_name AS VARCHAR(100)) = c.customer_name;


-- 12. Combine customer and order details using LEFT JOIN
SELECT
    c.customer_name,
    c.city,
    CAST(o.product AS VARCHAR(100)) AS product,
    o.quantity,
    o.price
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_name = CAST(o.customer_name AS VARCHAR(100));
    
/*
PROJECT: Customer Orders and Revenue Analysis
WEEK: 2 - SQL for Data Analysis

OBJECTIVES:
1. Retrieve and filter order data.
2. Sort orders by price.
3. Calculate total revenue and average order value.
4. Analyse revenue by product and customer.
5. Classify orders using CASE.
6. Combine customer and order data using INNER JOIN and LEFT JOIN.

KEY FINDINGS:
- Total revenue: 2950
- Average order value: 590
- Total orders: 5
- Highest revenue product: Sunscreen (2000)
- Top customer: Aisha (1600)



