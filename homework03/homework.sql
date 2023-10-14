//Вывести ко-во поставщиков не из UK и не из China
SELECT Count(SupplierID) AS Count_supliers FROM [Suppliers]
WHERE NOT Country IN ('UK','China') 
//RESULT: 27

//Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5
SELECT 
ROUND(AVG(Price),2) AS avg_price,
MAX(Price) AS max_price,
MIN(Price) AS min_price,
Count(Price) AS count_product
FROM [Products]
WHERE CategoryID IN (3,5)

//RESULT
//avg_price	max_price	min_price	count_product
//  23.44	    81	        7	        20

//Вывести общую сумму проданных товаров
SELECT
	SUM(Quantity*Price)
FROM OrderDetails
LEFT JOIN Products ON OrderDetails.ProductID = Products.ProductID
//RESULT: 386424.23

//Вывести данные о заказах (номер_заказа, имя_клиента, страна_клиента, фамилия_менеджера, название_компании_перевозчика)
SELECT 
Orders.OrderID,
Customers.CustomerName,
Customers.Country,
Employees.LastName,
Shippers.ShipperName
FROM Orders
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
LEFT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID

//Вывести сумму, на которую было отправлено товаров клиентам в Germany
SELECT ROUND(SUM(OrderDetails.Quantity*Products.Price),2) AS de_sales 
FROM Orders
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
LEFT JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
LEFT JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE
Customers.Country = 'Germany' 

//RESULT: 47241.82