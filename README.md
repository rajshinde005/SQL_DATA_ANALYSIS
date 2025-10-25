#🧩 Task 4: SQL for Data Analysis
#🎯 Objective

Use SQL queries to extract and analyze data from a database.
This task focuses on applying SQL techniques to manipulate, query, and gain insights from structured data.

#🛠️ Tools Used

Database System: MySQL / PostgreSQL / SQLite

Dataset: Ecommerce_SQL_Database (or any dataset of your choice)

#Deliverables:

.sql file containing all SQL queries

Screenshots of query outputs

#📂 Repository Structure
SQL_Data_Analysis/
│
├── Ecommerce_SQL_Database.sql       # Database creation and sample data
├── Data_Analysis_Queries.sql        # All SQL analysis queries
├── screenshots/                     # Folder containing output screenshots
│   ├── query1_output.png
│   ├── query2_output.png
│   └── ...
└── README.md                        # Project documentation

#🧱 Database Design
Tables Created

customers

customer_id, customer_name, email, city, country

products

product_id, product_name, category, price, stock

orders

order_id, customer_id, order_date, total_amount

order_items

order_item_id, order_id, product_id, quantity, subtotal

#📊 SQL Queries Overview
🔹 1. Basic Data Exploration
SELECT * FROM customers LIMIT 10;

🔹 2. Filtering and Sorting Data
SELECT product_name, category, price
FROM products
WHERE price > 500
ORDER BY price DESC;

🔹 3. Aggregation and Grouping
SELECT category, COUNT(*) AS total_products, AVG(price) AS avg_price
FROM products
GROUP BY category
ORDER BY avg_price DESC;

🔹 4. Using Joins
SELECT c.customer_name, o.order_id, o.order_date, o.total_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

🔹 5. Subqueries
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

🔹 6. Creating Views
CREATE VIEW high_value_customers AS
SELECT c.customer_name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING total_spent > 10000;

🔹 7. Query Optimization (Indexing)
CREATE INDEX idx_customer_id ON orders(customer_id);
CREATE INDEX idx_product_category ON products(category);

#🧠 Learning Outcomes

By completing this task, you will learn to:

Use SELECT, WHERE, ORDER BY, and GROUP BY effectively.

Perform JOIN operations (INNER, LEFT, RIGHT).

Write subqueries for advanced analysis.

Apply aggregate functions (SUM, AVG, COUNT).

Create and query views for analytical purposes.

Optimize query performance using indexes.

#🚀 How to Run This Project

Open your SQL environment (MySQL / PostgreSQL / SQLite).

Run the script Ecommerce_SQL_Database.sql to create the database and load data.

Execute the queries in Data_Analysis_Queries.sql.

Capture and save output screenshots in the /screenshots folder.

Upload all files to your GitHub repository.

#📸 Output Examples

All output screenshots (query results) are stored in the screenshots folder, such as:

query1_output.png

query2_output.png

query3_output.png

#👨‍💻 Author

Raj Shinde
💼 Data Analytics | SQL | Power BI | Python
