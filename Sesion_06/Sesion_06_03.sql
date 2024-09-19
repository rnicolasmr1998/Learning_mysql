-- Actividad: Ejercicios Complementarios
/*
-- 1. Muestra el nombre y apellido de los empleados que 
pertenecen al departamento de "Recursos Humanos" y han 
realizado más de 5 ventas.
*/
SELECT emp.nombre 'nombre_empleado', 
	   emp.apellido 'apellido_empleado',
       COUNT(vent.id) 'cantidad_ventas'
FROM empleados `emp`
INNER JOIN departamentos `dep`
	ON emp.departamento_id = dep.id
INNER JOIN ventas `vent`
	ON vent.empleado_id = emp.id
GROUP BY emp.id
	HAVING COUNT(vent.id) > 5
ORDER BY COUNT(vent.id) DESC;

/*
-- 2. Muestra el nombre y apellido de todos los empleados 
junto con la cantidad total de ventas que han realizado, 
incluso si no han realizado ventas.
*/
SELECT emp.nombre 'nombre_empleado',
	   emp.apellido 'apellido_empleado',
       COUNT(vent.id) 'cantidad_ventas'
FROM empleados `emp`
LEFT JOIN ventas `vent`
	ON vent.empleado_id = emp.id
GROUP BY emp.id
ORDER BY COUNT(vent.id) DESC;

/*
-- 3. Encuentra el empleado más joven de cada departamento 
y muestra el nombre del departamento junto con el nombre 
y la edad del empleado más joven.
*/
SELECT dep.nombre 'nombre_departamento',
	   emp.nombre 'nombre_empleado',
       emp.apellido 'apellido_empleado',
       emp.edad 'edad_empleado'
FROM empleados `emp`
INNER JOIN departamentos `dep`
	ON emp.departamento_id = dep.id
WHERE emp.edad = (SELECT MIN(e.edad)
				  FROM empleados `e`
                  WHERE e.departamento_id = emp.departamento_id)
ORDER BY emp.edad DESC;

/*
-- 4. Calcula el volumen de productos vendidos por cada 
producto (por ejemplo, menos de 5 como "bajo", entre 5 
y 10 como "medio", y más de 10 como "alto") y muestra 
la categoría de volumen junto con la cantidad y el 
nombre del producto.
*/
SELECT prod.nombre 'nombre_producto',
	   SUM(vent.cantidad) 'volumen_vendido',
	   CASE
			WHEN SUM(vent.cantidad) > 10 THEN 'alto'
            WHEN SUM(vent.cantidad) >= 5 THEN 'medio'
            ELSE 'bajo'
       END 'categoria_volumen'
FROM productos `prod`
LEFT JOIN ventas `vent`
	ON prod.id = vent.producto_id
GROUP BY prod.id
ORDER BY SUM(vent.cantidad) DESC;

