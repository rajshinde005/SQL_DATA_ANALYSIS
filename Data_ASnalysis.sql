-- Create a new database
CREATE DATABASE Ecommerce_SQL_Database;

-- Use the database (for MySQL)
USE Ecommerce_SQL_Database;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1, 'Raj Shinde', 'raj@example.com', 'Mumbai', 'India'),
(2, 'Aditi Mehta', 'aditi@example.com', 'Delhi', 'India'),
(3, 'John Doe', 'john@example.com', 'New York', 'USA'),
(4, 'Priya Nair', 'priya@example.com', 'Bangalore', 'India'),
(5, 'Michael Smith', 'mike@example.com', 'London', 'UK');

INSERT INTO products VALUES
(101, 'Chocolate Box', 'Food', 500.00, 120),
(102, 'Dark Chocolate', 'Food', 300.00, 200),
(103, 'Chocolate Gift Pack', 'Gift', 1200.00, 50),
(104, 'Chocolate Bar', 'Food', 150.00, 300),
(105, 'Luxury Truffles', 'Gift', 1800.00, 30);

INSERT INTO orders VALUES
(1001, 1, '2025-10-01', 2000.00),
(1002, 2, '2025-10-03', 1500.00),
(1003, 3, '2025-10-05', 800.00),
(1004, 4, '2025-10-07', 2500.00),
(1005, 5, '2025-10-09', 1200.00);

INSERT INTO order_items VALUES
(1, 1001, 101, 2, 1000.00),
(2, 1001, 103, 1, 1000.00),
(3, 1002, 102, 3, 900.00),
(4, 1002, 104, 4, 600.00),
(5, 1003, 101, 1, 500.00),
(6, 1003, 104, 2, 300.00),
(7, 1004, 105, 1, 1800.00),
(8, 1004, 103, 1, 700.00),
(9, 1005, 102, 4, 1200.00);

SHOW TABLES;

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;

SELECT * FROM customers LIMIT 10;
SELECT COUNT(*) FROM orders;

SELECT product_name, price, category
FROM products
WHERE price > 500
ORDER BY price DESC;

SELECT category, COUNT(*) AS total_products, AVG(price) AS avg_price
FROM products
GROUP BY category
ORDER BY avg_price DESC;

SELECT c.customer_name, o.order_id, o.order_date, o.total_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

CREATE VIEW high_value_customers AS
SELECT c.customer_name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING total_spent > 10000;

SELECT * FROM high_value_customers;

CREATE INDEX idx_customer_id ON orders(customer_id);
CREATE INDEX idx_product_category ON products(category);



















