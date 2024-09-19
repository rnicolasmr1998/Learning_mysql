-- Ejercicios de la Función COUNT()
/*
Esta función retorna el número de filas de una columna.
-- Sin agrupación
SELECT COUNT(nombre_de_la_columna) 
FROM tabla_origen;

-- Con agrupación
SELECT COUNT(nombre_de_la_columna) 
FROM tabla_origen 
GROUP BY nombres_de_las_columnas_por_la_cual_agrupar; 
*/
-- 1. Cuenta cuántos empleados hay en total.
USE mi_bd;
SELECT COUNT(id) 
FROM empleados;

-- 2. Cuenta cuántas ventas se han realizado.
SELECT COUNT(id) 
FROM ventas;

-- 3. Cuenta cuántos productos tienen un precio superior a $500.
SELECT COUNT(id) 
FROM productos
WHERE precio > 500;

-- 4. Cuenta cuántos clientes tienen la palabra "López" en su nombre.
SELECT COUNT(*) 
FROM clientes
WHERE nombre LIKE "%López%";

-- 5. Cuenta cuántas ventas fueron realizadas por el empleado con el id 9 .
SELECT COUNT(*) 
FROM ventas
WHERE empleado_id = 9;

-- 6. Cuenta cuántos productos tienen un nombre que contiene la palabra "Digital".
SELECT COUNT(*) 
FROM productos
WHERE nombre LIKE "%Digital%";