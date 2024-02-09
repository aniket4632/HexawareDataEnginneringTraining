-- Creating database 
CREATE DATABASE laundarymanagementsystem;

-- Using the database
USE laundarymanagementsystem;

-- Creating tables (DDL COMMAND CREATE)

-- Table to store information about customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY auto_increment,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255)
);

-- Table to store information about laundry orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY auto_increment,
    CustomerID INT,
    OrderDate DATE,
    PickupDate DATE,
    DeliveryDate DATE,
    TotalAmount DECIMAL(10, 2),
    Status VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Table to store information about items in each laundry order
CREATE TABLE LaundryItems (
    ItemID INT PRIMARY KEY auto_increment,
    OrderID INT,
    ItemType VARCHAR(50),
    Quantity INT,
    Description TEXT,
    PricePerItem DECIMAL(8, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
-- Showing all tables in database
SHOW TABLES;

-- INSERTING DATA INTO TABLES (INSERT  :- DML COMMAND)

-- Inserting 10 records into the Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, PhoneNumber, Email, Address)
VALUES
    (1, 'John', 'Doe', '123-456-7890', 'john.doe@example.com', '123 Main St'),
    (2, 'Jane', 'Smith', '987-654-3210', 'jane.smith@example.com', '456 Oak St'),
    (3, 'Bob', 'Johnson', '555-123-4567', 'bob.johnson@example.com', '789 Pine St'),
    (4, 'Alice', 'Williams', '444-567-8901', 'alice.williams@example.com', '101 Elm St'),
    (5, 'Charlie', 'Brown', '777-888-9999', 'charlie.brown@example.com', '202 Maple St'),
    (6, 'Emily', 'Davis', '111-222-3333', 'emily.davis@example.com', '303 Cedar St'),
    (7, 'David', 'Clark', '999-555-4444', 'david.clark@example.com', '404 Birch St'),
    (8, 'Grace', 'Miller', '666-333-2222', 'grace.miller@example.com', '505 Walnut St'),
    (9, 'Samuel', 'Turner', '222-777-8888', 'samuel.turner@example.com', '606 Pineapple St'),
    (10, 'Eva', 'Harris', '333-111-0000', 'eva.harris@example.com', '707 Peach St');
-- Inserting 10 records into the Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, PickupDate, DeliveryDate, TotalAmount, Status)
VALUES
    (101, 1, '2024-01-22', '2024-01-23', '2024-01-25', 50.00, 'Pending'),
    (102, 2, '2024-01-22', '2024-01-24', '2024-01-26', 75.00, 'Processing'),
    (103, 3, '2024-01-23', '2024-01-25', '2024-01-27', 100.00, 'Completed'),
    (104, 4, '2024-01-24', '2024-01-26', '2024-01-28', 120.00, 'Pending'),
    (105, 5, '2024-01-25', '2024-01-27', '2024-01-29', 90.00, 'Processing'),
    (106, 6, '2024-01-26', '2024-01-28', '2024-01-30', 60.00, 'Completed'),
    (107, 7, '2024-01-27', '2024-01-29', '2024-01-31', 80.00, 'Pending'),
    (108, 8, '2024-01-28', '2024-01-30', '2024-02-01', 110.00, 'Processing'),
    (109, 9, '2024-01-29', '2024-01-31', '2024-02-02', 95.00, 'Completed'),
    (110, 10, '2024-01-30', '2024-02-01', '2024-02-03', 70.00, 'Pending');
-- Inserting 10 records into the LaundryItems table
INSERT INTO LaundryItems (ItemID, OrderID, ItemType, Quantity, Description, PricePerItem)
VALUES
    (201, 101, 'Shirt', 2, 'Cotton shirt', 5.00),
    (202, 101, 'Pants', 1, 'Denim jeans', 10.00),
    (203, 102, 'Dress', 1, 'Summer dress', 20.00),
    (204, 103, 'Socks', 5, 'Cotton ankle socks', 1.50),
    (205, 104, 'Jacket', 1, 'Leather jacket', 30.00),
    (206, 105, 'Towel', 3, 'Bath towel', 4.00),
    (207, 106, 'Bedding', 1, 'Queen-size bedsheet', 15.00),
    (208, 107, 'Hat', 1, 'Sun hat', 8.00),
    (209, 108, 'T-shirt', 3, 'Plain white T-shirt', 6.00),
    (210, 109, 'Shorts', 2, 'Cargo shorts', 12.00);
-- DISPLAYING TABLE DATA FOR ALL COLUMNS

SELECT * FROM Customers;
SElect * FROM Orders;
SELECT * FROM LaundryItems;

---- Update customer phone number (UPDATE DML QUERY)
UPDATE Customers
SET PhoneNumber = '555-123-4567'
WHERE CustomerID = 1;

set foreign_key_checks=0;
--- (if parent table has foreign key constraint)
-- Delete customer with CustomerID 10

DELETE FROM Customers
WHERE CustomerID = 10;

set foreign_key_checks=1;

-- DDL COMMANDS

-- Add a new column to the Customers table
ALTER TABLE Customers
ADD COLUMN LoyaltyPoints INT;

-- Change the data type of the TotalAmount column in the Orders table
ALTER TABLE Orders
MODIFY COLUMN TotalAmount DECIMAL(10, 2);

-- drop columns in customer table
ALTER TABLE Customers
DROP COLUMN LoyaltyPoints;

-- Rename the ItemType column to ClothingType in the LaundryItems table
ALTER TABLE LaundryItems
CHANGE COLUMN ItemType ClothingType VARCHAR(50);
 
 -- Retrieving Specific Attributes:
  --  Retrieve first names and email addresses of all customers.
  
  SELECT FirstName, Email
FROM Customers;

SELECT OrderID, OrderDate, TotalAmount
FROM Orders;

-- Retrieving Selected Rows:

-- Retrieve all information for orders with a status of 'Completed'.
SELECT *
FROM Orders
WHERE Status = 'Completed';

-- Filtering Data with WHERE Clauses:

SELECT *
FROM LaundryItems
WHERE ClothingType = 'Shirt';

-- AND OPERATOR

SELECT *
FROM Customers
WHERE FirstName= 'John' AND PhoneNumber='555-123-4567';

-- OR OPERATOR

SELECT *
FROM Customers
WHERE FirstName ='John' OR LastName = 'Doe';


-- NOT OPERATOR

SELECT *
FROM Orders
WHERE NOT Status = 'Completed';

-- BETWEEN OPERATOR 

SELECT *
FROM Orders
WHERE OrderDate BETWEEN '2024-01-01' AND '2024-01-31';

-- LIKE OPERATOR

SELECT *
FROM Customers
WHERE FirstName LIKE 'J%';

-- IN OPERATOR

SELECT *
FROM Orders
WHERE CustomerID IN (1, 3, 5);

-- EXISTS 
SELECT *
FROM Orders
WHERE EXISTS (
    SELECT 1
    FROM Orders
    WHERE TotalAmount > 100
);

-- ANY 
SELECT *
FROM Orders
WHERE TotalAmount > ANY (
    SELECT TotalAmount
    FROM Orders
    WHERE Status = 'Processing'
);

-- ALL 
SELECT *
FROM Orders
WHERE TotalAmount > ALL (
    SELECT TotalAmount
    FROM Orders
    WHERE Status = 'Processing'
);

-- DISTINCT 
SELECT DISTINCT Status
FROM Orders;

-- AGGERAGTE OPERATORS

-- COUNT
SELECT COUNT(CustomerID) AS TotalCustomers
FROM Customers;

-- AVERAGE 

SELECT AVG(TotalAmount) AS AverageTotalAmount
FROM Orders;

-- MAX 
SELECT MAX(TotalAmount) AS MaxTotalAmount
FROM Orders;

-- SUM 

SELECT SUM(Quantity) AS TotalQuantity
FROM LaundryItems;

-- MIN 
 
 SELECT MIN(OrderDate) AS EarliestOrderDate
FROM Orders;

-- STRING FUNCTIONS 

-- CONCAT 
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers;

-- SUBSTRING 
SELECT SUBSTRING(FirstName, 1, 3) AS ShortName
FROM Customers;

-- UPPER CASE

SELECT UPPER(FirstName) AS UppercaseName
FROM Customers;

-- LENGTH 
SELECT LENGTH(Address) AS AddressLength
FROM Customers;

-- TRIM 
SELECT TRIM('   Example   ') AS TrimmedString;
SELECT LTRIM('   Left Trim') AS LeftTrimmedString;
SELECT RTRIM('Right Trim   ') AS RightTrimmedString;

-- REPLACE 
SELECT REPLACE(Address, 'Street', 'Avenue') AS UpdatedAddress
FROM Customers;

-- POSITION 
SELECT POSITION('Laundry' IN Description) AS PositionInDescription
FROM LaundryItems;

-- LEFT AND RIGHT PART OF STRING 
SELECT LEFT(PhoneNumber, 3) AS AreaCode
FROM Customers;

SELECT RIGHT(PhoneNumber, 4) AS LastFourDigits
FROM Customers;

-- MATHEMATICAL FUNCTIONS
-- ABS (Absolute Value):
SELECT ABS(-10) AS AbsoluteValue;

--  ROUND (Round to the Nearest Integer):

SELECT ROUND(12.345) AS RoundedValue;

--  CEIL or CEILING (Round Up):

SELECT CEIL(9.25) AS CeiledValue;

--  FLOOR (Round Down):


-- POWER 
SELECT POWER(2, 3) AS Result;

-- SQRT 
SELECT SQRT(25) AS Result;

-- EXPONENTIAL 
SELECT EXP(2) AS Result;

-- LOG 
SELECT LOG(10) AS Result;

-- MOD 
SELECT MOD(10, 3) AS Remainder;

-- DATE FUNCTIONS

-- CURRENT DATE
SELECT CURRENT_DATE AS Today;

-- CURRENT TIME AND TIMESTAMP 

SELECT CURRENT_TIME AS CurrentTime, CURRENT_TIMESTAMP AS CurrentTimestamp;

-- EXTRACT 
SELECT EXTRACT(YEAR FROM '2022-01-22') AS ExtractedYear;

-- DATEDIFF
SELECT DATEDIFF('2022-01-01', '2022-01-22') AS DateDifference;

-- DATE FORMAT 
SELECT DATE_FORMAT('2022-01-22', '%Y-%m-%d') AS FormattedDate;

-- NOW
SELECT NOW() AS CurrentDatetime;


-- GROUP BY 

SELECT CustomerID, SUM(TotalAmount) AS TotalAmountPerCustomer
FROM Orders
GROUP BY CustomerID;

-- ORDER BY 
SELECT Status, COUNT(*) AS NumberOfOrders
FROM Orders
GROUP BY Status
ORDER BY Status;

-- FILTERING WITH GROUP BY HAVING AND ORDER BY 

SELECT CustomerID, SUM(TotalAmount) AS TotalAmount, AVG(TotalAmount) AS AverageAmount
FROM Orders
GROUP BY CustomerID
HAVING AVG(TotalAmount) > 50
ORDER BY TotalAmount DESC;

SELECT OrderID, MAX(Quantity) AS MaxQuantity
FROM LaundryItems
GROUP BY OrderID
ORDER BY MaxQuantity DESC;

-- UNION 

SELECT CustomerID AS ID
FROM Customers
UNION
SELECT OrderID AS ID
FROM Orders;

-- INTERSECT 

SELECT OrderID As ID
FROM Orders
INTERSECT
SELECT OrderId as ID
FROM LaundryItems;

-- UNION ALL

-- Combine items and quantities from LaundryItems
SELECT ClothingType AS Item, Quantity
FROM LaundryItems
UNION ALL
SELECT ClothingType, Quantity
FROM LaundryItems
WHERE Quantity > 5;

-- EXCEPT 

SELECT CustomerID
FROM Customers
EXCEPT
SELECT CustomerID
FROM Orders;

-- JOINS 

-- INNER JOIN 
SELECT Customers.CustomerID, FirstName, LastName, OrderID, OrderDate
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- LEFT JOIN 
SELECT Customers.CustomerID, FirstName, LastName, OrderID, OrderDate
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- RIGHT JOIN 
SELECT Customers.CustomerID, FirstName, LastName, OrderID, OrderDate
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;


-- CROSS JOIN 
SELECT Customers.CustomerID, FirstName, LastName, OrderID, OrderDate
FROM Customers
CROSS JOIN Orders;

-- SELF JOIN(EQUI JOIN)
SELECT 
    c1.CustomerID AS CustomerID1,
    c1.FirstName AS FirstName1,
    c1.LastName AS LastName1,
    c1.Email AS Email1,
    c2.CustomerID AS CustomerID2,
    c2.FirstName AS FirstName2,
    c2.LastName AS LastName2,
    c2.Email AS Email2
FROM 
    Customers c1
JOIN 
    Customers c2 ON c1.Email = c2.Email AND c1.CustomerID < c2.CustomerID;

-- NON-EQUI JOIN 
SELECT 
    o1.OrderID AS OrderID1,
    o1.PickupDate AS PickupDate1,
    o1.DeliveryDate AS DeliveryDate1,
    o2.OrderID AS OrderID2,
    o2.PickupDate AS PickupDate2,
    o2.DeliveryDate AS DeliveryDate2
FROM 
    Orders o1
JOIN 
    Orders o2 ON o1.PickupDate > o2.DeliveryDate;

-- JOINS WITH GROUP BY HAVING AGGREGATE FUNTIONS
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    SUM(o.TotalAmount) AS TotalAmountSpent
FROM 
    Customers c
LEFT JOIN 
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY 
    c.CustomerID, c.FirstName, c.LastName
HAVING 
    TotalAmountSpent IS NOT NULL;

SELECT 
    li.ClothingType,
    AVG(li.Quantity) AS AverageQuantity,
    MAX(li.Quantity) AS MaxQuantity
FROM 
    LaundryItems li
JOIN 
    Orders o ON li.OrderID = o.OrderID
GROUP BY 
    li.ClothingType
HAVING 
    AVG(li.Quantity) > 10;
    
-- QUERYING DATA WITH SUB QUERIES
SELECT *
FROM Orders
WHERE TotalAmount = (
    SELECT MAX(TotalAmount)
    FROM Orders
);

SELECT *
FROM Customers
WHERE CustomerID IN (
    SELECT DISTINCT CustomerID
    FROM Orders
    WHERE OrderDate >= CURDATE() - INTERVAL 1 MONTH
);
SELECT *
FROM Orders
WHERE OrderID IN (
    SELECT OrderID
    FROM LaundryItems
    WHERE ClothingType = 'Shirt'
);
-- QUERY USING NESTED SUBQUERY 

SELECT 
    CustomerID,
    FirstName,
    LastName,
    (
        SELECT SUM(TotalAmount)
        FROM Orders
        WHERE Orders.CustomerID = Customers.CustomerID
    ) AS TotalAmountSpent
FROM 
    Customers
WHERE 
    CustomerID IN (
        SELECT DISTINCT CustomerID
        FROM Orders
        WHERE OrderDate >= CURDATE() - INTERVAL 1 MONTH
    );

-- QUERY USING CORRELATED SUBQUERY

SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    (
        SELECT MAX(o.OrderDate)
        FROM Orders o
        WHERE o.CustomerID = c.CustomerID
    ) AS LatestOrderDate
FROM 
    Customers c;

SELECT *
FROM Orders o
WHERE TotalAmount > (
    SELECT AVG(TotalAmount)
    FROM Orders
    WHERE o.CustomerID = CustomerID
);

-- SYSTEM FUNCTIONS 

-- Database Version
SELECT VERSION();

-- Current User:
SELECT CURRENT_USER();

-- Current Date and Time:
SELECT NOW();

-- Database Name:
SELECT Database();

-- System Date
SELECT CURRENT_DATE();

--  System Time:
SELECT CURRENT_TIME();

-- current timestamp
SELECT CURRENT_TIMESTAMP();

--  Session User:
SELECT CURRENT_USER;

-- Connection ID or Session ID:
SELECT CONNECTION_ID();

-- 	DATA CLEANSING AND MANIPULATION
 set sql_safe_updates =0;
-- Handling Missing Values
 
UPDATE Customers
SET PhoneNumber = 'Not Available'
WHERE PhoneNumber IS NULL OR PhoneNumber = '';


-- Handling NULL Values
UPDATE Orders
SET DeliveryDate = 'Not Specified'
WHERE DeliveryDate IS NULL;

-- Removing Unnecessary Spaces

UPDATE Customers
SET Address = TRIM(Address);

-- Remove Irrelevant Data

DELETE FROM Customers
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Orders);

-- Remove Duplicate Data
DELETE o1
FROM Orders o1, Orders o2
WHERE o1.OrderID > o2.OrderID AND o1.OrderID = o2.OrderID;

--  Fix Structural Errors

ALTER TABLE Orders
MODIFY COLUMN TotalAmount DECIMAL(10, 2);

-- Type Conversion

UPDATE Customers
SET PhoneNumber = CONCAT('+1', REGEXP_REPLACE(PhoneNumber, '[^0-9]', ''))
WHERE PhoneNumber IS NOT NULL;

-- Deal with Outliers

DELETE FROM Orders
WHERE TotalAmount > 1000;

-- Standardize/Normalize Data

UPDATE Customers
SET Address = UPPER(Address);

-- Validate Data

SELECT *
FROM Orders
WHERE OrderDate IS NULL OR PickupDate IS NULL OR DeliveryDate IS NULL;

-- RANKING FUNCTIONS IN SQL

-- RANK():
-- Assigns a rank to each row based on the specified ordering.

SELECT
    CustomerID,
    RANK() OVER (ORDER BY TotalAmount DESC) AS OrderRank
FROM orders;

-- ROW_NUMBER():
-- Assigns a unique number to each row based on the specified ordering.

SELECT
    FirstName,
    LastName,
    ROW_NUMBER() OVER (ORDER BY LastName, FirstName) AS RowNum
FROM Customers;

-- DENSE_RANK():

SELECT
    ClothingType,
    DENSE_RANK() OVER (ORDER BY PricePerItem) AS CustomerRank
FROM laundryitems;

--  NTILE():
-- Divides the result set into a specified number of approximately equal parts (buckets or tiles).
 
 SELECT
    Quantity,
    NTILE(4) OVER (ORDER BY PricePerItem) AS Amount
FROM laundryitems;

-- PERCENT_RANK():

SELECT
    TotalAmount,
    PERCENT_RANK() OVER (ORDER BY TotalAmount) AS PercentRank
FROM Orders;

--  CUME_DIST()

SELECT
    TotalAmount,
    CUME_DIST() OVER (ORDER BY TotalAmount) AS CumulativeDistribution
FROM Orders;


-- STORED PROCEDURES
-- STORED PROCEDURE TO GETCUSTOMERINFO

DELIMITER //

CREATE PROCEDURE GetCustomerInfo(IN p_CustomerID INT)
BEGIN
    SELECT
        CustomerID,
        FirstName,
        LastName,
        PhoneNumber,
        Email,
        Address
    FROM
        Customers
    WHERE
        CustomerID = p_CustomerID;
END //
DELIMITER ;

CALL GetCustomerInfo(2);

-- STORED PROCEDURE TO GETCUSTOMERORDERS

DELIMITER //
CREATE PROCEDURE GetCustomerOrders(IN p_CustomerID INT)
BEGIN
    SELECT
        o.OrderID,
        o.OrderDate,
        o.PickupDate,
        o.DeliveryDate,
        o.TotalAmount,
        i.ClothingType,
        i.Quantity,
        i.Description,
        i.PricePerItem
    FROM
        Orders o
    JOIN
        LaundryItems i ON o.OrderID = i.OrderID
    WHERE
        o.CustomerID = p_CustomerID;
END //
DELIMITER ;


CALL GetCustomerOrders(1);

-- 
-- Stored procedure to update the delivery date of an order
DELIMITER //

CREATE PROCEDURE UpdateDeliveryDate(IN p_OrderID INT, IN p_NewDeliveryDate DATE)
BEGIN
    UPDATE Orders
    SET DeliveryDate = p_NewDeliveryDate
    WHERE OrderID = p_OrderID;
END //

DELIMITER ;

CALL UpdateDeliveryDate(101, '2024-02-15');

-- 
-- Stored procedure to calculate the total cost for a specific order
DELIMITER //

CREATE PROCEDURE CalculateOrderTotalCost(IN p_OrderID INT, OUT p_TotalCost DECIMAL(10, 2))
BEGIN
    SELECT SUM(Quantity * PricePerItem) INTO p_TotalCost
    FROM LaundryItems
    WHERE OrderID = p_OrderID;
END //

DELIMITER ;

CALL CalculateOrderTotalCost(102, @TotalCost);
SELECT @TotalCost AS TotalCost;

-- Stored procedure to insert a new customer
DELIMITER //

CREATE PROCEDURE InsertCustomer(
    IN p_FirstName VARCHAR(50),
    IN p_LastName VARCHAR(50),
    IN p_PhoneNumber VARCHAR(15),
    IN p_Email VARCHAR(100),
    IN p_Address VARCHAR(255)
)
BEGIN
    INSERT INTO Customers (FirstName, LastName, PhoneNumber, Email, Address)
    VALUES (p_FirstName, p_LastName, p_PhoneNumber, p_Email, p_Address);
END //

DELIMITER ;

CALL InsertCustomer('Aniket', 'Biyani', '7020905391', 'anixbiyani11@google.com', 'Pune');



-- Stored procedure to delete a customer
DELIMITER //

CREATE PROCEDURE DeleteCustomer(IN p_CustomerID INT)
BEGIN
    DELETE FROM Customers WHERE CustomerID = p_CustomerID;
END //

DELIMITER ;

CALL DeleteCustomer(11);
SELECT * FROM CUSTOMERS;

-- OVER AND PARTITON BY CLAUSE
--  Calculate the Total Amount and Average Amount for Each Order:

SELECT
    OrderID,
    TotalAmount,
    AVG(TotalAmount) OVER (PARTITION BY CustomerID) AS AvgAmountForCustomer,
    SUM(TotalAmount) OVER () AS TotalAmountOverall
FROM Orders;

-- Determine the Rank of Orders Based on Total Amount within Each Customer's Orders:

SELECT
    OrderID,
    CustomerID,
    TotalAmount,
    RANK() OVER (PARTITION BY CustomerID ORDER BY TotalAmount DESC) AS RankWithinCustomer
FROM Orders;

-- Find the Running Total of Quantities Ordered for Each Clothing Type:

SELECT
    OrderID,
    ClothingType,
    Quantity,
    SUM(Quantity) OVER (PARTITION BY ClothingType ORDER BY OrderID) AS RunningTotalForItemType
FROM LaundryItems;

-- Calculate the Percentage of Total Amount for Each Order Compared to the Overall Total Amount:

SELECT
    OrderID,
    TotalAmount,
    TotalAmount / SUM(TotalAmount) OVER () * 100 AS PercentageOfTotalAmount
FROM Orders;

-- TOTAL AGGREGATION USING OVER AND PARITION B WITH GROUP BY
 -- Calculate the Running Total of Total Amount for Each Customer:
SELECT
    CustomerID,
    OrderID,
    TotalAmount,
    SUM(TotalAmount) OVER (PARTITION BY CustomerID ORDER BY OrderID) AS RunningTotalForCustomer
FROM Orders;

-- Calculate the Running Total of Quantities Ordered for Each Order:
SELECT
    OrderID,
    ClothingType,
    Quantity,
    SUM(Quantity) OVER (PARTITION BY OrderID ORDER BY ClothingType) AS RunningTotalForOrder
FROM LaundryItems;

-- Calculate the Running Count of Orders for Each Customer:
SELECT
    CustomerID,
    OrderID,
    COUNT(OrderID) OVER (PARTITION BY CustomerID ORDER BY OrderID) AS RunningOrderCountForCustomer
FROM Orders;

-- Calculate the Running Average of Total Amount for Each Customer:
SELECT
    CustomerID,
    OrderID,
    TotalAmount,
    AVG(TotalAmount) OVER (PARTITION BY CustomerID ORDER BY OrderID) AS RunningAverageForCustomer
FROM Orders;
