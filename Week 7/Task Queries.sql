SELECT ProductName
FROM products
WHERE ProductID NOT IN 
	(SELECT ProductID 
    FROM orderdetails);
    
SELECT CustomerName
FROM customers
WHERE CustomerID NOT IN 
	(SELECT CustomerID 
    FROM orders);
    
SELECT SupplierName
FROM suppliers
WHERE SupplierID IN 
	(SELECT SupplierID
    FROM products
    WHERE CategoryID = 8);

SELECT CustomerName
FROM customers
WHERE city IN 
	(SELECT city
    FROM suppliers);

SELECT ProductName, CategoryID
FROM products
WHERE Price IN
	(SELECT max(Price)
    FROM products
    GROUP BY CategoryID)
ORDER BY CategoryID;

SELECT OrderID   
FROM    
	(SELECT OrderID, SUM(Quantity) AS TotalQty   
	FROM orderdetails   
	GROUP BY OrderID )
AS OrderTotals WHERE TotalQty > 100;
