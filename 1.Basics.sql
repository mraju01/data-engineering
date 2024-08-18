-- Create a new database called 'MyFirstDatabase'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'MyFirstDatabase'
)
CREATE DATABASE MyFirstDatabase
GO

-- Create a Table
USE MyFirstDatabase

CREATE TABLE Employees(
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    BirthDate DATE,
    Position NVARCHAR(40),
    SALARY DECIMAL(10,2)
);

-- Inserting Data into the Table

INSERT INTO Employees (EmployeeID,FirstName, LastName, BirthDate, Position, SALARY) VALUES
(1, 'John', 'Doe', '1980-05-15', 'Manager', 75000.00),
(2, 'Jane', 'Smith', '1990-08-22', 'Developer', 65000.00),
(3, 'Michael', 'Johnson', '1985-12-10', 'Designer', 60000.00);


-- Retrieving Data with SELECT
SELECT * FROM Employees

-- Filtering Data
SELECT * FROM Employees WHERE SALARY > 63000 AND SALARY < 68000;

-- Sorting Data
SELECT * FROM Employees ORDER BY SALARY DESC;

-- Update Data
UPDATE Employees
SET Salary = 68000
WHERE EmployeeID = 2;

SELECT * FROM Employees ORDER BY SALARY DESC;

-- Delete Data (Delete the row)
DELETE Employees
WHERE EmployeeID = 3;

SELECT * FROM Employees ORDER BY SALARY DESC;

-- New Database Practise
CREATE DATABASE CompanyDB

CREATE TABLE Departments(
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(100),
    Location NVARCHAR(100),
    Budget DECIMAL (12,2)
)

-- Insert rows into table 'CompanyDB' in schema '[dbo]'
INSERT INTO Departments (DepartmentID, DepartmentName, Location, Budget)
VALUES
(1, 'Human Resources', 'New York', 200000.00),
(2, 'Finance', 'London', 500000.00),
(3, 'IT', 'San Francisco', 750000.00);

GO

SELECT * FROM Departments;

SELECT * FROM Departments WHERE Budget > 300000;

SELECT * FROM Departments ORDER BY DepartmentName DESC;

UPDATE Departments
SET Budget = 800000
WHERE DepartmentName = 'IT'



DELETE Departments
WHERE DepartmentName = 'Human Resources'

CREATE TABLE Employees(
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL (10,2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);


-- Insert rows into table 'TableName' in schema '[dbo]'
INSERT INTO Employees
( -- Columns to insert data into
 [EmployeeID], [FirstName], [LastName], [DepartmentID], [Salary]
)
VALUES
( -- First row: values for the columns in the list above
 1, 'Alice', 'Williams', 2, 90000.00
),
( -- Second row: values for the columns in the list above
 2, 'Bob', 'Brown', 3, 120000.00
),
(
  3, 'Charlie', 'Davis', 2, 95000.00  
)
-- Add more rows here
GO


-- Write a query to retrieve all employees and their corresponding department names.
SELECT e.EmployeeID, e.FirstName, e.DepartmentID,  d.DepartmentName AS DName
FROM Employees e LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID ;

-- Write a query to calculate the total salary expense for each department.
SELECT d.DepartmentName, SUM(e.Salary) AS TotalExpense
FROM Employees e LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID GROUP BY d.DepartmentName;



