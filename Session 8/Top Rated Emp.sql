WITH ranked_employees AS (
    SELECT 
        employee_id,
        employee_name,
        AVG(customer_satisfaction) AS avg_satisfaction,
        DENSE_RANK() OVER (ORDER BY AVG(customer_satisfaction) DESC) AS rnk
    FROM amazon_support_tickets
    WHERE resolution_status = 'Resolved'
    GROUP BY employee_id, employee_name
)
SELECT 
    employee_id,
    employee_name,
    avg_satisfaction,
    rnk AS employee_rank
FROM ranked_employees
WHERE rnk <= 3;
