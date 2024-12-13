-- Step 1: Create the employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    attrition VARCHAR(3), -- 'Yes' or 'No'
    age INT,
    years_at_company INT,
    income_level VARCHAR(10) -- 'Low', 'Medium', 'High'
);

-- Step 2: Insert sample data (Replace this with your actual data)
INSERT INTO employees (employee_id, attrition, age, years_at_company, income_level)
VALUES
    (1, 'Yes', 25, 2, 'Low'),
    (2, 'No', 30, 5, 'Medium'),
    (3, 'Yes', 45, 10, 'High'),
    (4, 'No', 35, 7, 'Medium'),
    (5, 'Yes', 28, 3, 'Low'),
    (6, 'No', 50, 15, 'High'),
    (7, 'Yes', 40, 8, 'Medium'),
    (8, 'No', 22, 1, 'Low');

-- Step 3: Calculate the attrition rate
SELECT 
    (COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS attrition_rate
FROM employees;

-- Step 4: Analyze age vs attrition
SELECT 
    age, 
    COUNT(*) AS total_employees, 
    COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employees_who_left
FROM employees
GROUP BY age
ORDER BY age;

-- Step 5: Analyze years at company vs attrition
SELECT 
    years_at_company, 
    COUNT(*) AS total_employees, 
    COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employees_who_left
FROM employees
GROUP BY years_at_company
ORDER BY years_at_company;

-- Step 6: Analyze income level vs attrition
SELECT 
    income_level, 
    COUNT(*) AS total_employees, 
    COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employees_who_left
FROM employees
GROUP BY income_level
ORDER BY income_level;
