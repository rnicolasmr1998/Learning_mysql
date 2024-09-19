-- Ejercicios JOIN Parte 2
/*
-- 1. Calcula la cantidad de ventas por departamento, incluso 
si el departamento no tiene ventas.
*/
SELECT dep.nombre 'nombre_departamento', COUNT(vent.id) 'cantidad_ventas'
FROM departamentos `dep`
LEFT JOIN empleados `emp`
	ON dep.id = emp.departamento_id
LEFT JOIN ventas `vent`
	ON emp.id = vent.empleado_id
	GROUP BY dep.nombre
ORDER BY COUNT(vent.id) DESC;

/*
-- 2. Encuentra el nombre y la dirección de los clientes que 
han comprado más de 3 productos y muestra la cantidad de 
productos comprados.
*/
SELECT cli.nombre 'nombre_cliente', cli.direccion 'direccion_cliente',
	   COUNT(DISTINCT vent.producto_id) 'cantidad_productos'
FROM clientes `cli`
LEFT JOIN ventas `vent`
	ON cli.id = vent.cliente_id
LEFT JOIN productos `prod`
	ON prod.id = vent.producto_id
GROUP BY cli.nombre, cli.direccion
	HAVING COUNT(DISTINCT vent.producto_id) > 3
ORDER BY COUNT(DISTINCT vent.producto_id) DESC;

/*
-- 3. Calcula el monto total de ventas realizadas por cada 
departamento y muestra el nombre del departamento junto con 
el monto total de ventas.
*/
SELECT dep.nombre 'nombre_departamento', 
	   SUM(vent.monto_total) 'total_ventas'
FROM departamentos `dep`
LEFT JOIN empleados `emp`
	ON emp.departamento_id = dep.id
LEFT JOIN ventas `vent`
	ON vent.empleado_id = emp.id
GROUP BY dep.nombre
ORDER BY SUM(vent.monto_total) DESC;
    
