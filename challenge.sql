-- Task 1
-- Used the count feature to get the amount of times a customer had ordered, 
--also used the JOIN function to join the customer and order tables to complete the task
SELECT c.first_name, c.last_name, COUNT(o.customer_id) AS total_spent
FROM customers c JOIN orders o on c.id = o.customer_id
GROUP BY c.id, c.first_name,c.last_name
ORDER BY total_spent DESC
LIMIT 5;
