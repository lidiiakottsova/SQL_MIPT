USE Northwind
SET STATISTICS IO ON; 
GO 
SET STATISTICS TIME ON; 
GO

SELECT CustomerID FROM Customers
WHERE (CustomerID LIKE 'C%' OR CustomerID LIKE 'D%') AND City LIKE 'B%'
	


CREATE CLUSTERED INDEX CustomClust1 ON Customers (CustomerID)

DROP INDEX CustomClust1 ON Customers

CREATE NONCLUSTERED INDEX CustomNon2 ON Customers (CustomerID, City, Fax)
WHERE Fax IS NOT NULL

DROP INDEX CustomNon2 ON Customers

------------------------------------------------------------------
------------------------------------------------------------------

SELECT OrderID, Customers.CustomerID FROM Customers
	JOIN Orders ON Orders.CustomerID = Customers.CustomerID
		WHERE Country = 'Brazil'
		AND City IN ('Sao Paulo', 'Rio de Janeiro', 'Resende')
		AND ShippedDate IS NOT NULL


CREATE UNIQUE CLUSTERED INDEX OrdersClust ON Orders (OrderID)

CREATE CLUSTERED INDEX CustClust ON Customers (CustomerID)

CREATE NONCLUSTERED INDEX CustBrazil ON Customers (Country, City)
INCLUDE (CustomerID)
	WHERE Country = 'Brazil'

DROP INDEX OrdersClust ON Orders
DROP INDEX CustClust ON Customers
DROP INDEX CustBrazil ON Customers

--------------------------------------------------------------------
--------------------------------------------------------------------

SELECT CompanyName, Quantity, Discount, CategoryID FROM Products
	JOIN [Order Details] ON [Order Details].ProductID = Products.ProductID
	JOIN Orders ON Orders.OrderID = [Order Details].OrderID
	JOIN Customers ON Customers.CustomerID = Orders.CustomerID
	WHERE ReorderLevel = 0
	AND [Order Details].UnitPrice > 20 AND [Order Details].UnitPrice < 25
	AND Customers.CustomerID LIKE 'A%'
	ORDER BY CompanyName


CREATE UNIQUE CLUSTERED INDEX OrdClust0 ON Orders (OrderID)

CREATE NONCLUSTERED INDEX CustNON ON Customers (CustomerID)
INCLUDE (CompanyName)

CREATE NONCLUSTERED INDEX ProdNON ON Products (ReorderLevel)
INCLUDE (ProductID, CategoryID)
	WHERE ReorderLevel = 0

CREATE NONCLUSTERED INDEX OrderNON ON [Order Details] (UnitPrice)
INCLUDE (ProductID, OrderID)
	WHERE UnitPrice > 20 AND UnitPrice < 25


DROP INDEX OrderNON ON [Order Details]
DROP INDEX CustNON ON Customers
DROP INDEX OrdClust0 ON Orders
DROP INDEX ProdNON ON Products
