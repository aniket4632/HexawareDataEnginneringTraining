-- CREATING DATABASE NAMED SQL CODING CHALLENGE

CREATE DATABASE sqlcodingchallenge;

-- The USE statement in SQL is used to select a particular database as the current database, 

USE sqlcodingchallenge;


-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);
-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
-- Create Projects table
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert sample records into Departments table 
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES 
    (1, 'Human Resources'),
    (2, 'Information Technology'),
    (3, 'Marketing'),
    (4, 'Finance');

-- Insert sample records into Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, BirthDate, DepartmentID)
VALUES
    (1, 'John', 'Doe', '1990-05-15', 1),
    (2, 'Jane', 'Smith', '1985-08-22', 2),
    (3, 'Mike', 'Johnson', '1992-03-10', 3),
    (4, 'Emily', 'Davis', '1988-11-28', 2),
    (5, 'Chris', 'Brown', '1995-07-03', 1),
    (6, 'Sara', 'Miller', '1987-02-18', 4),
    (7, 'Mark', 'Anderson', '1993-09-12', 3),
    (8, 'Rachel', 'Taylor', '1990-12-05', 2),
    (9, 'Alex', 'Williams', '1986-06-20', 4),
    (10, 'Laura', 'Clark', '1991-04-25', 1);

-- Insert sample records into Projects table
INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, DepartmentID)
VALUES
    (101, 'Employee Portal Development', '2023-01-15', '2023-06-30', 2),
    (102, 'Marketing Campaign - Summer 2023', '2023-03-01', '2023-09-30', 3),
    (103, 'Financial Reports Automation', '2023-02-10', '2023-05-31', 4),
    (104, 'Training Program - HR', '2023-04-01', '2023-08-31', 1),
    (105, 'IT Infrastructure Upgrade', '2023-01-20', '2023-07-15', 2),
    (106, 'New Product Launch', '2023-05-15', '2023-11-30', 3),
    (107, 'Budget Planning', '2023-03-15', '2023-06-30', 4),
    (108, 'Employee Wellness Program', '2023-06-01', '2023-12-31', 1),
    (109, 'Finance System Enhancement', '2023-04-15', '2023-10-31', 4),
    (110, 'Data Security Audit', '2023-02-28', '2023-05-15', 2);
    
   
   -- over and partition by clause
-- Calculate the average birth year of employees within each department
SELECT
    EmployeeID,
    FirstName,
    LastName,
    BirthDate,
    DepartmentID,
    AVG(YEAR(BirthDate)) OVER (PARTITION BY DepartmentID) AS AvgBirthYear
FROM
    Employees;

-- subtotal aggreagtion
-- Calculate the total number of employees in each department
SELECT
    DepartmentID,
    COUNT(EmployeeID) AS TotalEmployees
FROM
    Employees
GROUP BY
    DepartmentID;

-- Total Aggregations
SELECT
    COUNT(EmployeeID) AS TotalEmployees,
    AVG(YEAR(BirthDate)) AS AvgBirthYear
FROM
    Employees;




