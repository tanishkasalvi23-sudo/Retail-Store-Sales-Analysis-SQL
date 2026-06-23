CREATE DATABASE quickmart_db;
USE quickmart_db;

-- Table 1: customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    segment VARCHAR(30),
    join_date DATE
);

-- Table 2: categories
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL,
    description VARCHAR(200)
);

-- Table 3: products
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(150) NOT NULL,
    category_id INT,
    unit_price DECIMAL(10,2),
    cost_price DECIMAL(10,2),
    stock_qty INT DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Table 4: orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE NOT NULL,
    city VARCHAR(50),
    status VARCHAR(20) DEFAULT 'Delivered',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Table 5: order_items
CREATE TABLE order_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2),
    discount DECIMAL(4,2) DEFAULT 0.00,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- STEP 3: INSERT DATA INTO categories
INSERT INTO categories (category_name, description) VALUES
('Electronics', 'Gadgets, phones, laptops and accessories'),
('Clothing', 'Men, women and children apparel'),
('Groceries', 'Daily essentials, food and beverages'),
('Furniture', 'Home and office furniture'),
('Sports', 'Sports equipment and outdoor gear');

-- STEP 4: INSERT DATA INTO customers
INSERT INTO customers (name, email, city, segment, join_date) VALUES
('Rahul Sharma', 'rahul@email.com', 'Mumbai', 'VIP', '2022-01-15'),
('Priya Singh', 'priya@email.com', 'Delhi', 'Premium', '2022-03-20'),
('Amit Patel', 'amit@email.com', 'Ahmedabad', 'Regular', '2022-06-10'),
('Sneha Rao', 'sneha@email.com', 'Bangalore', 'Premium', '2022-07-05'),
('Karan Mehta', 'karan@email.com', 'Mumbai', 'VIP', '2022-08-12'),
('Divya Nair', 'divya@email.com', 'Chennai', 'Regular', '2022-09-18'),
('Ravi Kumar', 'ravi@email.com', 'Delhi', 'Premium', '2023-01-22'),
('Anita Joshi', 'anita@email.com', 'Pune', 'Regular', '2023-02-14'),
('Suresh Gupta', 'suresh@email.com', 'Kolkata', 'VIP', '2023-04-30'),
('Meena Pillai', 'meena@email.com', 'Chennai', 'Regular', '2023-06-08');

-- STEP 5: INSERT DATA INTO products
INSERT INTO products (product_name, category_id, unit_price, cost_price, stock_qty) VALUES
('Samsung Galaxy S23', 1, 74999.00, 55000.00, 50),
('Apple MacBook Air M2', 1, 114999.00, 88000.00, 25),
('Sony Wireless Earbuds', 1, 4999.00, 2500.00, 200),
('Cotton Formal Shirt', 2, 999.00, 400.00, 500),
('Denim Jeans Premium', 2, 2499.00, 900.00, 300),
('Basmati Rice 5kg', 3, 450.00, 300.00, 1000),
('Sunflower Oil 2L', 3, 280.00, 180.00, 800),
('Office Chair Ergonomic', 4, 12999.00, 7000.00, 40),
('Wooden Study Table', 4, 18999.00, 11000.00, 20),
('Cricket Bat Kashmir Willow', 5, 2499.00, 1200.00, 100),
('Yoga Mat Premium', 5, 1299.00, 600.00, 150),
('LG 32-inch Monitor', 1, 22999.00, 16000.00, 35);

-- STEP 6: INSERT DATA INTO orders
-- =========================================================
INSERT INTO orders (customer_id, order_date, city, status) VALUES
(1, '2023-01-05', 'Mumbai', 'Delivered'),
(2, '2023-01-18', 'Delhi', 'Delivered'),
(3, '2023-02-10', 'Ahmedabad', 'Delivered'),
(4, '2023-02-25', 'Bangalore', 'Delivered'),
(5, '2023-03-08', 'Mumbai', 'Delivered'),
(1, '2023-03-20', 'Mumbai', 'Delivered'),
(6, '2023-04-14', 'Chennai', 'Delivered'),
(7, '2023-05-02', 'Delhi', 'Delivered'),
(2, '2023-05-19', 'Delhi', 'Returned'),
(8, '2023-06-07', 'Pune', 'Delivered'),
(9, '2023-07-11', 'Kolkata', 'Delivered'),
(10,'2023-08-23', 'Chennai', 'Delivered'),
(3, '2023-09-14', 'Ahmedabad', 'Delivered'),
(5, '2023-10-05', 'Mumbai', 'Delivered'),
(4, '2023-11-18', 'Bangalore', 'Delivered'),
(1, '2023-12-01', 'Mumbai', 'Delivered');

-- STEP 7: INSERT DATA INTO order_items
-- =========================================================
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount) VALUES
(1, 1, 1, 74999.00, 0.05),(1, 3, 2, 4999.00, 0.00),
(2, 4, 3, 999.00, 0.10),(2, 5, 2, 2499.00, 0.05),
(3, 6,10, 450.00, 0.00),(3, 7, 5, 280.00, 0.00),
(4, 8, 1, 12999.00, 0.08),(4, 9, 1, 18999.00, 0.05),
(5, 2, 1,114999.00, 0.03),(5,11, 2, 1299.00, 0.00),
(6, 10, 2, 2499.00, 0.00),(6, 3, 1, 4999.00, 0.10),
(7, 4, 5, 999.00, 0.15),(7, 6,20, 450.00, 0.05),
(8, 12, 1, 22999.00, 0.05),(8, 3, 3, 4999.00, 0.00),
(9, 5, 2, 2499.00, 0.00),(10,1, 1, 74999.00, 0.02),
(11, 9, 1, 18999.00, 0.00),(11,8, 2, 12999.00, 0.10),
(12,11, 3, 1299.00, 0.05),(12,6,15, 450.00, 0.00),
(13, 2, 1,114999.00, 0.08),(13,4, 2, 999.00, 0.00),
(14,10, 1, 2499.00, 0.00),(14,7,10, 280.00, 0.05),
(15, 1, 2, 74999.00, 0.04),(15,3, 4, 4999.00, 0.00),
(16, 2, 1,114999.00, 0.06),(16,5, 3, 2499.00, 0.10);

-- STEP 8: VERIFICATION QUERIES

-- Check whether the database exists
SHOW DATABASES;

-- Use the project database
USE quickmart_db;

-- Check all tables created
SHOW TABLES;

-- Check data counts
SELECT COUNT(*) AS total_customers FROM customers;
SELECT COUNT(*) AS total_categories FROM categories;
SELECT COUNT(*) AS total_products FROM products;
SELECT COUNT(*) AS total_orders FROM orders;
SELECT COUNT(*) AS total_order_items FROM order_items;

-- TASK 1: BASIC SELECT QUERIES

-- Query 4a: View all customers
SELECT * FROM customers;
SELECT name, city FROM customers;

SELECT * FROM orders;
SELECT COUNT(*) FROM order_items;


-- Query 4b: Find all VIP customers
SELECT name, email, city
FROM customers
WHERE segment = 'VIP';

-- Query 4c: Find products priced above 10,000 rupees
SELECT product_name, unit_price, stock_qty
FROM products
WHERE unit_price > 10000
ORDER BY unit_price DESC;

-- TASK 1: GROUP BY QUERIES

-- Query 5a: Count customers per city
SELECT city,
COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;

-- Query 5b: Total revenue per product category
-- Revenue = quantity * unit_price * (1 - discount)
SELECT c.category_name,
COUNT(DISTINCT oi.order_id) AS total_orders,
SUM(oi.quantity * oi.unit_price * (1 - oi.discount)) AS total_revenue,
ROUND(AVG(oi.unit_price), 2) AS avg_price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_revenue DESC;

-- Query 6: Find cities with more than 1 order
SELECT city,
COUNT(*) AS order_count
FROM orders
GROUP BY city
HAVING COUNT(*) > 1
ORDER BY order_count DESC;

-- TASK 2: INNER JOIN

-- Query 1a: Show order details with customer name and product name
SELECT o.order_id,
c.name AS customer_name,
c.city,
o.order_date,
p.product_name,
oi.quantity,
oi.unit_price,
ROUND(oi.quantity * oi.unit_price * (1 - oi.discount), 2) AS line_total
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
ORDER BY o.order_date, o.order_id;

-- TASK 2: LEFT JOIN

-- Query 2a: Find products that have never been ordered
SELECT p.product_name,
p.unit_price,
p.stock_qty,
oi.order_id
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.order_id IS NULL;

-- Query 2b: Find customers who have not placed any order
SELECT c.name, c.email, c.city, c.segment
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- TASK 2: SUBQUERY

-- Query 3a: Find customers who spent more than the average customer spending
SELECT c.name,
c.segment,
ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount)), 2) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.name, c.segment
HAVING total_spent > (
    SELECT AVG(customer_total)
    FROM (
        SELECT SUM(oi2.quantity * oi2.unit_price * (1 - oi2.discount)) AS customer_total
        FROM orders o2
        JOIN order_items oi2 ON o2.order_id = oi2.order_id
        GROUP BY o2.customer_id
    ) AS avg_table
)
ORDER BY total_spent DESC;

-- TASK 2: CASE WHEN
-- Query 4a: Classify products by price range
SELECT product_name,
unit_price,
CASE
    WHEN unit_price < 1000 THEN 'Budget'
    WHEN unit_price < 10000 THEN 'Mid-Range'
    WHEN unit_price < 50000 THEN 'Premium'
    ELSE 'Luxury'
END AS price_category
FROM products
ORDER BY unit_price;

-- Query 4b: Revenue contribution by category as percentage
SELECT c.category_name,
ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount)), 2) AS revenue,
ROUND(
    SUM(oi.quantity * oi.unit_price * (1 - oi.discount)) * 100.0 /
    (SELECT SUM(quantity * unit_price * (1 - discount)) FROM order_items),
    2
) AS pct_of_total
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY revenue DESC;

-- TASK 2: DATE FUNCTIONS
-- Query 5: Monthly sales revenue trend
SELECT YEAR(o.order_date) AS year,
MONTH(o.order_date) AS month_num,
MONTHNAME(o.order_date) AS month_name,
COUNT(DISTINCT o.order_id) AS total_orders,
ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount)), 2) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY YEAR(o.order_date), MONTH(o.order_date), MONTHNAME(o.order_date)
ORDER BY year, month_num;

-- TASK 2: WINDOW FUNCTIONS

-- Query 6a: Rank customers by total spending
SELECT c.name,
c.segment,
c.city,
ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount)), 2) AS total_spent,
RANK() OVER (ORDER BY SUM(oi.quantity * oi.unit_price * (1 - oi.discount)) DESC) AS spending_rank
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.name, c.segment, c.city
ORDER BY spending_rank;

-- Query 6b: Rank products within each category by revenue
SELECT cat.category_name,
p.product_name,
ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount)), 2) AS revenue,
RANK() OVER (
    PARTITION BY cat.category_id
    ORDER BY SUM(oi.quantity * oi.unit_price * (1 - oi.discount)) DESC
) AS rank_in_category
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories cat ON p.category_id = cat.category_id
GROUP BY cat.category_id, cat.category_name, p.product_id, p.product_name
ORDER BY cat.category_name, rank_in_category;













