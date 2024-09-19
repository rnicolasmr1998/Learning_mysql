-- Ejercicios consultas multitabla  - Parte 1
/*
Hasta ahora, hemos realizado consultas que afectan a una sola tabla, pero es
posible realizar consultas que combinen datos de múltiples tablas en MySQL.
Simplemente puedes enumerar las tablas que deseas involucrar separadas por
comas en la cláusula FROM de la consulta. Esto generará una combinación de
todas las filas de todas las tablas mencionadas, lo que se conoce como un
producto cartesiano.
Estructura Básica:
SELECT * FROM tabla1, tabla2;
Como puedes ver es muy simple combinar tablas, simplemente las separas con
comas, el problema está en el resultado. En la consulta simple del ejemplo no hay
cláusula WHERE, por lo tanto, no hay una condición que ordene la unión, el
resultado será que cada fila de una tabla se unirá con todas las filas de la otra
tabla, veámoslo con un ejemplo:
*/

/*
-- 1. Une las tablas de empleados con departamentos y solo muestra las columnas 
nombre, apellido, edad, salario de empleados y la columna nombre de departamentos.
*/
USE mi_bd;
SELECT emp.nombre, emp.apellido, emp.edad, emp.salario, dep.nombre 'departamento'
FROM empleados `emp`, departamentos `dep`
WHERE emp.departamento_id = dep.id
ORDER BY emp.nombre ASC, emp.apellido ASC;

/*
-- 2. Une las tablas ventas con la tabla empleados donde se muestren todas las 
columnas de ventas exceptuando la columna empleado_id y en su lugar muestres 
el nombre y apellido de la tabla empleados.
*/
SELECT vent.id, vent.producto_id, vent.cliente_id, vent.cantidad, vent.precio_unitario,
	   vent.monto_total, emp.nombre, emp.apellido
FROM empleados emp, ventas vent
WHERE vent.empleado_id = emp.id;

/*
-- 3. Une las tablas ventas con la tabla productos donde se muestren todas las columnas 
de ventas exceptuando la columna producto_id y en su lugar muestres la columna nombre de 
la tabla productos.
*/
SELECT vent.id, vent.empleado_id, vent.cliente_id, vent.cantidad, vent.precio_unitario,
	   vent.monto_total, prod.nombre
FROM ventas vent, productos prod
WHERE vent.producto_id = prod.id;

/*
-- 4. Une las tablas ventas con la tabla clientes donde se muestren todas las columnas de 
ventas exceptuando la columna cliente_id y en su lugar muestres la columna nombre de la 
tabla clientes.
*/
SELECT vent.id, vent.empleado_id, vent.producto_id, vent.cantidad, vent.precio_unitario,
	   vent.monto_total, cli.nombre
FROM ventas vent, clientes cli
WHERE vent.cliente_id= cli.id;

/*
-- 5. Une las tablas ventas con la tablas empleados y departamentos donde se muestren todas 
las columnas de ventas exceptuando la columna empleado_id y en su lugar muestres el nombre 
y apellido de la tabla empleados y además muestres la columna nombre de la tabla departamentos. 
*/
SELECT vent.id, vent.producto_id, vent.cliente_id, vent.cantidad, vent.precio_unitario,
	   vent.monto_total, emp.nombre, emp.apellido, dep.nombre 'departamento'
FROM ventas `vent`, empleados `emp`, departamentos `dep`
WHERE vent.empleado_id = emp.id AND emp.departamento_id = dep.id
ORDER BY vent.id;
/*
-- 6. Une las tablas ventas, empleados, productos y clientes donde se muestren las columnas de
la tabla ventas reemplazando sus columnas de FOREIGN KEYs con las respectivas columnas de 
“nombre” de las otras tablas.
*/
SELECT vent.id, prod.nombre "nombre_producto", cli.nombre "nombre_cliente", vent.cantidad, 
	   vent.precio_unitario, vent.monto_total, emp.nombre "nombre_empleado", 
       emp.apellido "apellido_empleado"
FROM ventas `vent`, empleados `emp`, productos `prod`, clientes `cli`
WHERE vent.producto_id = prod.id AND vent.cliente_id = cli.id AND vent.empleado_id = emp.id
ORDER BY id;

/*
-- 7. Calcular el salario máximo de los empleados en cada departamento y mostrar el nombre del 
departamento junto con el salario máximo.
*/
SELECT dep.nombre, MAX(emp.salario) "maximo_salario"
FROM empleados `emp`, departamentos `dep`
WHERE emp.departamento_id = dep.id
GROUP BY emp.departamento_id
ORDER BY MAX(emp.salario) DESC;