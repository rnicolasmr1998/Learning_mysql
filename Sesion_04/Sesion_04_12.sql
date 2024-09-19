-- Ejercicios Función AVG()
/*
Esta función retorna el promedio de una columna.
-- Sin agrupación
SELECT AVG(nombre_de_la_columna) 
FROM tabla_origen;

-- Con agrupación
SELECT AVG(nombre_de_la_columna) 
FROM tabla_origen 
GROUP BY nombres_de_las_columnas_por_la_cual_agrupar; 
*/
-- 1. Calcula el salario promedio de todos los empleados.
USE mi_bd;
SELECT round(AVG(salario), 2) "Salario promedio"
FROM empleados;

-- 2. Calcula el precio unitario promedio de todos los productos.
SELECT round(AVG(precio), 2) "Precio unitario promedio"
FROM productos;

-- 3. Calcula la edad promedio de los empleados.
SELECT round(AVG(edad), 2) "Edad promedio"
FROM empleados;

-- 4. Calcula el precio promedio de productos con un precio superior a $200.
SELECT round(AVG(precio), 2) "Precio promedio"
FROM productos
WHERE precio > 200;

-- 5. Calcula el salario promedio de los empleados en el Departamento 1.
SELECT round(AVG(salario), 2) "Salario promedio"
FROM empleados
WHERE departamento_id = 1;

-- 6. Calcula la cantidad promedio de productos vendidos por empleado.
SELECT empleado_id, round(AVG(cantidad), 2) "Cantidad promedio"
FROM ventas
GROUP BY empleado_id;