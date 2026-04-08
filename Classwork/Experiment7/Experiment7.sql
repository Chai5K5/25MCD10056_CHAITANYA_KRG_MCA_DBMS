CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT
);

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50)
);

CREATE TABLE Assignments (
    emp_id INT,
    project_id INT,
    PRIMARY KEY (emp_id, project_id)
);

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Employees
INSERT INTO Employees VALUES 
(1, 'Rahul', 101),
(2, 'Priya', 102),
(3, 'Amit', 101),
(4, 'Neha', 103);

-- Projects
INSERT INTO Projects VALUES 
(201, 'ERP System'),
(202, 'AI Chatbot'),
(203, 'Data Analytics');

-- Assignments
INSERT INTO Assignments VALUES 
(1, 201),
(1, 202),
(2, 202),
(3, 203);

-- Departments
INSERT INTO Departments VALUES 
(101, 'Engineering'),
(102, 'IT'),
(103, 'Operations');

-- INNER JOIN: 
SELECT e.name AS employee_name, p.project_name
FROM Employees e
INNER JOIN Assignments a 
    ON e.emp_id = a.emp_id
INNER JOIN Projects p 
    ON a.project_id = p.project_id;

-- Left join:
SELECT e.name AS employee_name
FROM Employees e
LEFT JOIN Assignments a 
    ON e.emp_id = a.emp_id
WHERE a.project_id IS NULL;

-- Right join: 
SELECT p.project_name, e.name AS employee_name
FROM Employees e
RIGHT JOIN Assignments a 
    ON e.emp_id = a.emp_id
RIGHT JOIN Projects p 
    ON a.project_id = p.project_id;

-- Multiple join: 
SELECT e.name AS employee_name, d.dept_name
FROM Employees e
JOIN Departments d 
    ON e.dept_id = d.dept_id;

-- Cross join:
SELECT e.name AS employee_name, p.project_name
FROM Employees e
CROSS JOIN Projects p;
