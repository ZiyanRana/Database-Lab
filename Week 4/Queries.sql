SELECT EmployeeID, FirstName, ShipperID, ShipperName FROM employees
NATURAL JOIN shippers;

SELECT c.CustomerID, c.CustomerName, s.ShipperID, s.ShipperName,
    LEFT(c.CustomerName,3) AS FirstThreeCharacters
FROM customers c
CROSS JOIN orders o
CROSS JOIN shippers s
WHERE LEFT(c.CustomerName,3) = LEFT(s.ShipperName,3);

SELECT 
	e1.EmployeeID AS Employee1ID,
    e1.FirstName AS Employee1Name,
    e2.EmployeeID AS Employee2ID,
    e2.FirstName AS Employee2Name
FROM employees e1
CROSS JOIN employees e2
WHERE e1.EmployeeID < e2.EmployeeID;

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