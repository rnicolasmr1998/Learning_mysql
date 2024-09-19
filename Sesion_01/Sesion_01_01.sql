-- 1. Mostrar una lista de los sistemas de bases de datos que tiene mysql
SHOW DATABASES;

-- 2. Seleccionar una base de datos
USE sakila;

-- 3. Mostrar una lista de las tablas de la base de datos seleccionada
SHOW TABLES;

-- 4. Mostrar todas las columnas de una tabla en particular
SELECT * FROM category; 

-- 5. Mostrar algunas columnas de una tabla en particular
SELECT `category_id`, `name` FROM category;
