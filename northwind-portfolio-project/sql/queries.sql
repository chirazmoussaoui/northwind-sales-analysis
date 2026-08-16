-- ============================================
-- Northwind Database - Portfolio SQL Queries
-- Author: Chiraz Moussaoui
-- Database: northwind.db (SQLite)
-- ============================================

-- Q1: Top 10 customers by number of orders
SELECT c.CompanyName, COUNT(o.OrderID) AS NumOrders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName
ORDER BY NumOrders DESC
LIMIT 10;

-- Q2: Top 10 customers by total revenue
SELECT c.CompanyName, 
       ROUND(SUM(od.UnitPrice * od.Quantity), 2) AS TotalRevenue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN "Order Details" od ON o.OrderID = od.OrderID
GROUP BY c.CompanyName
ORDER BY TotalRevenue DESC
LIMIT 10;

-- Q3: Products priced above their category average (Correlated Subquery)
SELECT ProductName, CategoryID, UnitPrice
FROM Products p1
WHERE UnitPrice > (
    SELECT AVG(UnitPrice)
    FROM Products p2
    WHERE p2.CategoryID = p1.CategoryID
);

-- Q4: Customers with zero orders (NOT EXISTS)
SELECT CompanyName
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1 FROM Orders o
    WHERE o.CustomerID = c.CustomerID
);

-- Q5: Product price ranking within each category (Window Functions)
SELECT ProductName, CategoryID, UnitPrice,
       ROW_NUMBER() OVER (PARTITION BY CategoryID ORDER BY UnitPrice DESC) AS RN,
       RANK() OVER (PARTITION BY CategoryID ORDER BY UnitPrice DESC) AS RK,
       DENSE_RANK() OVER (PARTITION BY CategoryID ORDER BY UnitPrice DESC) AS DRK
FROM Products;

-- Q6: Top-priced product per category (CTE)
WITH RankedProducts AS (
    SELECT ProductName, CategoryID, UnitPrice,
           RANK() OVER (PARTITION BY CategoryID ORDER BY UnitPrice DESC) AS PriceRank
    FROM Products
)
SELECT * FROM RankedProducts WHERE PriceRank = 1;

-- Q7: Total price per category + grand total (ROLLUP alternative via UNION ALL)
SELECT CategoryID, SUM(UnitPrice) AS TotalPrice
FROM Products
GROUP BY CategoryID

UNION ALL

SELECT NULL AS CategoryID, SUM(UnitPrice) AS TotalPrice
FROM Products;

-- Q8: Query optimization example
-- Before: full table scan
EXPLAIN QUERY PLAN
SELECT * FROM Orders WHERE CustomerID = 'ALFKI';

-- Index to speed up lookups by CustomerID
CREATE INDEX idx_orders_customerid ON Orders(CustomerID);