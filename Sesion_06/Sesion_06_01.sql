-- Ejercicios JOIN Parte 1
/*
-- 1. Encuentra el nombre y apellido de los empleados junto con 
la cantidad total de ventas que han realizado.
*/
USE mi_bd;
SELECT emp.nombre, emp.apellido, SUM(ven.monto_total) AS total_ventas
FROM empleados `emp`
INNER JOIN ventas `ven`
    ON ven.empleado_id = emp.id
GROUP BY emp.nombre, emp.apellido
ORDER BY total_ventas DESC;

/*
-- 2. Calcula el monto total vendido a cada cliente y muestra el 
nombre del cliente, su dirección y el monto total.
*/
SELECT cli.nombre, cli.direccion, SUM(ven.monto_total) AS total_ventas
FROM clientes `cli`
LEFT JOIN ventas `ven`
    ON ven.cliente_id = cli.id
GROUP BY cli.nombre, cli.direccion
ORDER BY total_ventas DESC;

/*
-- 3. Encuentra los productos vendidos por cada empleado en el 
departamento de "Ventas" y muestra el nombre del empleado junto 
con el nombre de los productos que han vendido.
*/
SELECT emp.nombre 'nombre_empleado', emp.apellido 'apellido_empleado', 
	   prod.nombre 'nombre_producto'
FROM empleados `emp`
INNER JOIN departamentos `dep`
	ON emp.departamento_id = dep.id
INNER JOIN ventas `vent`
	ON vent.empleado_id = emp.id
INNER JOIN productos `prod`
	ON vent.producto_id = prod.id
WHERE dep.nombre = "Ventas"
ORDER BY emp.nombre, emp.apellido;

/*
-- 4. Encuentra el nombre del cliente, el nombre del producto 
y la cantidad comprada de productos con un precio superior a $500.
*/
SELECT cli.nombre 'nombre_cliente', prod.nombre 'nombre_producto', 
	   SUM(vent.cantidad) 'cantidad_comprada'
FROM clientes `cli`
INNER JOIN ventas `vent`
	ON vent.cliente_id = cli.id
INNER JOIN productos `prod`
	ON vent.producto_id = prod.id
WHERE vent.precio_unitario > 500
GROUP BY cli.nombre, prod.nombre
ORDER BY cantidad_comprada DESC;