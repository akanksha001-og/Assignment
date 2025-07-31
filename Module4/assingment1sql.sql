create database MarketCo;
use marketCo;
## Statement to create the Contact table 
CREATE TABLE Contact (
    ContactID INT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12)
    );
    ## Statement to create the Employee table  
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10,2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);
##  Statement to create the ContactEmployee table 
CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100)
);
 ## Statement to create the Company table
CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10)
);

INSERT INTO Company VALUES
(1, 'Urban Outfitters, Inc.', '123 Main St', 'Philadelphia', 'PA', '19107'),
(2, 'Toll Brothers', '456 Elm St', 'Horsham', 'PA', '19044');

INSERT INTO Employee VALUES
(1, 'Lesley', 'Bland', 60000.00, '2020-01-10', 'Manager', 'lesley@example.com', '215-555-1234'),
(2, 'Dianne', 'Connor', 50000.00, '2019-03-15', 'Sales', 'dianne@example.com', '215-555-2345');

INSERT INTO Contact VALUES
(1, 2, 'Jack', 'Lee', '789 Pine St', 'Horsham', 'PA', '19044', TRUE, 'jack@example.com', '215-555-9999');
INSERT INTO ContactEmployee VALUES 
(1, 1, 2, '2024-05-10', 'Dianne met with Jack to discuss the Toll Brothers deal');
INSERT INTO ContactEmployee VALUES 
(2, 1, 1, '2024-06-01', 'Lesley followed up with Jack regarding project updates');

INSERT INTO ContactEmployee VALUES 
(3, 1, 2, '2024-07-15', 'Dianne scheduled a site visit with Jack');

/* In the Employee table, the statement that changes Lesley Bland’s phone number 
to 215-555-8800 */ 

UPDATE Employee
SET Phone = '215-555-8800'
WHERE FirstName = 'Lesley' AND LastName = 'Bland';

/* In the Company table, the statement that changes the name of “Urban 
Outfitters, Inc.” to “Urban Outfitters” */

UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyName = 'Urban Outfitters, Inc.';

/*  In ContactEmployee table, the statement that removes Dianne Connor’s contact 
event with Jack Lee (one statement).*/

DELETE FROM ContactEmployee
WHERE ContactEmployeeID = 1;

/*  Write the SQL SELECT query that displays the names of the employees that 
have contacted Toll Brothers (one statement). Run the SQL SELECT query in 
MySQL Workbench. Copy the results below as well. .*/

SELECT E.FirstName, E.LastName
FROM Employee E
JOIN ContactEmployee CE ON E.EmployeeID = CE.EmployeeID
JOIN Contact C ON C.ContactID = CE.ContactId
JOIN Company Co ON Co.CompanyID = c.CompanyID
WHERE Co.CompanyName = 'toll Brothers';

select * from employee;
select* from company;
select * from Contact;
select * from  ContactEmployee;

## What is the significance of “%” and “_” operators in the LIKE statement? 

/* % It can represent any sequence of characters (including none).
WHERE Matches exactly one character /*


#  Explain normalization in the context of databases. 
/*ANSWER: Normalization in the context of databases is a systematic process of organizing data to reduce redundancy and improve data integrity. The main goal is to structure a relational
database in a way that every piece of information is stored only once, and dependencies are logical and minimal. */

## What does a join in MySQL mean?

/*ANSWER: A JOIN in MySQL is a SQL operation that combines columns from two or more tables based on a related column, usually a foreign key.
It helps retrieve related data stored in different tables as a single result set.  /*

# What do you understand about DDL, DCL, and DML in MySQL

/*ANSWER: DDL STAND for Data Definition Language is use tp modifies database structure
DML is Data Manipulation Language Manages data inside tables ans use to modify it 
 DCL is  Data Control Language use to Controls access/permissions to the database )  /*
 
 
## What is the role of the MySQL JOIN clause in a query, and what are some
common types of joins? 

/*ANSWER: The JOIN clause in MySQL is used to combine data from two or more tables in a single query, based on a related column 
. It helps in retrieving complete and meaningful data when information is spread across multiple tables.

TYPE OF JOIN 

INNER JOIN 
Returns rows only when there is a match in both tables.
 
LEFT JOIN 
 Returns all rows from the left table and matching rows from the right table.
 If no match, returns NULL for right table columns.
 
RIGHT JOIN
  Opposite of LEFT JOIN: returns all rows from the right table, with matching left table rows.
   
CROSS JOIN 
   Returns the Cartesian product: every row from the first table is joined with every row of the second table.
   
SELF JOIN  
  A SELF JOIN is a regular join, but the table is joined with itself. It is useful when you need to compare rows within the same table./*
