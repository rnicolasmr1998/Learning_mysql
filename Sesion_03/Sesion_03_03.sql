-- Ejercicios: Cláusula DISTINCT
-- 1. Lista los nombres de los empleados sin duplicados
USE mi_bd;
SELECT DISTINCT nombre
FROM empleados;

-- 2. Obtén una lista de correos electrónicos únicos de todos los empleados.
SELECT DISTINCT correo_electronico
FROM empleados;

-- 3. Encuentra la lista de edades distintas entre los empleados.
SELECT DISTINCT edad
FROM empleados;

-- Ejercicios: Operadores relacionales
-- 1. Muestra los nombres de los empleados que tienen un salario superior a $3200.
SELECT *
FROM empleados
WHERE salario > 3200;

-- 2. Obtén una lista de empleados que tienen 28 años de edad.
SELECT *
FROM empleados
WHERE edad = 28;

-- 3. Lista a los empleados cuyos salarios sean menores a $2700.
SELECT *
FROM empleados
WHERE salario < 2700;

-- 4. Encuentra todas las ventas donde la cantidad de productos vendidos sea mayor que 2.
SELECT *
FROM ventas
WHERE cantidad > 2;

-- 5. Muestra las ventas donde el precio unitario sea igual a $480.00.
SELECT *
FROM ventas
WHERE precio_unitario = 480.00;

-- 6. Obtén una lista de ventas donde el monto total sea menor que $1000.00.
SELECT *
FROM ventas
WHERE monto_total < 1000.00;

-- 7. Encuentra las ventas realizadas por el empleado con el ID 1.
SELECT *
FROM ventas
WHERE empleado_id = 1;

-- Ejercicios: Operadores lógicos
-- 1. Muestra los nombres de los empleados que trabajan en el Departamento 1 y tienen un salario superior a $3000.
SELECT *
FROM empleados
WHERE departamento_id = 1 AND salario > 3000;

-- 2. Lista los empleados que tienen 32 años de edad o trabajan en el Departamento 3.
SELECT *
FROM empleados
WHERE edad = 32 OR departamento_id = 3;

-- 3. Lista las ventas donde el producto sea el ID 1 y la cantidad sea mayor o igual a 2.
SELECT *
FROM ventas
WHERE producto_id = 1 AND cantidad >= 2;

-- 4. Muestra las ventas donde el cliente sea el ID 1 o el empleado sea el ID 2.
SELECT *
FROM ventas
WHERE cliente_id = 1 OR empleado_id = 2;

-- 5. Obtén una lista de ventas donde el cliente sea el ID 2 y la cantidad sea mayor que 2.
SELECT *
FROM ventas
WHERE cliente_id = 2 AND cantidad > 2;

-- 6. Encuentra las ventas realizadas por el empleado con el ID 1 y donde el monto total sea mayor que $2000.00.
SELECT *
FROM ventas
WHERE empleado_id = 1 AND monto_total > 2000;

-- Ejercicios: Cláusula BETWEEN
-- 1. Encuentra a los empleados cuyas edades están entre 29 y 33 años. Muestra el nombre y la edad de los registros que cumplan esa condición. 
SELECT *
FROM empleados
WHERE edad BETWEEN 29 AND 33;

-- 2. Encuentra las ventas donde la cantidad de productos vendidos esté entre 2 y 3.
SELECT *
FROM ventas
WHERE cantidad BETWEEN 2 AND 3;

-- 3. Muestra las ventas donde el precio unitario esté entre $300.00 y $500.00.
SELECT *
FROM ventas
WHERE precio_unitario BETWEEN 300 AND 500;