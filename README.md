# SQL_DATA_ANALYSIS
🧩 Task 4: SQL for Data Analysis
🎯 Objective

The goal of this task is to use SQL queries to extract, manipulate, and analyze structured data from a relational database.
By completing this task, you will learn to perform data analysis directly using SQL — including filtering, grouping, joins, subqueries, and optimization techniques.

🛠️ Tools Used

Database System: MySQL / PostgreSQL / SQLite

Database Name: Ecommerce_SQL_Database

Dataset: Ecommerce data (Customers, Products, Orders, Order Items)

Deliverables:

Data_Analysis_Queries.sql – all SQL queries

Ecommerce_SQL_Database.sql – database creation and sample data

/screenshots/ – screenshots of query outputs

📂 Repository Structure
SQL_Data_Analysis/
│
├── Ecommerce_SQL_Database.sql       # Database creation & sample data
├── Data_Analysis_Queries.sql        # Analysis queries
├── screenshots/                     # Output screenshots
│   ├── query1_output.png
│   ├── query2_output.png
│   └── ...
└── README.md                        # Project documentation

🏗️ Database Design
Tables Created:

customers

customer_id, customer_name, email, city, country

products

product_id, product_name, category, price, stock

orders

order_id, customer_id, order_date, total_amount

order_items

order_item_id, order_id, product_id, quantity, subtotal

🧾 Database Creation Queries
CREATE DATABASE Ecommerce_SQL_Database;
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

📊 SQL Analysis Queries
🔹 1. View All Customer Data
SELECT * FROM customers;

🔹 2. Filter & Sort Data
SELECT product_name, category, price
FROM products
WHERE price > 500
ORDER BY price DESC;

🔹 3. Aggregation & Grouping
SELECT category, COUNT(*) AS total_products, AVG(price) AS avg_price
FROM products
GROUP BY category
ORDER BY avg_price DESC;

🔹 4. INNER JOIN Example
SELECT c.customer_name, o.order_id, o.order_date, o.total_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

🔹 5. Subquery Example
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

🔹 6. Create View
CREATE VIEW high_value_customers AS
SELECT c.customer_name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING total_spent > 10000;

🔹 7. Index Optimization
CREATE INDEX idx_customer_id ON orders(customer_id);
CREATE INDEX idx_product_category ON products(category);


🚀 How to Run This Project

Install MySQL / PostgreSQL / SQLite.

Run Ecommerce_SQL_Database.sql to create the database and insert data.

Run queries from Data_Analysis_Queries.sql in your SQL editor.

Capture and save query results as screenshots in the /screenshots folder.

Push all files to your GitHub repository.

🎯 Learning Outcomes

By completing this task, you will learn to:

Use SELECT, WHERE, ORDER BY, GROUP BY effectively.

Perform JOINS (INNER, LEFT, RIGHT).

Write subqueries for advanced analysis.

Use aggregate functions like SUM, AVG, COUNT.

Create and query views.

Optimize queries using indexes.

Present SQL-based data analysis in a professional format.

👨‍💻 Author

Raj Shinde
💼 Data Analytics | SQL | Power BI | Python
