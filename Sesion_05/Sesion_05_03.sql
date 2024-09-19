-- Ejercicios Complementarios
/*
-- 1. Encontrar la cantidad de productos vendidos por cada empleado 
y mostrar el nombre del empleado junto con la cantidad de 
productos vendidos.
*/
USE mi_bd;
SELECT emp.nombre, emp.apellido, SUM(vent.cantidad) 'volumen_vendido'
FROM ventas `vent`, empleados `emp`
WHERE vent.empleado_id = emp.id
GROUP BY vent.empleado_id
ORDER BY volumen_vendido DESC;

/*
-- 2. Calcular el monto total de ventas por cada cliente y mostrar 
el nombre del cliente junto con el monto total de sus compras.
*/
SELECT cli.nombre 'nombre_cliente', SUM(vent.monto_total) 'total_compras'
FROM ventas `vent`, clientes `cli`
WHERE vent.cliente_id = cli.id
GROUP BY vent.cliente_id
ORDER BY total_compras DESC;

/*
-- 3. Encontrar el producto más caro vendido y mostrar su nombre y 
precio.
*/
SELECT DISTINCT prod.nombre, vent.precio_unitario
FROM ventas `vent`, productos `prod`
WHERE vent.producto_id = prod.id
ORDER BY vent.precio_unitario DESC
LIMIT 1;

/*
-- 4. Calcular el salario promedio de los empleados en cada 
departamento y mostrar el nombre del departamento junto con el 
salario promedio.
*/
SELECT dep.nombre 'nombre_departamento', round(AVG(emp.salario), 2) 'salario_promedio'
FROM empleados `emp`, departamentos `dep`
WHERE emp.departamento_id = dep.id
GROUP BY dep.id
ORDER BY salario_promedio DESC;

/*
-- 5. Encontrar la cantidad total de ventas realizadas por cada 
empleado y mostrar el nombre y apellido del empleado junto con la 
cantidad total de ventas.
*/
SELECT emp.nombre 'nombre_empleado', emp.apellido 'apellido_empleado', 
	   SUM(vent.cantidad) 'volumen_ventas'
FROM ventas `vent`, empleados `emp`
WHERE vent.empleado_id = emp.id
GROUP BY emp.id
ORDER BY volumen_ventas DESC;

/*
-- 6. Encuentra la cantidad de ventas realizadas por cada empleado y 
muestra el nombre y apellido del empleado junto con la cantidad total 
de ventas. Limita los resultados a mostrar solo a los empleados que 
hayan realizado más de 5 ventas y ordenarlos de forma descendente con 
respecto a la cantidad de ventas.
*/
SELECT emp.nombre 'nombre_empleado', emp.apellido 'apellido_empleado', 
	   SUM(vent.cantidad) 'volumen_ventas'
FROM ventas `vent`, empleados `emp`
WHERE vent.empleado_id = emp.id
GROUP BY emp.id
HAVING volumen_ventas > 5
ORDER BY volumen_ventas DESC;

/*
-- 7. Calcula el monto total vendido por cada empleado y muestra el 
nombre del empleado junto con el monto total. Usa la cláusula HAVING 
para filtrar a aquellos empleados que hayan vendido más de 10 productos 
en total. Muestra el resultado en orden descendente según el monto total 
vendido.
*/
SELECT emp.nombre 'nombre_empleado', emp.apellido 'apellido_empleado', 
	   SUM(vent.monto_total) 'monto_total_ventas'
FROM ventas `vent`, empleados `emp`
WHERE vent.empleado_id = emp.id
GROUP BY emp.id
HAVING SUM(vent.cantidad) > 10
ORDER BY monto_total_ventas DESC;

/*
-- 8. Encuentra el monto total vendido a cada cliente y muestra el nombre 
del cliente junto con el monto total. Usa la cláusula HAVING para filtrar 
a aquellos clientes cuyo monto total promedio en sus compras sea superior 
a $1500. Muestra el resultado en orden descendente según el monto total 
vendido.
*/
SELECT cli.nombre 'nombre_cliente', 
	   SUM(vent.monto_total) 'monto_total_compra'
FROM ventas `vent`, clientes `cli`
WHERE vent.cliente_id = cli.id
GROUP BY cli.id
HAVING AVG(vent.monto_total) > 1500
ORDER BY monto_total_compra DESC;

/*
-- 9. Calcula la cantidad total de ventas realizadas a cada cliente y 
muestra el nombre del cliente junto con la cantidad total de ventas. 
Limita los resultados a mostrar solo a los clientes que hayan realizado 
más de 3 ventas ordénalos de forma descendente según la cantidad de ventas.
*/
SELECT cli.nombre 'nombre_cliente', 
	   SUM(vent.cantidad) 'volumen_compra'
FROM ventas `vent`, clientes `cli`
WHERE vent.cliente_id = cli.id
GROUP BY cli.id
HAVING volumen_compra > 3
ORDER BY volumen_compra DESC;

/*
-- 10. Encuentra los productos más caros vendidos (precio mayor a 1000), 
muestra su nombre y precio y ordenarlos de forma descendente por precio.
*/
SELECT DISTINCT pro.nombre 'nombre_producto', vent.precio_unitario
FROM ventas `vent`, productos `pro`
WHERE vent.cliente_id = pro.id AND vent.precio_unitario > 1000
ORDER BY vent.precio_unitario DESC;