
-- WINDOWS FUNCTIONs

-- PARTITION BY
 
-- In GROUP BY, it basically group all your results, don't get all rows of information, just get summary information

-- But in Parttion By, you will get aggregation as well as results under underlying table

SELECT ProductID, SUM(OrderQty) AS 'Sum of Orders'
FROM SalesLT.SalesOrderDetail
GROUP BY ProductID;

SELECT ProductID,OrderQty, SUM(OrderQty) OVER (PARTITION BY ProductID) AS 'Total Order Quatntity'
FROM SalesLT.SalesOrderDetail;


-- LEAD Function Ex
SELECT ProductID, OrderQty, LEAD(OrderQty) OVER (ORDER BY ProductID) AS NextQrderQty
FROM SalesLT.SalesOrderDetail;

-- LAG Function Ex
SELECT ProductID, OrderQty, LAG(OrderQty) OVER (ORDER BY ProductID) As PrevOrderQty
FROM SalesLT.SalesOrderDetail;

-- CTE (WITH) - Temporary Results
WITH CTE_Products AS (
SELECT ProductID,OrderQty
FROM SalesLT.SalesOrderDetail
)

SELECT * FROM CTE_Products

-- Create Table
CREATE TABLE Student(
    StudentID VARCHAR(100) NOT NULL,
    StudentName VARCHAR(1000),
    PRIMARY KEY (StudentID)
)

INSERT INTO Student (StudentID, StudentName)
VALUES
('S01' , 'StudentA'),
('S02', 'StudentB');

INSERT INTO Student(StudentName)
VALUES
('StudentC') -- Primary Key Constraint,because key can't be null

INSERT INTO Student (StudentID, StudentName)
VALUES
('S01' , 'StudentD'); -- Pk can't be duplicate


-- Foregein Key
CREATE TABLE Course(
    CourseID VARCHAR(100) NOT NULL ,
    CourseName VARCHAR(1000),
    Price REAL,
    PRIMARY KEY (CourseID)
)

CREATE TABLE Orders(
    OrderID VARCHAR(100) NOT NULL,
    CourseID VARCHAR(100),
    StudentID VARCHAR(100),
    DiscounPercent INT,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
)


SELECT * FROM Student;

DELETE FROM Student
WHERE StudentID = 'S02';

INSERT INTO Student(StudentID,StudentName) values ('S1','StudentA');
INSERT INTO Student(StudentID,StudentName) values ('S2','StudentB');
INSERT INTO Student(StudentID,StudentName) values ('S3','StudentC');
 
INSERT INTO COURSE(CourseID,CourseName,Price) values ('C1','AZ-900',99.99);
INSERT INTO COURSE(CourseID,CourseName,Price) values ('C2','DP-900',100.99);
INSERT INTO COURSE(CourseID,CourseName,Price) values ('C3','AZ-104',89.99);
 
INSERT INTO Orders(OrderID,CourseID,StudentID,DiscounPercent) values ('O1','C2','S1',90);
INSERT INTO Orders(OrderID,CourseID,StudentID,DiscounPercent) values ('O2','C1','S2',50);
INSERT INTO Orders(OrderID,CourseID,StudentID,DiscounPercent) values ('O3','C3','S3',60);

SELECT * FROM  Course

SELECT * FROM Orders

INSERT INTO Orders(OrderID, CourseID,StudentID, DiscounPercent) VALUES ('04', 'C4', 'S1', '90')
-- Won't work because of foreign key constraints


DROP TABLE Student
-- Can't delete of Foreign key, have to delete order table first
-- First delete fact table and then dimension  table 

DROP TABLE Orders

DROP TABLE Student