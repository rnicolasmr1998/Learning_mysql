-- Ejercicios cláusula LIMIT
/*
La cláusula LIMIT se utiliza para limitar el número de filas que se devuelven en el
resultado de una consulta. Esto es útil cuando se desea obtener sólo un número
específico de registros de una tabla.
SELECT * 
FROM nombre_tabla 
LIMIT cantidad_filas;
*/
-- 1. Muestra los 5 productos más caros de la tabla "productos".
USE mi_bd;
SELECT * 
FROM productos
ORDER BY precio DESC
LIMIT 5;

-- 2. Muestra los 10 primeros empleados en orden alfabético por apellido.
SELECT * 
FROM empleados
ORDER BY apellido ASC
LIMIT 10;

-- 3. Muestra las 3 ventas con el monto total más alto.
SELECT * 
FROM ventas
ORDER BY monto_total DESC
LIMIT 3;

-- 4. Muestra los 5 clientes con los IDs más bajos.
SELECT * 
FROM clientes
ORDER BY id ASC
LIMIT 5;

-- 5. Muestra los 3 productos más vendidos.
SELECT producto_id, SUM(cantidad) "cantidad_productos" 
FROM ventas
GROUP BY producto_id
ORDER BY cantidad_productos DESC
LIMIT 3;

-- 6. Muestra los 5 empleados más jóvenes.
SELECT * 
FROM empleados
ORDER BY edad ASC
LIMIT 5;