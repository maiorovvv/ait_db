//Вывести название и стоимость в USD одного самого дорогого проданного товара (не используя агрегацию)
SELECT DISTINCT Products.ProductName, Products.Price*1.05 AS Price_USD FROM [OrderDetails]
LEFT JOIN Products ON OrderDetails.ProductID = Products.ProductID
ORDER BY Price DESC
LIMIT 1

//Вывести два самых дорогих товара из категории Beverages из USA
SELECT * FROM [Products]
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
Where CategoryName = 'Beverages'
ORDER BY Price DESC
LIMIT 2

//Удалить товары с ценой менее 50 EUR
DELETE FROM [Products]
WHERE Price < 50

//Вывести список стран, которые поставляют морепродукты
SELECT DISTINCT Country FROM [Customers]
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN [OrderDetails] ON Orders.OrderID = [OrderDetails].OrderID
LEFT JOIN Products ON [OrderDetails].ProductID = Products.ProductID
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
Where CategoryName = 'Seafood'

//Очистить поле ContactName у всех клиентов не из China
UPDATE [Customers]
SET
	ContactName = ''
Where NOT City = 'China'
