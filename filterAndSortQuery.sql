
!-- This SQL query retrieves product names, descriptions, and prices from the ProductCatalog table
-- for products in the 'Educational Toys' category that are available, sorted by price in descending order.

SELECT ProductName, Description, Price
FROM ProductCatalog
WHERE Category = 'Educational Toys' AND IsAvailable 
ORDER BY Price DESC

!-- aici IsAvailable este un camp de tip boolean , care functioneaza un boolean in programare, no need for = true