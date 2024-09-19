-- Ejercicios cláusula IN
/*
La cláusula IN se utiliza para filtrar resultados en base a un conjunto de valores.
Es especialmente útil cuando se quiere realizar una búsqueda en base a varios
valores posibles en una columna.
SELECT * 
FROM nombre_tabla 
WHERE nombre_columna IN (valor1, valor2, valor3);
*/
-- 1. Encuentra los empleados cuyos IDs son 2, 3 o 5.
USE mi_bd;
SELECT * 
FROM empleados
WHERE id IN (2, 3, 5);

-- 2. Busca los productos con IDs 2, 4 o 6 en la tabla de productos.
SELECT * 
FROM productos
WHERE id IN (2, 4, 6);

-- 3. Encuentra las ventas que tienen los clientes con IDs 1, 3 o 5.
SELECT * 
FROM clientes
WHERE id IN (1, 3, 5);

-- 4. Busca los empleados que trabajan en los departamentos 2 o 3.
SELECT * 
FROM empleados
WHERE departamento_id IN (2, 3);

-- 5. Busca los productos cuyos precios son 350.00, 480.00 o 800.00.
SELECT * 
FROM productos
WHERE precio IN (350.00, 480.00, 800.00);