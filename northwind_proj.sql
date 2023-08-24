USE Ten
SET STATISTICS IO ON; 
GO 
SET STATISTICS TIME ON; 
GO

SELECT CustomerID FROM Customers
WHERE (CustomerID LIKE 'C%' OR CustomerID LIKE 'D%') AND City LIKE 'B%'
	AND Fax IS NOT NULL

/*
   Время ЦП = 311 мс, затраченное время = 293 мс.
*/

CREATE CLUSTERED INDEX CustomClust1 ON Customers (CustomerID)
/*
   Время ЦП = 16 мс, затраченное время = 112 мс.
*/
DROP INDEX CustomClust1 ON Customers

CREATE NONCLUSTERED INDEX CustomNon2 ON Customers (CustomerID, City, Fax)
WHERE Fax IS NOT NULL
/*
   Время ЦП = 16 мс, затраченное время = 128 мс.
*/
DROP INDEX CustomNon2 ON Customers

------------------------------------------------------------------
------------------------------------------------------------------

SELECT OrderID, Customers.CustomerID FROM Customers
	JOIN Orders ON Orders.CustomerID = Customers.CustomerID
		WHERE Country = 'Brazil'
		AND City IN ('Sao Paulo', 'Rio de Janeiro', 'Resende')
		AND ShippedDate IS NOT NULL
/*
   Время ЦП = 406 мс, затраченное время = 3573 мс.
*/

CREATE UNIQUE CLUSTERED INDEX OrdersClust ON Orders (OrderID)

CREATE CLUSTERED INDEX CustClust ON Customers (CustomerID)

CREATE NONCLUSTERED INDEX CustBrazil ON Customers (Country, City)
INCLUDE (CustomerID)
	WHERE Country = 'Brazil'
/*
   Время ЦП = 265 мс, затраченное время = 2674 мс.
*/
DROP INDEX OrdersClust ON Orders
DROP INDEX CustClust ON Customers
DROP INDEX CustBrazil ON Customers

--------------------------------------------------------------------
--------------------------------------------------------------------

SELECT CompanyName, Quantity, Discount, CategoryID FROM Products
	JOIN OrderDetails ON OrderDetails.ProductID = Products.ProductID
	JOIN Orders ON Orders.OrderID = OrderDetails.OrderID
	JOIN Customers ON Customers.CustomerID = Orders.CustomerID
	WHERE ReorderLevel = 0
	AND OrderDetails.UnitPrice > 20 AND OrderDetails.UnitPrice < 25
	AND Customers.CustomerID LIKE 'A%'
	ORDER BY CompanyName
/*
   Время ЦП = 392 мс, затраченное время = 539 мс.
*/

CREATE UNIQUE CLUSTERED INDEX OrdClust0 ON Orders (OrderID)

CREATE NONCLUSTERED INDEX CustNON ON Customers (CustomerID)
INCLUDE (CompanyName)

CREATE NONCLUSTERED INDEX ProdNON ON Products (ReorderLevel)
INCLUDE (ProductID, CategoryID)
	WHERE ReorderLevel = 0

CREATE NONCLUSTERED INDEX OrderNON ON OrderDetails (UnitPrice)
INCLUDE (ProductID, OrderID)
	WHERE UnitPrice > 20 AND UnitPrice < 25
/*
   Время ЦП = 124 мс, затраченное время = 346 мс.
*/

DROP INDEX OrderNON ON OrderDetails
DROP INDEX CustNON ON Customers
DROP INDEX OrdClust0 ON Orders
DROP INDEX ProdNON ON Products
