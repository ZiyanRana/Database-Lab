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

