USE sqlcodingchallenge;
-- inner join
SELECT Employees.EmployeeID, Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- left join
SELECT Employees.EmployeeID, Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- right join 
SELECT Employees.EmployeeID, Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- full join 
SELECT Employees.EmployeeID, Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
 FULL JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- CROSS JOIN 
SELECT Employees.EmployeeID, Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
CROSS JOIN Departments;

-- NATURAL JOIN
SELECT *
FROM Employees
NATURAL JOIN Departments;

-- EQUI JOIN 
SELECT *
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- NON EQUI JOIN
SELECT *
FROM Employees
LEFT JOIN Projects ON Employees.EmployeeID <> Projects.ProjectID;

-- SELF JOIN 
SELECT
    e1.EmployeeID AS Employee1ID,
    e1.FirstName AS Employee1FirstName,
    e1.LastName AS Employee1LastName,
    e2.EmployeeID AS Employee2ID,
    e2.FirstName AS Employee2FirstName,
    e2.LastName AS Employee2LastName,
    e1.DepartmentID
FROM
    Employees e1
JOIN
    Employees e2 ON e1.DepartmentID = e2.DepartmentID
    AND e1.EmployeeID < e2.EmployeeID;

