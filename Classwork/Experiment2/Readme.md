### 👨‍🎓 Student Details

    Name: Chaitanya Sharma
    UID: 25MCD10056
    Branch: MCA (Data Science)
    Section: MCD-1(A)
    Semester: 2nd
    Subject: Technical Training
    Subject Code: 25CAP-652
    Date of Performance: 21 January 2026

### 1️⃣ Experiment 2:

Title:
 To implement and analyze SQL SELECT queries using filtering, sorting, grouping, and aggregation 
concepts in PostgreSQL for efficient data retrieval and analytical reporting. 
### Code: 
    --Step 1: 
    CREATE TABLE customer_orders (
    order_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    price NUMERIC(10,2),
    order_date DATE
    );

    INSERT INTO customer_orders 
    (customer_name, product, quantity, price, order_date)
    VALUES
    ('Amit', 'Laptop', 1, 55000, '2024-01-10'),
    ('Riya', 'Laptop', 2, 54000, '2024-01-12'),
    ('Karan', 'Mobile', 3, 20000, '2024-01-15'),
    ('Sneha', 'Mobile', 1, 22000, '2024-01-16'),
    ('Rahul', 'Tablet', 2, 30000, '2024-01-18'),
    ('Pooja', 'Laptop', 1, 58000, '2024-01-20'),
    ('Ankit', 'Tablet', 3, 28000, '2024-01-22');
    
    select * from customer_orders;
    -- Step 2: 
    SELECT *
    FROM customer_orders
    WHERE price > 30000;
    
    -- Step 3: 
    SELECT customer_name, product, price
    FROM customer_orders
    WHERE price > 20000
    ORDER BY price ASC;
    
    SELECT customer_name, product, price
    FROM customer_orders
    WHERE price > 20000
    ORDER BY price DESC;
    
    -- step 4: 
    SELECT product,
           SUM(quantity * price) AS total_sales
    FROM customer_orders
    GROUP BY product;
    -- Step 5:
    
    SELECT product,
           SUM(quantity * price) AS total_sales
    FROM customer_orders
    GROUP BY product
    HAVING SUM(quantity * price) > 100000;
    
    -- Step 6: 
    select product, sum(quantity*price) as total_revenue
    from customer_orders
    where order_date >= '2024-01-15'
    group by product
    having sum(quantity*price) > 50000;
### Output: 
--Step 1:<br>
<img width="941" height="299" alt="image" src="https://github.com/user-attachments/assets/ad47a198-0d2b-4a56-893f-f9d800666bb6" /><br>
<img width="374" height="448" alt="image" src="https://github.com/user-attachments/assets/1baf895c-0816-4a36-9c6a-e30d21876d6f" /><br>
<img width="284" height="381" alt="image" src="https://github.com/user-attachments/assets/8b39e956-bd56-463e-aa25-4228277583b2" />
