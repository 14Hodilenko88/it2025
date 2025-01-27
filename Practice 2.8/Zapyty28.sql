SELECT e.first_name, e.last_name, p.name AS position, p.department
FROM Employee e
JOIN Position p ON e.id_position = p.id_position;
SELECT e.first_name, e.last_name
FROM Employee e
JOIN Employee_Training et ON e.id_employee = et.id_employee
JOIN Training t ON et.id_training = t.id_training
WHERE t.training_name = 'Java Programming';
SELECT first_name, last_name, hire_date
FROM Employee
WHERE hire_date <= CURRENT_DATE - INTERVAL '3 years';
SELECT first_name, last_name
FROM Employee e
JOIN Position p ON e.id_position = p.id_position
WHERE p.department = 'Sales';
SELECT e.first_name, e.last_name
FROM Employee e
LEFT JOIN Employee_Training et ON e.id_employee = et.id_employee
WHERE et.id_training IS NULL;
SELECT e.first_name, e.last_name, COUNT(et.id_training) AS training_count
FROM Employee e
JOIN Employee_Training et ON e.id_employee = et.id_employee
GROUP BY e.id_employee
ORDER BY training_count DESC
LIMIT 1;
SELECT e.first_name, e.last_name
FROM Employee e
JOIN Position p ON e.id_position = p.id_position
WHERE p.name = 'HR Manager';
SELECT e.first_name, e.last_name, t.training_name, t.training_date
FROM Employee e
JOIN Employee_Training et ON e.id_employee = et.id_employee
JOIN Training t ON et.id_training = t.id_training
WHERE t.training_date > '2025-04-01';
