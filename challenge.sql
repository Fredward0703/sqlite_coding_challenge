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
ORDER BY revenue DESC;

--Task 3:
SELECT e.first_name, e.last_name, d.name AS department_name, e.salary, 
    (SELECT AVG(salary) 
    FROM employees 
    WHERE department_id = e.department_id) AS department_average
FROM employees e JOIN departments d on e.department_id = d.id
WHERE e.salary > 
    (SELECT AVG(salary) 
    FROM employees 
    WHERE department_id = e.department_id)
ORDER BY d.name, e.salary DESC;

--Task 4:
SELECT city, 
    SUM(loyalty_level = 'Gold') AS Gold_count,
    SUM(loyalty_level = 'Silver') AS Silver_count,
    SUM(loyalty_level = 'Bronze') AS Bronze_count
FROM customers
GROUP BY city
ORDER BY Gold_count DESC, city;

