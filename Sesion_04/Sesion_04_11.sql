-- Ejercicios de la Función SUM()
/*
Esta función retorna la suma del numero de filas de una columna.
-- Sin agrupación
SELECT SUM(nombre_de_la_columna) 
FROM tabla_origen;

-- Con agrupación
SELECT SUM(nombre_de_la_columna) 
FROM tabla_origen 
GROUP BY nombres_de_las_columnas_por_la_cual_agrupar; 
*/
-- 1. Calcula la suma total de salarios de todos los empleados.
USE mi_bd;
SELECT SUM(salario) 
FROM empleados;

-- 2. Calcula la suma total de montos vendidos en todas las ventas.
SELECT SUM(monto_total) 
FROM ventas;

-- 3. Calcula la suma de precios de productos con ID par.
SELECT SUM(precio) "Suma de precios pares"
FROM productos
WHERE id % 2 = 0;

/*
Otra forma de hacerlo es:
SELECT SUM(precio) "Suma de precios pares"
FROM productos
WHERE mod(id, 2) = 0;
*/

-- 4. Calcula la suma de cantidades de productos vendidos por empleado.
SELECT SUM(cantidad) 
FROM ventas 
GROUP BY empleado_id; 

-- 5. Calcula la suma de salarios de empleados en el Departamento 1.
SELECT SUM(salario) 
FROM empleados 
WHERE departamento_id = 1; 

-- 6. Calcula la suma de precios de productos vendidos al cliente con id 2.
SELECT SUM(precio_unitario) 
FROM ventas 
WHERE cliente_id = 2; 