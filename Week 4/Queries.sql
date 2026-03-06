SELECT 
    Employees.EmployeeID, 
    CONCAT(Employees.FirstName, ' ', Employees.LastName) AS EmployeeName, 
    Shippers.ShipperID, 
    Shippers.CompanyName AS ShipperName
FROM Employees 
CROSS JOIN Shippers;

SELECT c.CustomerID, c.CustomerName, s.ShipperID, s.ShipperName,
    LEFT(c.CustomerName,3) AS FirstThreeCharacters
FROM customers c
CROSS JOIN orders o
CROSS JOIN shippers s
WHERE LEFT(c.CustomerName,3) = LEFT(s.ShipperName,3);

SELECT 
    E1.EmployeeID AS Employee1ID, 
    CONCAT(E1.FirstName, ' ', E1.LastName) AS Employee1Name, 
    E2.EmployeeID AS Employee2ID, 
    CONCAT(E2.FirstName, ' ', E2.LastName) AS Employee2Name
FROM Employees E1
CROSS JOIN Employees E2 
WHERE E1.EmployeeID < E2.EmployeeID;

SELECT 
    o.OrderID, 
    c.CustomerName, 
    p.ProductName, 
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, 
    s.ShipperName
FROM orders o 
JOIN customers c 
    ON o.CustomerID = c.CustomerID
JOIN orderdetails od 
    ON o.OrderID = od.OrderID
JOIN products p 
    ON p.ProductID = od.ProductID
JOIN employees e 
    ON o.EmployeeID = e.EmployeeID
JOIN shippers s 
    ON o.ShipperID = s.ShipperID;
    
SELECT p.ProductID, p.ProductName, p.CategoryID, s.SupplierName
FROM products p
JOIN suppliers s
    ON p.SupplierID = s.SupplierID
LEFT JOIN orderdetails o
    ON p.ProductID = o.ProductID
WHERE o.ProductID IS NULL;

SELECT e.EmployeeID, concat(e.FirstName, ' ', e.LastName) AS EmployeeName
FROM employees e
LEFT JOIN orders o 
ON e.EmployeeID = o.EmployeeID
WHERE o.EmployeeID IS NULL;

SELECT
    o.OrderID,
    o.CustomerID,
    c.CustomerName,
    o.EmployeeID,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName
FROM orders o
LEFT JOIN customers c ON o.CustomerID = c.CustomerID
LEFT JOIN employees e ON o.EmployeeID = e.EmployeeID;

SELECT
    c.CustomerID,
    c.CustomerName,
    COALESCE(CAST(o.OrderID AS CHAR), 'No Order Placed') AS OrderID
FROM customers c
LEFT JOIN orders o ON c.CustomerID = o.CustomerID;

SELECT 
    o.OrderID,
    c.CustomerID,
    c.CustomerName,
    HOUR(o.OrderDate) AS OrderHour
FROM orders o
JOIN customers c ON o.CustomerID = c.CustomerID
WHERE HOUR(o.OrderDate) < 9
   OR HOUR(o.OrderDate) > 17;
   
SELECT DISTINCT
    p.ProductID,
    p.ProductName,
    e1.EmployeeID AS Employee1ID,
    CONCAT(e1.FirstName,' ',e1.LastName) AS Employee1Name,
    e2.EmployeeID AS Employee2ID,
    CONCAT(e2.FirstName,' ',e2.LastName) AS Employee2Name
FROM orderdetails od1
JOIN orders o1 ON od1.OrderID = o1.OrderID
JOIN employees e1 ON o1.EmployeeID = e1.EmployeeID

JOIN orderdetails od2 ON od1.ProductID = od2.ProductID

JOIN orders o2 ON od2.OrderID = o2.OrderID
JOIN employees e2 ON o2.EmployeeID = e2.EmployeeID

JOIN products p ON od1.ProductID = p.ProductID
WHERE e1.EmployeeID < e2.EmployeeID;

