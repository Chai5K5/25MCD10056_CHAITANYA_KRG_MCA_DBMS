# 👨‍🎓 Student Details

- Name: Chaitanya Sharma
- UID: 25MCD10056
- Branch: MCA (Data Science)
- Section: MCD-1(A)
- Semester: 2nd
- Subject: Technical Training
- Subject Code: 25CAP-652
- Date of Performance: 03 Feb. 2026


# 1️⃣ Experiment 4 – Iterative Control Structures in PostgreSQL


## 🎯 Aim of the Practical

- To understand iterative control structures in PostgreSQL  
- To implement FOR, WHILE, and LOOP constructs  
- To execute database logic repeatedly and efficiently  


## 💻 Tools Used

- PostgreSQL  


## 📌 Objectives of the Practical

- To understand why iteration is required in database programming  
- To learn the behavior and purpose of FOR, WHILE, and LOOP statements  
- To observe how repeated data processing is handled in databases  
- To relate loop concepts to real-world batch processing scenarios  
- To strengthen procedural SQL knowledge for enterprise systems  


## 🛠️ Theory

- Real-world database tasks often require repeated execution such as processing records, generating reports, validating entries, and running batch updates  
- Standard SQL is declarative and best suited for single operations  
- Procedural control is required for repeated logic  
- PostgreSQL provides PL/pgSQL to support loops and conditional execution  
- Iteration is commonly used inside stored procedures, functions, and anonymous blocks  
- Organizations use loop-based logic for payroll systems, billing cycles, analytics, and workflow automation  


## 🔁 Types of Loops in PostgreSQL

### ▶ FOR Loop (Range-Based)

- Executes a fixed number of times  
- Useful when iterations are predetermined  
- Commonly used for counters and batch execution  

### ▶ FOR Loop (Query-Based)

- Iterates over rows returned by a query  
- Processes one record at a time  
- Useful for reports, audits, and row-wise calculations  

### ▶ WHILE Loop

- Executes while a condition remains true  
- Suitable for condition-controlled processing  
- Used in retry and validation logic  

### ▶ LOOP with EXIT Condition

- Runs indefinitely until explicitly stopped  
- Provides full control over termination  
- Useful for complex workflows  


# 🛠️ Practical / Experiment Steps

## Example 1 – FOR Loop (Simple Iteration)

- Loop runs a fixed number of times  
- Demonstrates basic iteration behavior  
- Useful for counters and repeated execution  


## Example 2 – FOR Loop with Query (Row-by-Row Processing)

- Processes database records one at a time  
- Each iteration handles a single row  
- Simulates cursor-based processing  
- Used for reporting and verification  


## Example 3 – WHILE Loop (Conditional Iteration)

- Runs until the condition becomes false  
- Condition checked before every iteration  
- Suitable for retry or validation tasks  


## Example 4 – LOOP with EXIT WHEN

- Executes continuously  
- Stops only when exit condition is met  
- Provides flexible control over flow  


## Example 5 – Iterative Record Update

- Records are processed individually  
- Values are updated step-by-step  
- Demonstrates bulk update logic  
- Applicable to payroll or batch processing  


## Example 6 – Loop with Conditional Classification

- Each record is evaluated during iteration  
- Decision logic applied using IF conditions  
- Enables categorization and alerts  
- Useful for grading or classification systems  


# ✅ Conclusion

- Iterative control structures in PostgreSQL were successfully understood  
- Different loop constructs were implemented practically  
- Row-by-row and conditional processing was demonstrated  
- Procedural database programming skills were strengthened  
- Foundations for enterprise-level database applications were established


# 🧪 Practical Implementation Code


## 📘 Step 1 – Create Student Table

The following SQL creates the `student_registry` table to store student details and marks.

```sql
CREATE TABLE student_registry (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    class_name VARCHAR(30) NOT NULL,
    marks INT CHECK (marks >= 0 AND marks <= 100)
);
```


## 📘 Step 2 – Insert Sample Records

Sample student data is inserted to demonstrate loop operations.

```sql
INSERT INTO student_registry (student_name, class_name, marks) VALUES
('Aarav', 'Class 10A', 45),
('Diya', 'Class 10B', 60),
('Kabir', 'Class 10A', 75),
('Meera', 'Class 10C', 52),
('Rohan', 'Class 10B', 40),
('Ishita', 'Class 10A', 88),
('Dev', 'Class 10C', 67),
('Sneha', 'Class 10B', 91);
```


## 🔁 Example 1 – FOR Loop (Simple Iteration)

Demonstrates fixed-count iteration.

```sql
DO $$
DECLARE
    day_no INT;
BEGIN
    FOR day_no IN 1..5 LOOP
        RAISE NOTICE 'School day number: %', day_no;
    END LOOP;
END $$;
```
<img width="315" height="173" alt="Screenshot 2026-02-04 183040" src="https://github.com/user-attachments/assets/61e37eea-da58-4df2-a033-301640ba21a1" />


## 🔁 Example 2 – FOR Loop with Query (Row Processing)

Iterates through table rows one by one.

```sql
DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT student_id, student_name FROM student_registry LOOP
        RAISE NOTICE 'Student ID: %, Name: %', rec.student_id, rec.student_name;
    END LOOP;
END $$;
```

<img width="372" height="245" alt="Screenshot 2026-02-04 183240" src="https://github.com/user-attachments/assets/ca627d66-8c80-418a-a6c2-c9d63c52fd98" />

## 🔁 Example 3 – WHILE Loop (Conditional Iteration)

Executes while a condition remains true.

```sql
DO $$
DECLARE
    counter INT := 1;
BEGIN
    WHILE counter <= 5 LOOP
        RAISE NOTICE 'Attendance check: %', counter;
        counter := counter + 1;
    END LOOP;
END $$;
```

<img width="303" height="171" alt="Screenshot 2026-02-04 183335" src="https://github.com/user-attachments/assets/7bc6f0f9-802e-4ad9-a93e-e9b2a4c617ae" />

## 🔁 Example 4 – LOOP with EXIT WHEN

Demonstrates manual termination of an infinite loop.

```sql
DO $$
DECLARE
    period_no INT := 1;
BEGIN
    LOOP
        RAISE NOTICE 'Class period: %', period_no;
        period_no := period_no + 1;
        EXIT WHEN period_no > 5;
    END LOOP;
END $$;
```
<img width="263" height="159" alt="Screenshot 2026-02-04 183533" src="https://github.com/user-attachments/assets/43d219a2-8f78-4c1b-a8c9-06d7b8aba7af" />


## 🔁 Example 5 – Iterative Marks Update

Adds bonus marks to each student.

```sql
DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT student_id FROM student_registry LOOP
        UPDATE student_registry
        SET marks = marks + 5
        WHERE student_id = rec.student_id;
    END LOOP;
END $$;

SELECT * FROM student_registry;
```

<img width="671" height="320" alt="Screenshot 2026-02-04 183721" src="https://github.com/user-attachments/assets/17cdcdbb-c986-4ff8-a48a-b9812c8f6813" />

## 🔁 Example 6 – Conditional Classification

Classifies students based on marks.

```sql
DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT student_name, marks FROM student_registry LOOP
        IF rec.marks >= 60 THEN
            RAISE NOTICE '% is a High Performer', rec.student_name;
        ELSE
            RAISE NOTICE '% is an Average Performer', rec.student_name;
        END IF;
    END LOOP;
END $$;
```
<img width="394" height="246" alt="Screenshot 2026-02-04 183757" src="https://github.com/user-attachments/assets/6e567898-d555-4ed2-ba94-ae6e66c74937" />

