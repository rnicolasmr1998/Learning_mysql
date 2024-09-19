-- Ejercicios HAVING 
/*
Esta cláusula le dice al SQL que incluya sólo ciertos grupos producidos por la
cláusula GROUP BY en los resultados de la consulta. Al igual que la cláusula
WHERE, utiliza una condición de búsqueda para especificar los grupos deseados.
La cláusula HAVING es la encargada de condicionar la selección de los grupos en
base a los valores resultantes en las funciones agregadas utilizadas debido a
que la cláusula WHERE condiciona solo para la selección de filas individuales. Esta
cláusula puede omitirse.
SELECT nombres_de_las_columnas 
FROM tabla_origen 
GROUP BY nombres_de_las_columnas_por_la_cual_agrupar 
HAVING condicion_busqueda_para_group_by;
*/
-- 1. Encuentra los departamentos con un salario promedio de sus empleados superior a $3,000.
USE mi_bd;
SELECT departamento_id, round(AVG(salario), 2) "salario_promedio" 
FROM empleados 
GROUP BY departamento_id 
HAVING salario_promedio > 3000
ORDER BY salario_promedio DESC;

-- 2. Encuentra los productos que se han vendido al menos 5 veces.
SELECT producto_id, COUNT(*) "cantidad_producto" 
FROM ventas 
GROUP BY producto_id 
HAVING cantidad_producto >= 5
ORDER BY cantidad_producto DESC;

-- 3. Selecciona los empleados que tengan una “o” en su nombre o apellido y agrúpalos por departamento y muestra los que tengan el salario máximo.
SELECT departamento_id, MAX(salario) 
FROM empleados 
WHERE nombre LIKE "%o%" OR apellido LIKE "%o%" 
GROUP BY departamento_id 
HAVING MAX(salario)= MAX(salario);

-- 4. Encuentra los departamentos con al menos 2 empleados con una edad menor de 30 años.
SELECT departamento_id, COUNT(*) AS num_empleados
FROM empleados
WHERE edad < 30
GROUP BY departamento_id
HAVING num_empleados >= 2;

-- 5. Muestra los clientes que han gastado más de $2,000 en total en compras.
SELECT cliente_id, SUM(monto_total) AS monto_total
FROM ventas
GROUP BY cliente_id
HAVING monto_total > 2000;