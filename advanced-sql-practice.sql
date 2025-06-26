-- Use JOIN statements to combine data from multiple tables
SELECT DISTINCT orders.id, orders.order_date, customers.first_name, customers.last_name, orders.total_amount
FROM customers
INNER JOIN orders ON orders.customer_id = customers.id;
-- Write GROUP BY queries with aggregate functions like SUM and COUNT
SELECT orders.customer_id, COUNT(orders.id), customers.first_name, customers.last_name
FROM orders INNER JOIN customers ON orders.customer_id = customers.id
GROUP BY orders.customer_id;
-- Apply WHERE and HAVING clauses to filter data
SELECT orders.order_date, SUM(total_amount) AS total_spent
FROM orders
GROUP BY orders.order_date
HAVING SUM(total_amount) > 200;
SELECT orders.order_date, customers.first_name, customers.last_name, customers.id
FROM orders INNER JOIN customers ON orders.customer_id = customers.id
WHERE customers.last_name = "Doe";
-- Practice using SubQueries to create dynamic filters
SELECT id, order_date, total_amount
FROM orders
WHERE total_amount <= (SELECT AVG(total_amount) FROM orders);
SELECT id, order_date, total_amount, customer_id
FROM orders
WHERE customer_id IN (SELECT id FROM customers WHERE last_name = 'Smith');