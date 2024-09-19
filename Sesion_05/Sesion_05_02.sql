-- Ejercicios consultas multitabla - Parte 2 
/*
-- 1. Calcular el monto total de ventas por departamento y mostrar el 
nombre del departamento junto con el monto total de ventas.
*/
USE mi_bd;
SELECT dep.nombre 'nombre_departamento', SUM(vent.monto_total) 'ventas_totales'
FROM ventas `vent`, departamentos `dep`, empleados `emp`
WHERE vent.empleado_id = emp.id AND emp.departamento_id = dep.id
GROUP BY emp.departamento_id;

/*
-- 2. Encontrar el empleado más joven de cada departamento y mostrar el 
nombre del departamento junto con la edad del empleado más joven.
*/
SELECT dep.nombre 'nombre_departamento', MIN(emp.edad) 'menor_edad_trabajador'
FROM empleados `emp`, departamentos `dep`
WHERE emp.departamento_id = dep.id
GROUP BY emp.departamento_id;

/*
-- 3. Calcular el volumen de productos vendidos por cada producto (por 
ejemplo, menos de 5 “bajo”, menos 8 “medio” y mayor o igual a 8 “alto”) 
y mostrar la categoría de volumen junto con la cantidad y el nombre del 
producto.
*/
SELECT prod.nombre 'nombre_producto',
	CASE
		WHEN SUM(vent.cantidad) >= 8 THEN 'Alto'
        WHEN SUM(vent.cantidad) >= 5 THEN 'Medio'
        ELSE 'Bajo'
    END volumen_ventas
FROM ventas `vent`, productos `prod`
WHERE vent.producto_id = prod.id
GROUP BY vent.producto_id
ORDER BY SUM(vent.cantidad) DESC;

/*
-- 4. Encontrar el cliente que ha realizado el mayor monto total de 
compras y mostrar su nombre y el monto total.
*/
SELECT cli.nombre, SUM(vent.monto_total) 'monto_total_comprado'
FROM ventas `vent`, clientes `cli`
WHERE vent.cliente_id = cli.id
GROUP BY vent.cliente_id
ORDER BY SUM(vent.monto_total) DESC
LIMIT 1;

/*
-- 5. Calcular el precio promedio de los productos vendidos por cada 
empleado y mostrar el nombre del empleado junto con el precio promedio 
de los productos que ha vendido.
*/
SELECT emp.nombre 'nombre_empleado', emp.apellido 'apellido_empleado',
	   round(AVG(vent.precio_unitario), 2) 'precio_promedio_productos'
FROM empleados `emp`, ventas `vent`
WHERE vent.empleado_id = emp.id
GROUP BY vent.empleado_id
ORDER BY precio_promedio_productos DESC;

/*
-- 6. Encontrar el departamento con el salario mínimo más bajo entre 
los empleados y mostrar el nombre del departamento junto con el salario 
mínimo más bajo.
*/
SELECT dep.nombre 'nombre_departamento', MIN(emp.salario) 'salario_minimo'
FROM empleados `emp`, departamentos `dep`
WHERE emp.departamento_id = dep.id
GROUP BY emp.departamento_id
ORDER BY salario_minimo ASC
LIMIT 1;

/*
-- 7. Encuentra el departamento con el salario promedio más alto entre 
los empleados mayores de 30 años y muestra el nombre del departamento 
junto con el salario promedio. Limita los resultados a mostrar solo los 
departamentos con el salario promedio mayor a 3320.
*/
SELECT dep.nombre 'nombre_departamento', 
	   round(AVG(emp.salario), 2) 'salario_promedio'
FROM empleados `emp`, departamentos `dep`
WHERE emp.departamento_id = dep.id AND emp.edad > 30
GROUP BY emp.departamento_id
HAVING salario_promedio > 3320
ORDER BY salario_promedio DESC;
