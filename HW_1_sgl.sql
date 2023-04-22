SELECT product_name, manufacturer, price 
FROM hw_1_sql.mobile_phone 
WHERE product_count > 2;

SELECT product_name 
FROM hw_1_sql.mobile_phone 
WHERE product_name 
LIKE "iPhone%";

SELECT product_name 
FROM hw_1_sql.mobile_phone 
WHERE manufacturer 
LIKE "Samsung%";

SELECT product_name
FROM hw_1_sql.mobile_phone 
WHERE product_name 
LIKE "%8%";

SELECT product_name
FROM hw_1_sql.mobile_phone 
WHERE product_name 
RLIKE '[0-9]';