-- create table
CREATE TABLE student_registry (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    class_name VARCHAR(30) NOT NULL,
    marks INT CHECK (marks >= 0 AND marks <= 100)
);

-- insert sample records
INSERT INTO student_registry (student_name, class_name, marks) VALUES
('Aarav', 'Class 10A', 45),
('Diya', 'Class 10B', 60),
('Kabir', 'Class 10A', 75),
('Meera', 'Class 10C', 52),
('Rohan', 'Class 10B', 40),
('Ishita', 'Class 10A', 88),
('Dev', 'Class 10C', 67),
('Sneha', 'Class 10B', 91);


--   Example 1
  -- FOR Loop – Simple iteration of school days

DO $$
DECLARE
    day_no INT;
BEGIN
    FOR day_no IN 1..5 LOOP
        RAISE NOTICE 'School day number: %', day_no;
    END LOOP;
END $$;

   --Example 2
 --  Create student table and iterate row-by-row
DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT student_id, student_name FROM student_registry LOOP
        RAISE NOTICE 'Student ID: %, Name: %', rec.student_id, rec.student_name;
    END LOOP;
END $$;


--   Example 3
--   WHILE Loop – Repeated attendance counter
DO $$
DECLARE
    counter INT := 1;
BEGIN
    WHILE counter <= 5 LOOP
        RAISE NOTICE 'Attendance check: %', counter;
        counter := counter + 1;
    END LOOP;
END $$;

   --Example 4
 --  LOOP with EXIT WHEN – Controlled repetition

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
--   Example 5
 --  Increase marks for every student (bonus marks)

DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT student_id FROM student_registry LOOP
        UPDATE student_registry
        SET marks = marks + 5   -- bonus marks
        WHERE student_id = rec.student_id;
    END LOOP;
END $$;

SELECT * FROM student_registry;

--   Example 6
  -- Classify students based on marks

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
