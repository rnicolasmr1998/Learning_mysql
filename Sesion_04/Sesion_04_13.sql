-- Ejercicios GROUP BY()
/*
La cláusula GROUP BY especifica una consulta sumaria. En lugar de producir una
fila de resultados por cada fila de datos de la base de datos, una consulta
sumaria agrupa todas las filas similares y luego produce una fila sumaria de
resultados para cada grupo de los nombres de columnas enunciados en esta
cláusula.
En otras palabras, esta cláusula permite agrupar un conjunto de columnas con
valores repetidos y utilizar las funciones de agregación sobre las columnas con
valores no repetidos. Esta cláusula puede omitirse.
SELECT nombres_de_las_columnas 
FROM tabla_origen 
GROUP BY nombres_de_las_columnas_por_la_cual_agrupar;
*/
-- 1. Agrupa las ventas por empleado y muestra la cantidad total de ventas realizadas por cada empleado.
USE mi_bd;
SELECT empleado_id, COUNT(*) AS total_ventas
FROM ventas
GROUP BY empleado_id
ORDER BY total_ventas DESC;

-- 2. Agrupa los productos por precio y muestra la cantidad de productos con el mismo precio.
SELECT precio, COUNT(*) cantidad_productos
FROM productos 
GROUP BY precio
ORDER BY cantidad_productos DESC;

-- 3. Agrupa los empleados por departamento y muestra la cantidad de empleados en cada departamento.
SELECT departamento_id, COUNT(*) cantidad_empleados
FROM empleados 
GROUP BY departamento_id
ORDER BY cantidad_empleados DESC;

-- 4. Agrupa las ventas por cliente y muestra el monto total gastado por cada cliente.
SELECT cliente_id, SUM(monto_total) monto_total
FROM ventas
GROUP BY cliente_id
ORDER BY monto_total DESC;

-- 5. Encuentra el salario máximo por departamento.
SELECT departamento_id, MAX(salario) salario_maximo
FROM empleados
GROUP BY departamento_id
ORDER BY salario_maximo DESC
LIMIT 1;

-- 6. Encuentra el salario mínimo por departamento.
SELECT departamento_id, MIN(salario) salario_minimo
FROM empleados
GROUP BY departamento_id
ORDER BY salario_minimo ASC
LIMIT 1;

-- 7. Obtén la suma total de salarios por departamento.
SELECT departamento_id, SUM(salario) salario_total
FROM empleados
GROUP BY departamento_id
ORDER BY salario_total DESC;

-- 8. Encuentra la cantidad total de productos vendidos por empleado.
SELECT empleado_id, SUM(cantidad) cantidad_total
FROM ventas
GROUP BY empleado_id
ORDER BY cantidad_total DESC;