
### 👨‍🎓 Student Details

    Name: Chaitanya Sharma
    UID: 25MCD10056
    Branch: MCA (Data Science)
    Section: MCD-1(A)
    Semester: 2nd
    Subject: Technical Training
    Subject Code: 25CAP-652
    Date of Performance: 27 January 2026

### 1️⃣ Experiment 3:

Title:
To implement conditional decision-making logic in PostgreSQL using IF–ELSE constructs and 
CASE expressions for classification, validation, and rule-based data processing.
### Code: 
      CREATE TABLE violation_review (
    record_id SERIAL PRIMARY KEY,
    entity_name VARCHAR(50) NOT NULL,
    violation_count INT NOT NULL CHECK (violation_count >= 0)
    );
    INSERT INTO violation_review (entity_name, violation_count) VALUES
    ('Auth_Service', 0),
    ('Payment_Service', 1),
    ('Order_Service', 2),
    ('Audit_Service', 3),
    ('Admin_Service', 5);
    
    SELECT * FROM violation_review;
<img width="541" height="222" alt="image" src="https://github.com/user-attachments/assets/2bfb067f-12c7-462b-a7b7-281c610b88a6" />

    -- case statement to classify violaions:
    SELECT *, 
    CASE WHEN violation_count = 0 THEN 'No Violations'
    WHEN violation_count BETWEEN 1 and 2 THEN 'Moderate Violations'
    ELSE 'Critical Violations'
    END AS violations_level
    FROM violation_review;
<img width="710" height="225" alt="image" src="https://github.com/user-attachments/assets/7a8624a6-ae86-4946-8c9b-65935b42cbb7" />

    -- Adding a status column: 
    ALTER TABLE violation_review
    ADD COLUMN status VARCHAR(20);
<img width="737" height="227" alt="image" src="https://github.com/user-attachments/assets/7ab9317d-7a9d-414c-ab31-0cf4d7af62cd" />

    -- case statement to update status column: 
    UPDATE violation_review
    SET status =
    	CASE WHEN violation_count = 0 THEN 'Accepted'
    		WHEN violation_count BETWEEN 1 AND 2 THEN 'Reveiwing'
    		ELSE 'Rejected'
    	END
    WHERE status IS NULL;
<img width="734" height="227" alt="image" src="https://github.com/user-attachments/assets/73f89c28-f7ff-4029-b9ef-4ca0d669e39e" />

    -- If Else: 
    DO $$
    DECLARE
        v_count INT;
    BEGIN
        SELECT violation_count
        INTO v_count
        FROM violation_review
        WHERE entity_name = 'Payment_Service';

    IF v_count = 0 THEN
        RAISE NOTICE 'Payment_Service: Accepted';

    ELSIF v_count = 1 THEN
        RAISE NOTICE 'Payment_Service: Needs Review';

    ELSE
        RAISE NOTICE 'Payment_Service: Rejected';
    END IF;
    END $$;
<img width="401" height="52" alt="image" src="https://github.com/user-attachments/assets/0ff3915e-af2a-4aca-9745-b0cbba5d9117" />

    CREATE TABLE student (
        student_name VARCHAR(50),
        marks INT
    );
    
    INSERT INTO student VALUES
    ('Amit', 92),
    ('Riya', 78),
    ('Neha', 65),
    ('Rahul', 48),
    ('Karan', 33);
    
    SELECT student_name,marks,
        CASE
            WHEN marks >= 90 THEN 'A'
            WHEN marks >= 75 THEN 'B'
            WHEN marks >= 60 THEN 'C'
            WHEN marks >= 40 THEN 'D'
            ELSE 'Fail'
        END AS grade
    FROM student;
<img width="431" height="224" alt="image" src="https://github.com/user-attachments/assets/d16505ae-ce68-4904-977c-cf9e50f92231" />

    -- custom order filtering:
    SELECT
        entity_name,
        violation_count
    FROM violation_review
    ORDER BY
        CASE
            WHEN violation_count = 0 THEN 1
            WHEN violation_count BETWEEN 1 AND 3 THEN 2
            WHEN violation_count BETWEEN 4 AND 7 THEN 3
            ELSE 4
        END,
        violation_count DESC;
<img width="414" height="237" alt="image" src="https://github.com/user-attachments/assets/e3d3b0d1-db4e-4ea5-a64e-c45c82551bab" />


