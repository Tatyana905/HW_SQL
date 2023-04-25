CREATE DATABASE HW_2_sql;

USE HW_2_SQL;

# Используя операторы языка SQL, создайте таблицу “ sales” .
CREATE TABLE sales
	(id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    order_date DATE NOT NULL,
    count_product INT NOT NULL);

#    Заполните ее данными. 
INSERT INTO sales (order_date, count_product)
VALUES
	(DATE '2022-01-01', 156),
    (DATE '2022-01-02', 180),
    (DATE '2022-01-03', 21),
    (DATE '2022-01-04', 124),
    (DATE '2022-01-05', 341);

SELECT * FROM sales;

/* Для данных таблицы “sales” укажите тип 
заказа в зависимости от кол-ва : 
меньше 100 - Маленький заказ
от 100 до 300 - Средний заказ
больше 300 - Большой заказ */
SELECT id, order_date, count_product,
CASE
	when count_product < 100
		then 'Маленький заказ'
	when count_product > 100 and count_product < 300
		then 'Cредний заказ'
	else 'Большой заказ'
END AS 'Тип заказа'
FROM sales;

# Создайте таблицу “ orders” , заполните ее значениями
CREATE TABLE orders
	(id INT PRIMARY KEY NOT NULL,
    employee_id VARCHAR(20) NOT NULL,
    amount FLOAT DEFAULT 0.0,
	order_status VARCHAR (20));

ALTER TABLE orders 
CHANGE id category INT AUTO_INCREMENT;

INSERT INTO orders (employee_id, amount, order_status)
VALUES
	('e03', 15.00, "OPEN"),
    ('e01', 25.50, "OPEN"),
    ('e05', 100.70, "CLOSED"),
    ('e02', 22.18, "OPEN"),
    ('e04', 9.50, "CANCELLED");

SELECT * FROM orders;

/* Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED - «Order is cancelled» */

SELECT employee_id, amount, order_status,
	IF (order_status = "OPEN", '«Order is in open state»',
	IF (order_status = "CLOSED" , 'Order is closed', 'Order is cancelled'))
	AS full_order_status
FROM orders;


/*
Чем 0 отличается от NULL?

Ноль - это значение, константа. А NULL указывает на "пустое место" - объявленую, но не 
инициализированную переменную или объект.

Определение из Википедии:
NULL в СУБД — специальное значение (псевдозначение), которое может быть записано в поле таблицы 
базы данных (БД). NULL соответствует понятию «пустое поле», то есть «поле, не содержащее никакого 
значения». Введено для того, чтобы различать в полях БД пустые (визуально не отображаемые) 
значения (например, строку нулевой длины) и отсутствующие значения (когда в поле не записано 
вообще никакого значения, даже пустого).
NULL означает отсутствие, неизвестность информации. Значение NULL не является значением в полном 
смысле слова: по определению оно означает отсутствие значения и может иметь тип NULL или иметь 
любой другой тип (CREATE TABLE new_tab AS (SELECT NULL) — специальный тип null, 
CREATE TABLE new_table AS (SELECT 10+NULL) — тип integer). Поэтому NULL не равно ни логическому 
значению FALSE, ни пустой строке, ни нулю. При сравнении NULL с любым значением будет получен 
результат NULL, а не FALSE и не 0. Более того, NULL не равно NULL!

*/
    
