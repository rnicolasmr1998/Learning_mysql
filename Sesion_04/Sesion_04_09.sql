-- Ejercicios Función MIN()
/*
Esta función retorna el valor más pequeño de una columna.
-- Sin agrupación
SELECT MIN(nombre_de_la_columna) 
FROM tabla_origen;

-- Con agrupación
SELECT MIN(nombre_de_la_columna) 
FROM tabla_origen 
GROUP BY nombres_de_las_columnas_por_la_cual_agrupar;
*/
-- 1. Encuentra el salario mínimo de todos los empleados.
USE mi_bd;
SELECT MIN(salario)
FROM empleados;

-- 2. Encuentra la cantidad mínima de productos vendidos en una sola venta.
SELECT MIN(cantidad)
FROM ventas;

-- 3. Encuentra la edad mínima de los empleados.
SELECT MIN(edad)
FROM empleados;

-- 4. Encuentra el precio mínimo de un producto.
SELECT MIN(precio)
FROM productos;

-- 5. Encuentra el monto total mínimo de una venta.
SELECT MIN(monto_total)
FROM ventas;

-- 6. Encuentra el ID de cliente con el valor mínimo.
SELECT MIN(id)
FROM clientes;