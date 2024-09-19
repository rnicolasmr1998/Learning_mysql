-- Ejercicios cláusula ORDER BY
/*
La cláusula ORDER BY se utiliza para ordenar los resultados de una consulta según
el valor de una o más columnas.
SELECT * 
FROM nombre_tabla 
ORDER BY columna_1 ASC/DESC, columna_2 ASC/DESC;
*/
-- 1. Ordena los empleados por salario de manera ascendente.
USE mi_bd;
SELECT * 
FROM empleados
ORDER BY salario ASC;

-- 2. Ordena los productos por nombre de manera descendente.
SELECT * 
FROM productos
ORDER BY nombre DESC;

-- 3. Ordena las ventas por cantidad de manera ascendente y luego por precio_unitario de manera descendente.
SELECT * 
FROM ventas
ORDER BY cantidad ASC, precio_unitario DESC;

-- 4. Ordena los clientes por nombre de manera ascendente y luego por dirección de manera descendente.
SELECT * 
FROM clientes
ORDER BY nombre ASC, direccion DESC;

-- 5. Ordena los empleados por fecha_contratación de manera descendente.
SELECT * 
FROM empleados
ORDER BY fecha_contratacion DESC;

-- 6. Ordena los productos por precio de manera ascendente.
SELECT * 
FROM productos
ORDER BY precio ASC;