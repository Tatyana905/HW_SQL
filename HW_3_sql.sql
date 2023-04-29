CREATE DATABASE HW_03_sql;

USE HW_03_sql;

CREATE TABLE staff (
    id_staff MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(60) NOT NULL,
    post VARCHAR(50) NOT NULL,
    seniority TINYINT UNSIGNED,
    salary DECIMAL(8 , 2 ),
    age TINYINT UNSIGNED
);
    
INSERT INTO staff(firstname, lastname, post, seniority, salary, age)
VALUES
	('Вася', 'Петров', 'Начальник', 40, 100000, 60),
    ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
    ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
    ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
    ('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
    ('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
	('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
	('Антон', 'Антонов', 'Рабочий', 8, 19000, 28);
    
INSERT INTO staff(firstname, lastname, post, seniority, salary, age)
VALUES    
	('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
	('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
	('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
	('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

SELECT * FROM staff;

# Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
SELECT * FROM staff
ORDER BY salary DESC;

SELECT * FROM staff
ORDER BY salary;

# 2. Выведите 5 максимальных заработных плат (saraly)
SELECT * FROM staff
ORDER BY salary DESC
LIMIT 5;

# 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT post, sum(salary) AS sum_salary
FROM staff
GROUP BY post;

# 4. Найдите кол-во сотрудников с специальностью (post) « Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT count(post) 
FROM staff
where post = 'Рабочий' and age between 23 and 50;

# 5. Найдите количество специальностей
SELECT count(distinct(post)) FROM staff;

# 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT post, avg(age) AS avg_age
FROM staff
GROUP BY post
having avg_age < 30;
