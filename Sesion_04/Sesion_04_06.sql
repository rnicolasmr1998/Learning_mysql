-- Ejercicios cláusula AS
/*
La cláusula AS se utiliza para asignar un alias o nombre temporal a una columna
o una tabla en una consulta SQL. Esto facilita la referencia a la columna o tabla
con un nombre más legible o abreviado.
SELECT nombre_columna AS alias_columna 
FROM nombre_tabla AS alias_tabla;
Recuerda que no hace falta usar la cláusula AS, si dejas un espacio automáticamente
se infiere que estas asignando un alias.
SELECT nombre_columna alias_columna 
FROM nombre_tabla alias_tabla;
*/
-- 1. Crea una consulta que muestre el salario de los empleados junto con el salario aumentado en un 10% nombrando a la columna como “Aumento del 10%”.
USE mi_bd;
SELECT salario, round((salario * 1.10), 2) AS  "Aumento del 10%"
FROM empleados;

-- 2. Crea una consulta que calcule el monto total de las compras realizadas por cliente y que la columna se llame “Monto total gastado”.
SELECT cliente_id, sum(monto_total) "Monto total gastado"
FROM ventas
GROUP BY cliente_id;

-- 3. Muestra los nombres completos de los empleados concatenando los campos "nombre" y "apellido" y que la columna se llame “Nombre y apellido”.
SELECT concat(nombre, " ", apellido) "Nombre y apellido"
FROM empleados;

-- 4. Crea una consulta que muestre la edad de los empleados junto con la edad aumentada en 5 años y que esta nueva columna se llame “Edad en 5 años”.
SELECT edad, (edad + 5) "Edad en 5 años"
FROM empleados;

-- 5. Muestra el monto total de ventas junto con el monto total aumentado en un 21%  y que esta nueva columna se llame “Precio + IVA”.
SELECT monto_total, (monto_total * 1.21) "Precio + IVA"
FROM ventas;

-- 6.Crea una consulta que muestre el nombre del producto y su precio unitario precedido con el signo “$ ” y que esta nueva columna se llame “precio con formato”.
SELECT nombre, concat("$", " ", precio) "Precio con formato"
FROM productos;