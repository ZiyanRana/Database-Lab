USE northwind;

SELECT Country, COUNT(CustomerID) AS Total_Customers
FROM customers
GROUP BY Country;

SELECT c.CategoryID, c.CategoryName, COUNT(p.ProductID) AS Total_Products
FROM categories c
JOIN products p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName;

SELECT e.EmployeeID, e.LastName, COUNT(o.OrderID) AS Total_Orders
FROM employees e
JOIN orders o
ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.LastName;

SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS Total_Quantity
FROM products p
JOIN orderdetails od
ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName;

SELECT s.ShipperID, s.ShipperName, COUNT(o.OrderID) AS Total_Orders
FROM shippers s
JOIN orders o
ON s.ShipperID = o.ShipVia
GROUP BY s.ShipperID, s.ShipperName;

SELECT c.CustomerID, c.CustomerName, COUNT(o.OrderID) AS Total_Orders
FROM customers c
JOIN orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(o.OrderID) > 5;

SELECT p.ProductID, p.ProductName, AVG(od.Quantity) AS Avg_Quantity
FROM products p
JOIN orderdetails od
ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName;

SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS Total_Quantity
FROM products p
JOIN orderdetails od
ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY Total_Quantity DESC;