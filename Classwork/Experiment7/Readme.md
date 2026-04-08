# 👨‍🎓 Student Details

- Name: Chaitanya Sharma
- UID: 25MCD10056
- Branch: MCA (Data Science)
- Section: MCD-1(A)
- Semester: 2nd
- Subject: Technical Training
- Subject Code: 25CAP-652
- Date of Performance: 31-Mar-2026

  # 1️⃣ Experiment 7

## 🎯 Aim of the Practical

- Implementation of Joins in PostgreSQL

## 💻 Tools Used

- PostgreSQL

## 📌 Description

-	This experiment demonstrates the use of various SQL join operations in PostgreSQL to combine and retrieve data from multiple related tables. It covers INNER JOIN, LEFT JOIN, RIGHT JOIN, CROSS JOIN, and multiple joins to handle real-world relational database scenarios involving Students, Courses, Enrollments, and Departments.

## Data:
``` sql 
-- Create Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT
);

-- Create Projects table
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50)
);

-- Create Assignments table (like enrollments)
CREATE TABLE Assignments (
    emp_id INT,
    project_id INT,
    PRIMARY KEY (emp_id, project_id)
); 

-- Create Departments table
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
```

``` sql
-- Employees
INSERT INTO Employees VALUES 
(1, 'Rahul', 101),
(2, 'Priya', 102),
(3, 'Amit', 101),
(4, 'Neha', 103);
```
<img width="435" height="161" alt="image" src="https://github.com/user-attachments/assets/80c05bd8-d3fb-41af-8cc0-f584d9507534" />

``` sql 
-- Projects
INSERT INTO Projects VALUES 
(201, 'ERP System'),
(202, 'AI Chatbot'),
(203, 'Data Analytics');
```
<img width="335" height="158" alt="image" src="https://github.com/user-attachments/assets/e3f019f1-e9de-46b5-b649-b2db6cb9eb9b" />

``` sql
-- Assignments
INSERT INTO Assignments VALUES 
(1, 201),
(1, 202),
(2, 202),
(3, 203);
```
<img width="253" height="158" alt="image" src="https://github.com/user-attachments/assets/b524a29f-723f-4697-b066-835971f975aa" />

``` sql
-- Departments
INSERT INTO Departments VALUES 
(101, 'Engineering'),
(102, 'IT'),
(103, 'Operations');
```
<img width="341" height="136" alt="image" src="https://github.com/user-attachments/assets/5428dc32-d3c9-4012-a05d-2724342db262" />

## Joins: 

``` sql
-- Inner join: 
SELECT e.name AS employee_name, p.project_name
FROM Employees e
INNER JOIN Assignments a 
    ON e.emp_id = a.emp_id
INNER JOIN Projects p 
    ON a.project_id = p.project_id;
```
<img width="389" height="180" alt="image" src="https://github.com/user-attachments/assets/03922d0c-a2e6-4ce9-9ee0-6c23c6801fc6" />

``` sql
-- Left join:
SELECT e.name AS employee_name
FROM Employees e
LEFT JOIN Assignments a 
    ON e.emp_id = a.emp_id
WHERE a.project_id IS NULL;
```
<img width="220" height="118" alt="image" src="https://github.com/user-attachments/assets/5a030e23-5e07-4abc-bd85-88c8e65c8775" />

``` sql 
-- Right join: 
SELECT p.project_name, e.name AS employee_name
FROM Employees e
RIGHT JOIN Assignments a 
    ON e.emp_id = a.emp_id
RIGHT JOIN Projects p 
    ON a.project_id = p.project_id;
```
<img width="387" height="165" alt="image" src="https://github.com/user-attachments/assets/64f9067a-2dc2-438e-a3b5-f64af67bad28" />

``` sql
-- Multiple join: 
SELECT e.name AS employee_name, d.dept_name
FROM Employees e
JOIN Departments d 
    ON e.dept_id = d.dept_id;
```
<img width="396" height="186" alt="image" src="https://github.com/user-attachments/assets/a4ed7ff5-dab9-4cdb-a405-ab733874ce49" />

``` sql
-- Cross join:
SELECT e.name AS employee_name, p.project_name
FROM Employees e
CROSS JOIN Projects p;
``` 
<img width="354" height="393" alt="image" src="https://github.com/user-attachments/assets/3f3d42ca-2ba5-483f-8cb0-152c2f41e0b6" />
