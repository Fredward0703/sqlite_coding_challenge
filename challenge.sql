-- Task 1:
-- Used the count feature to get the amount of times a customer had ordered, 
--also used the JOIN function to join the customer and order tables to complete the task
SELECT c.first_name, c.last_name, COUNT(o.customer_id) AS total_spent
FROM customers c JOIN orders o on c.id = o.customer_id
GROUP BY c.id, c.first_name,c.last_name
ORDER BY total_spent DESC
LIMIT 5;

--Task 2:
-- same as task 1, joined the products and order items table to give the revenue using the unit price and quantity
SELECT p.category, SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi JOIN products p on oi.product_id = p.id
GROUP BY p.category
ORDER BY revenue DESC