-- Ejercicios cláusula CASE
/*
La cláusula CASE se utiliza en SQL para realizar evaluaciones condicionales y
devolver un valor basado en una condición especificada. La estructura básica de
una cláusula CASE es la siguiente:
CASE
	WHEN condición_1 THEN resultado_1
	WHEN condición_2 THEN resultado_2
	...
	ELSE resultado_predeterminado
END
Donde:
- condición_1, condición_2, etc.: Son las condiciones que se evalúan. Si
alguna de estas condiciones es verdadera, se devuelve el resultado
correspondiente.
- resultado_1, resultado_2, etc.: Son los valores que se devolverán si las
condiciones correspondientes son verdaderas.
- ELSE resultado_predeterminado: Es un valor opcional que se devuelve si
ninguna de las condiciones anteriores es verdadera.
*/
/*
-- 1. Crea una consulta que muestre el nombre de los productos y los categorice 
como "Caro" si el precio es mayor o igual a $500, "Medio" si es mayor o igual 
a $200 y menor que $500, y "Barato" en otros casos.
*/
USE mi_bd;
SELECT nombre, precio,
	CASE
		WHEN precio >= 500 THEN 'Caro'
		WHEN precio >= 200 THEN 'Medio'
		ELSE 'Barato'
	END AS categoria_precio
FROM productos;

/*
-- 2. Crea una consulta que muestre el nombre de los empleados y los categorice 
como "Joven" si tienen menos de 30 años, "Adulto" si tienen entre 30 y 40 años, 
y "Mayor" si tienen más de 40 años.
*/
SELECT nombre, edad,
	CASE
		WHEN edad > 40 THEN 'Mayor'
		WHEN edad >= 30 THEN 'Adulto'
		ELSE 'Joven'
	END AS categoria_edad
FROM empleados;

/*
-- 3. Crea una consulta que muestre el ID de la venta y los categorice como "Poca 
cantidad" si la cantidad es menor que 3, "Cantidad moderada" si es igual o mayor 
que 3 y menor que 6, y "Mucha cantidad" en otros casos.
*/
SELECT id, cantidad,
	CASE
		WHEN cantidad >= 6 THEN 'Mucha cantidad'
		WHEN cantidad >= 3 THEN 'Cantidad moderada'
		ELSE 'Poca cantidad'
	END AS categoria_cantidad
FROM ventas;

/*
-- 4. Crea una consulta que muestre el nombre de los clientes y los categorice como 
"Comienza con A" si su nombre comienza con la letra 'A', "Comienza con M" si comienza 
con 'M' y "Otros" en otros casos.
*/
SELECT nombre,
	CASE
		WHEN nombre LIKE "A%" THEN "Comienza con A" 
		WHEN nombre LIKE "M%" THEN "Comienza con M"
		ELSE 'Otros'
	END AS categoria_nombre
FROM clientes;

/*
-- 5. Crea una consulta que muestre el nombre de los empleados y los categorice como 
"Salario alto" si el salario es mayor o igual a $3500, "Salario medio" si es mayor o 
igual a $3000 y menor que $3500, y "Salario bajo" en otros casos.
*/
SELECT nombre, salario,
	CASE
		WHEN salario >= 3500 THEN "Salario alto"
        WHEN salario >= 3000 THEN "Salario medio"
		ELSE 'Salario bajo'
	END AS categoria_salario
FROM empleados;

/*
-- 6. Crea una consulta que muestre el nombre de los productos y los categorice como 
"Laptop" si el nombre contiene la palabra "Laptop", "Teléfono" si contiene la palabra 
"Teléfono", y "Otros" en otros casos.
*/
SELECT nombre,
	CASE
		WHEN nombre like "%Laptop%" THEN "Laptop"
        WHEN nombre like "%Teléfono%" THEN "Teléfono"
		ELSE "Otros"
	END AS categoria_nombre
FROM productos;

/*
-- 7. Crea una consulta que muestre el ID del producto y los clasifique en categorías 
según la cantidad total de ventas de cada producto en la tabla 'ventas'. Utilizando 
una instrucción 'CASE', establece las siguientes categorías: 
- Si la suma de la cantidad de ventas (SUM(cantidad)) es mayor o igual a 9, la categoría 
es 'Alto Volumen'.
- Si la suma de la cantidad de ventas está entre 4 y 8 (inclusive), la categoría es 
'Medio Volumen'.
- En otros casos, la categoría es 'Bajo Volumen'.
Mostrar el resultado en orden descendente por la suma de la cantidad de ventas.
*/
SELECT producto_id, SUM(cantidad) "cantidad_vendida",
	CASE
		WHEN (SUM(cantidad)) >= 9 THEN "Alto volumen"
        WHEN (SUM(cantidad)) > 4 THEN "Medio volumen"
		ELSE "Bajo volumen"
	END AS categoria_cantidad
FROM ventas
GROUP BY producto_id
ORDER BY cantidad_vendida DESC;

/*
-- 8. Crea una consulta que muestre el ID de la venta y los categorice como 
"Venta pequeña" si el monto total es menor que $500, "Venta mediana" si es mayor 
o igual a $500 y menor que $1500, y "Venta grande" en otros casos.
*/
SELECT id, monto_total,
	CASE
		WHEN monto_total >= 1500 THEN "Venta grande"
        WHEN monto_total >= 500 THEN "Venta mediana"
		ELSE "Venta pequeña"
	END AS categoria_monto
FROM ventas
ORDER BY monto_total DESC;

/*
-- 9. Crea una consulta que muestre el nombre de los clientes y los categorice 
como "Dirección larga" si la longitud de su dirección es mayor o igual a 30 
caracteres, "Dirección mediana" si es mayor o igual a 20 y menor que 30 
caracteres, y "Dirección corta" en otros casos.
*/
SELECT nombre,
	CASE
		WHEN length(direccion) >=30 THEN "Dirección larga"
        WHEN length(direccion) >=20 THEN "Dirección mediana"
		ELSE "Dirección corta"
	END AS categoria_direccion
FROM clientes
ORDER BY length(direccion) DESC;

/*
-- 10.  Crea una consulta que muestre el nombre de los empleados y los categorice 
como "Ventas" si pertenecen al departamento 1, "Recursos Humanos" si pertenecen 
al departamento 2, y "Contabilidad"  si pertenecen al departamento 3.
*/
SELECT nombre, departamento_id,
	CASE
		WHEN departamento_id = 1 THEN "Ventas"
        WHEN departamento_id = 2 THEN "Recursos Humanos"
		ELSE "Contabilidad"
	END AS categoria_departamento
FROM empleados
ORDER BY nombre ASC;

/*
-- 11. Crea una consulta que muestre el nombre de los productos y los categorice 
de la siguiente manera:
- Si el nombre del producto está en la lista ('Laptop', 'Reloj de Pulsera Inteligente', 
'Reproductor de Blu-ray', 'Auriculares Bluetooth', 'Smart TV 55 Pulgadas', 
'Cámara Digital', 'Impresora', 'Tablet', 'Teléfono móvil') y el precio es mayor o igual 
a 1000, la categoría es 'Tecnología cara'.
- Si el nombre del producto está en la lista anterior y el precio está entre 500 y 999 
(inclusive), la categoría es 'Tecnología gama media'.
- Si el nombre del producto está en la lista anterior y el precio es menor a 500, la 
categoría es 'Tecnología barata'.
- Si el precio es mayor o igual a 1000 y el nombre del producto no está en la lista, 
la categoría es 'Caro'.
- Si el precio está entre 500 y 999 (inclusive) y el nombre del producto no está en la 
lista, la categoría es 'Medio'.
- Si el precio es menor a 500 y el nombre del producto no está en la lista, la 
categoría es 'Barato'.
*/
SELECT nombre, precio,
	CASE
		WHEN nombre in ('Laptop', 'Reloj de Pulsera Inteligente',
						'Reproductor de Blu-ray', 'Auriculares Bluetooth', 
                        'Smart TV 55 Pulgadas', 'Cámara Digital', 'Impresora', 
                        'Tablet', 'Teléfono móvil')
			THEN CASE
					WHEN precio >= 1000 THEN 'Tecnología cara'
                    WHEN precio >= 500 THEN 'Tecnología gama media'
                    ELSE 'Tecnología barata'
				END
		ELSE CASE 
				WHEN precio >= 1000 THEN 'Caro'
				WHEN precio >= 500 THEN 'Medio'
				ELSE 'Barato'
			END
	END AS categoria_producto
FROM productos;