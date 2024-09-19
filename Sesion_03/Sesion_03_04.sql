-- Cláusula SELECT
/*
La sentencia SELECT, obtiene y nos permite mostrar filas de la base de datos,
también permite realizar la selección de una o varias filas o columnas de una o
varias tablas. Para seleccionar la tabla de la que queremos obtener dichas filas
vamos a utilizar la sentencia FROM.
La sentencia FROM lista las tablas de donde se listan las columnas enunciadas en
el SELECT. Esta cláusula no puede omitirse.
SELECT nombres de las columnas FROM tablaOrigen;
*/
DROP DATABASE IF EXISTS ejercicios_select; -- Para que no salga error a la hora de correr el query
CREATE DATABASE ejercicios_select;
USE ejercicios_select;
CREATE TABLE ejercicios_select.alumnos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT
);

INSERT INTO alumnos(nombre, apellido, edad)
VALUES ("AGUSTIN", "COCCO", 24), ("MARTIN", "BULLON", 21);

/*
Para mostrar todos los datos de una tabla usamos el símbolo (*). Esto nos
mostraría la primera tabla.
*/
SELECT * FROM alumnos;

/*
También en las consultas SELECT podemos hacer operaciones matemáticas
entre los datos numéricos de las tablas que elijamos. Usualmente ponemos estas
operaciones entre paréntesis para separar la operación del resto de la consulta.
*/
CREATE TABLE empleados (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    salario DECIMAL(10,2),
    comision DECIMAL(10,2)
);

INSERT INTO empleados(nombre, salario, comision)
VALUES ("AGUSTIN", 5000, 300), ("MARTIN", 2000, 250);

SELECT * FROM empleados;
SELECT nombre, (salario + comision) FROM empleados;
SELECT nombre, (salario + comision) AS salario_total FROM empleados;

/*
A la consulta SELECT le podemos sumar cláusulas que van a alterar el resultado
de filas que obtenga el SELECT, esto nos puede servir para traer ciertas filas y
evitar algunas que no queremos mostrar
*/

-- Cláusula DISTINCT
/* 
El SELECT DISTINCT se utiliza cuando queremos traer solo registros diferentes. En
las tablas a veces puede haber valores repetidos, para evitarlos usamos esta
sentencia. Es importante destacar que solo compara los valores encontrados en
las columnas descritas en la sentencia SELECT.
SELECT DISTINCT nombres_de_las_columnas FROM tabla_origen;
*/
INSERT INTO alumnos(nombre, apellido, edad)
VALUES ("AGUSTIN", "COCCO", 26);
SELECT DISTINCT * FROM alumnos;
SELECT DISTINCT nombre, apellido FROM alumnos;

-- Cláusula WHERE
/*
La cláusula `WHERE` establece criterios de selección de ciertas filas en el
resultado de la consulta gracias a las condiciones de búsqueda. Si no se
requieren condiciones de búsqueda, puede omitirse y el resultado de la consulta
serán todas las filas de las tablas enunciadas en el `FROM`.
SELECT nombres_de_las_columnas FROM tabla_origen WHERE condicion_de_busqueda;

En las condiciones se pueden usar operadores relaciones (">", "<", "=", ">=",
"<=", "<> o !=") como operadores lógicos ("AND", "OR", "NOT")
*/

SELECT nombre, apellido FROM alumnos WHERE nombre = 'MARTIN';
SELECT nombre, apellido FROM alumnos WHERE edad < 24;
SELECT nombre, apellido FROM alumnos WHERE edad > 25 AND edad < 27;
SELECT nombre, apellido FROM alumnos WHERE NOT edad > 25 AND edad < 27;

-- Cláusula BETWEEN
/*
El operador `BETWEEN` selecciona valores dentro de un rango determinado. Los
valores pueden ser números, texto o fechas. Los rangos declarados en la consulta
serán incluidos en el análisis.
SELECT nombres_de_las_columnas 
FROM tabla_origen 
WHERE condicion_de_busqueda BETWEEN valor1 AND valor2;
*/
INSERT INTO alumnos(nombre, apellido, edad)
VALUES ("MARIELA", "LIMA", 60), ("JULIANA", "MARTINEZ", 30), ("GASTON", "VIDAL", 26);
SELECT * FROM alumnos WHERE edad BETWEEN 21 AND 30;

-- Cláusula IN
/*
El operador `IN` te permite especificar varios valores para una condición de una
cláusula `WHERE`. Es un atajo para no escribir varias condiciones `OR`.
SELECT nombres_de_las_columnas 
FROM tablaOrigen 
WHERE condición_de_Búsqueda IN (valor1, valor2, valor3, ...);
*/
SELECT * FROM alumnos WHERE nombre IN ('AGUSTIN', 'MARIELA', 'JULIANA');

-- Cláusula LIKE
/*
El operador `LIKE` se usa en una cláusula `WHERE` para buscar un patrón
específico en una columna. También se usa cuando queremos utilizar una
cadena en una comparación `WHERE`.
Hay dos símbolos que se utilizan a menudo junto con el operador `LIKE`:
- El signo de porcentaje (`%`) representa cero, uno o varios caracteres.
- El guión bajo (`_`) para representar un carácter.
Estos signos se pueden utilizar por separado o juntos.
SELECT nombres_de_las_columnas 
FROM tabla_origen WHERE condición_de_busqueda 
LIKE patron_de_cadena;
*/
INSERT INTO alumnos(nombre, apellido, edad)
VALUES ("SEBASTIAN", "GOMEZ", 24), ("SABRINA", "MARTINEZ", 15);
SELECT nombre, apellido FROM alumnos WHERE nombre LIKE 's%';

/*
Algunos ejemplos de Like:
- WHERE nombre LIKE 'a%': Encuentra cualquier nombre que empiece con "a".
- WHERE nombre LIKE '%a': Encuentra cualquier nombre que termine con "a".
- WHERE nombre LIKE '%ar%': Encuentra cualquier nombre que contenga "ar" en
cualquier posición.
- WHERE nombre LIKE '_e%': Encuentra cualquier nombre que tenga "e" en la
segunda posición.
- WHERE nombre LIKE 'e_%': Encuentra cualquier nombre que empiece con "e" y
sea por lo menos de 2 caracteres de largo.
- WHERE nombre LIKE 'e__%': Encuentra cualquier nombre que empiece con "e" y
sea por lo menos de 3 caracteres de largo.
- WHERE nombre LIKE 'a%n': Encuentra cualquier nombre que empiece con "a" y
termine con "n".
*/

-- Cláusula ORDER BY
/*
La cláusula ORDER BY permite establecer la columna o columnas sobre las
cuales las filas que se mostrarán de la consulta deberán ser ordenadas. Este
orden puede ser ascendente si se agrega la palabra ASC y descendente si se
agrega la palabra DESC al final. Esta cláusula puede omitirse, ya que por defecto
los resultados de cualquier consulta son ordenados de manera ascendente.
SELECT nombres_de_las_columnas 
FROM tabla_origen 
ORDER BY columna ASC|DESC;
*/
INSERT INTO alumnos(nombre, apellido, edad)
VALUES ("JERONIMO", "WIUNKHAUS", 24);
SELECT nombre, apellido FROM alumnos ORDER BY nombre ASC;

-- Cláusula GROUP BY
/*
La cláusula GROUP BY especifica una consulta sumaria. En lugar de producir una
fila de resultados por cada fila de datos de la base de datos, una consulta
sumaria agrupa todas las filas similares y luego produce una fila sumaria de
resultados para cada grupo de los nombres de columnas enunciados en esta
cláusula.
En otras palabras, esta cláusula permite agrupar un conjunto de columnas con
valores repetidos y utilizar las funciones de agregación sobre las columnas con
valores no repetidos. Esta cláusula puede omitirse.
SELECT nombres_de_las_columnas 
FROM tabla_origen 
GROUP BY nombres_de_las_columnas_por_la_cual_agrupar;
*/
SELECT nombre, apellido
FROM alumnos
GROUP BY nombre, apellido;

-- Funciones de agregación
/*
En la gestión de bases de datos, una función de agregación es una función en la
que los valores de varias filas se agrupan bajo un criterio para formar un valor
único más significativo. Estas funciones se ponen en el SELECT
Existen 5 tipos de funciones de agregación: MAX(), MIN(), COUNT(), SUM(), AVG().
*/

-- MAX
/*
Esta función retorna el valor más grande de una columna. 
-- Sin agrupación
SELECT MAX(nombre_de_la_columna) 
FROM tabla_origen;

-- Con agrupación
SELECT MAX(nombre_de_la_columna) 
FROM tabla_origen 
GROUP BY nombres_de_las_columnas_por_la_cual_agrupar; 
*/
-- Sin agrupación
SELECT MAX(salario) 
FROM empleados;

INSERT INTO empleados(nombre, salario, comision)
VALUES ("AGUSTIN", 3000, 340), ("MARTIN", 1000, 220);

-- Con agrupación
SELECT nombre, MAX(salario) 
FROM empleados 
GROUP BY nombre;

-- MIN
/*
Esta función retorna el valor más pequeño de una columna.
-- Sin agrupación
SELECT MIN(nombre_de_la_columna) 
FROM tabla_origen;

-- Con agrupación
SELECT MIN(nombre_de_la_columna) 
FROM tabla_origen 
GROUP BY nombres_de_las_columnas_por_la_cual_agrupar; 
*/
-- Sin agrupación
SELECT MIN(salario) 
FROM empleados;

-- Con agrupación
SELECT nombre, MIN(salario) 
FROM empleados 
GROUP BY nombre;

-- AVG
/*
Esta función retorna el promedio de una columna.
-- Sin agrupación
SELECT AVG(nombre_de_la_columna) 
FROM tabla_origen;

-- Con agrupación
SELECT AVG(nombre_de_la_columna) 
FROM tabla_origen 
GROUP BY nombres_de_las_columnas_por_la_cual_agrupar; 
*/
-- Sin agrupación
SELECT AVG(salario) 
FROM empleados;

-- Con agrupación
SELECT nombre, AVG(salario) 
FROM empleados 
GROUP BY nombre;

-- COUNT
/*
Esta función retorna el número de filas de una columna.
-- Sin agrupación
SELECT COUNT(nombre_de_la_columna) 
FROM tabla_origen;

-- Con agrupación
SELECT COUNT(nombre_de_la_columna) 
FROM tabla_origen 
GROUP BY nombres_de_las_columnas_por_la_cual_agrupar; 
*/
-- Sin agrupación
SELECT COUNT(id) 
FROM empleados;

-- Con agrupación
SELECT nombre, COUNT(id) 
FROM empleados 
GROUP BY nombre;

-- SUM
/*
Esta función retorna la suma del numero de filas de una columna.
-- Sin agrupación
SELECT SUM(nombre_de_la_columna) 
FROM tabla_origen;

-- Con agrupación
SELECT SUM(nombre_de_la_columna) 
FROM tabla_origen 
GROUP BY nombres_de_las_columnas_por_la_cual_agrupar; 
*/
-- Sin agrupación
SELECT SUM(salario) 
FROM empleados;

-- Con agrupación
SELECT nombre, SUM(salario) 
FROM empleados 
GROUP BY nombre;

-- HAVING
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
CREATE TABLE personas (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    pais VARCHAR(50)
);

INSERT INTO personas (nombre, pais)
VALUES 
	("FRANCO", "ARGENTINA"), 
    ("JULIANA", "ALEMANIA"), 
    ("AGUSTIN", "ARGENTINA"),
    ("GASTON", "ALEMANIA"),
    ("MARIELA", "URUGUAY");

SELECT COUNT(id), pais 
FROM personas 
GROUP BY pais 
HAVING COUNT(id) > 1;

-- AS
/*
La sentencia AS le da un alias a una o la columna de una tabla, un nombre
temporal. El alias existe solo por la duración de la consulta. El alias se usa para
darle a una columna un nombre más legible.
SELECT nombres_de_las_columnas AS alias 
FROM tabla_origen;
*/
CREATE TABLE estudiantes (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT
);

INSERT INTO estudiantes (nombre, edad)
VALUES 
	("XAVIER COLLADO", 24), 
    ("ANA GADEA", 15), 
    ("MARIELA LIMA", 20),
    ("PEDRO SUAREZ", 30),
    ("JUAN GUTIERREZ", 18);

-- Actualizar los valores en la columna apellido tomando la segunda parte de la columna nombre.    
UPDATE estudiantes
SET apellido = SUBSTRING_INDEX(nombre, ' ', -1);

-- Actualizar los valores en la columna nombre tomando la primera parte de la columna nombre.
UPDATE estudiantes
SET nombre = SUBSTRING_INDEX(nombre, ' ', 1);

SELECT nombre AS nombre_alumno , apellido AS apellido_alumno 
FROM estudiantes;

/*
También se puede omitir la palabra reservada AS:
SELECT nombre nombre_alumno , apellido apellido_alumno 
FROM estudiantes;
*/

-- ROUND
/*
La sentencia ROUND sirve para redondear los decimales de un número que se
pide en un SELECT.
SELECT ROUND(nombres_de_las_columnas, numero_decimales) 
FROM tabla_origen;
*/
INSERT INTO empleados(nombre, salario, comision)
VALUES 
	("NICOLAS", 3252, 330), 
    ("PIERO", 5890, 1500),
    ("JUNIOR", 3255, 330);

SELECT AVG(salario) FROM empleados;
SELECT ROUND(AVG(salario), 2) FROM empleados;

-- LIMIT
/*
La cláusula LIMIT se utiliza para establecer un límite al número de resultados
devueltos por SQL.
SELECT nombres_de_las_columnas 
FROM tabla_origen 
LIMIT numero;
*/
SELECT nombre, apellido FROM alumnos LIMIT 2;

-- Orden de Implementación de Clausulas en MySQL
/*
1. SELECT columnas: Especifica las columnas que deseas recuperar.
2. FROM tabla: Indica la tabla de donde se obtendrán los datos.
3. WHERE condiciones: Filtra las filas según ciertas condiciones antes de
cualquier agrupamiento.
4. GROUP BY columnas: Agrupa las filas que tienen los mismos valores en las
columnas especificadas.
5. HAVING condiciones: Filtra grupos según ciertas condiciones después del
agrupamiento. No puede usarse sin GROUP BY.
6. ORDER BY columnas ASC/DESC: Ordena los resultados según las
columnas especificadas en orden ascendente o descendente.
7. LIMIT cantidad: Limita la cantidad de filas devueltas.

Nota: Si usas consultas anidadas, el orden interno de la nueva consulta vuelve a
iniciar desde el primer paso. Es decir, cada subconsulta sigue el mismo orden de
implementación de cláusulas mencionadas anteriormente.
*/