
### 1️⃣ Experiment 1.1:
### 👨‍🎓 Student Details

    Name: Chaitanya Sharma
    UID: 25MCD10056
    Branch: MCA (Data Science)
    Section: MCD-1(A)
    Semester: 2nd
    Subject: Technical Training
    Subject Code: 25CAP-652
    Date of Performance: 6 January 2026

### Title:
To design and implement a sample database system using DDL, DML, and DCL commands, 
including database creation, data manipulation, schema modification, and role-based access control to 
ensure data integrity and secure, read-only access for authorized users. 
### Code: 
    CREATE TABLE PROJECT(
	proj_id INT PRIMARY KEY CHECK(proj_id > 0),
	proj_name VARCHAR(30) NOT NULL UNIQUE CHECK(length(proj_name) > 0),
	dept_id INT REFERENCES DEPARTMENT(dept_id)
    );
    INSERT INTO DEPARTMENT (dept_id, dept_name) VALUES
    (1, 'Human Resources'),
    (2, 'Information Technology'),
    (3, 'Finance'),
    (4, 'Marketing');
    INSERT INTO EMPLOYEE (emp_id, emp_name, dept_id) VALUES
    (101, 'Amit Sharma', 2),
    (102, 'Priya Verma', 1),
    (103, 'Rahul Mehta', 2),
    (104, 'Neha Singh', 3),
    (105, 'Karan Patel', 4);
    INSERT INTO PROJECT (proj_id, proj_name, dept_id) VALUES
    (201, 'Payroll Automation', 1),
    (202, 'Library Management System', 2),
    (203, 'Budget Analysis 2025', 3),
    (204, 'Digital Marketing Campaign', 4);
    
    -- UPDATE: 
    UPDATE DEPARTMENT 
    SET dept_name = 'Information Technology'
    WHERE dept_name = 'IT Services';
    UPDATE EMPLOYEE 
    SET dept_id = 2
    WHERE emp_name = 'Rahul Mehta';
    -- DELETE: 
    INSERT INTO EMPLOYEE (emp_id, emp_name, dept_id) VALUES
    (107, 'A. Sharma', 4);
    DELETE FROM EMPLOYEE 
    WHERE emp_id = 107; 
    -- Role/User: 
    CREATE ROLE reporting_role;
    CREATE ROLE report_user
    LOGIN
    PASSWORD 'report123';
    -- User inherits the role:
    GRANT reporting_role TO report_user;
    -- Granting SELECT permissions: 
    GRANT SELECT ON DEPARTMENT, EMPLOYEE, PROJECT TO reporting_role;
    
    -- Explicitly revoking CREATE permission (Not provided by default): 
    REVOKE CREATE ON "Exp1.1" TO reporting_role;
    -- Schema Modification: 
    ALTER TABLE PROJECT 
    RENAME COLUMN "proj_id" TO "project_id";
    DROP TABLE TEST_TABLE;
### Output: 
<img width="503" height="758" alt="image" src="https://github.com/user-attachments/assets/088204fd-2488-4d4f-9490-58bee0539fc3" />
