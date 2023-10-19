//Найти мин/стоимость товаров для каждой категории
SELECT Categories.CategoryName,MIN(Price) AS min_price FROM [Products]
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryID
ORDER BY min_price

//Вывести названия категорий, в которых более 10 товаров
SELECT Categories.CategoryName,COUNT(Products.ProductID) AS count_product FROM [Products]
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryID
HAVING count_product > 10
ORDER BY count_product

//Очистить тел/номер поставщикам из USA
UPDATE Suppliers
SET
       Phone='+1(757) 000-00-00'
WHERE
    Country='USA'

//Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15
SELECT 
Employees.FirstName,
Employees.LastName, 
COUNT(Orders.OrderID) AS count_orders 
FROM [Orders]
LEFT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID
HAVING count_orders < 15

//С помощью инструмента онлайн-проектирования описать схему БД "онлайн-шахматы"
https://dbdiagram.io/d/chess_game-652eec0fffbf5169f0e3fa77

Table users {
  user_id integer
  username varchar(128)
  email varchar(128)
  registration_date timestamp
}

Table games {
  game_id integer
  white_player_id integer
  black_player_id integer
  start_time timestamp
  end_time timestamp
  status varchar(128)
}

Table moves {
  move_id integer
  game_id integer
  player_id integer
  move_text varchar(10)
  move_timestamp timestamp
}

Ref: "games"."game_id" < "moves"."game_id"

Ref: "users"."user_id" < "moves"."player_id"

Ref: "users"."user_id" < "games"."white_player_id"

Ref: "users"."user_id" < "games"."black_player_id"