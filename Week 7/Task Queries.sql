SELECT ProductName
FROM products
WHERE ProductID NOT IN (SELECT ProductID FROM orderdetails);

SELECT CustomerName
FROM customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM orders);

SELECT SupplierName
FROM suppliers
WHERE SupplierID IN (
    SELECT SupplierID 
    FROM products 
    WHERE CategoryID = (SELECT CategoryID FROM categories WHERE CategoryName = 'Seafood')
);

SELECT CustomerName
FROM customers
WHERE City IN (SELECT City FROM suppliers);

SELECT ProductName, CategoryID
FROM products p1
WHERE Price = (
    SELECT MAX(Price) 
    FROM products p2 
    WHERE p1.CategoryID = p2.CategoryID
);

SELECT OrderID
FROM orders
WHERE OrderID IN (
    SELECT OrderID 
    FROM orderdetails 
    GROUP BY OrderID 
    HAVING SUM(Quantity) > 100
);

SELECT SupplierName
FROM suppliers
WHERE Country IN (SELECT Country FROM customers);

SELECT FirstName, LastName
FROM employees
WHERE EmployeeID IN (
    SELECT EmployeeID 
    FROM orders 
    GROUP BY EmployeeID 
    HAVING COUNT(DISTINCT CustomerID) > 5
);