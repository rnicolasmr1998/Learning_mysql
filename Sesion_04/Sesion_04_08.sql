-- Ejercicios Función MAX()
/*
Esta función retorna el valor más grande de una columna. 
-- Sin agrupación
SELECT MAX(nombre_de_la_columna) 
FROM tabla_origen;

-- Con agrupación
SELECT MAX(nombre_de_la_columna) 
FROM tabla_origen 
GROUP BY nombres_de_las_columnas_por_la_cual_agrupar; 
*/
-- 1. Encuentra el salario máximo de todos los empleados.
USE mi_bd;
SELECT MAX(salario) 
FROM empleados;

-- 2. Encuentra la cantidad máxima de productos vendidos en una sola venta.
SELECT MAX(cantidad) 
FROM ventas;

-- 3. Encuentra la edad máxima de los empleados.
SELECT MAX(edad) 
FROM empleados;

-- 4. Encuentra el precio máximo de un producto.
SELECT MAX(precio) 
FROM productos;

-- 5. Encuentra el monto total máximo de una venta.
SELECT MAX(monto_total) 
FROM ventas;

-- 6. Encuentra el ID de cliente con el valor máximo.
SELECT MAX(id) 
FROM clientes;