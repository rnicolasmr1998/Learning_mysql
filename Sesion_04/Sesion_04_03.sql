-- Ejercicios cláusula LIKE
/*
La cláusula LIKE se utiliza para buscar patrones en una columna de texto. Permite
seleccionar registros cuyos valores en una columna coinciden con un patrón
específico. Hay dos comodines principales que se utilizan con la cláusula LIKE:
● %: Representa cero o más caracteres.
● _: Representa un solo carácter.
SELECT * 
FROM nombre_tabla 
WHERE nombre_columna LIKE 'patrón%';
*/
-- 1. Encuentra los empleados cuyos nombres comienzan con "L".
USE mi_bd;
SELECT * 
FROM empleados 
WHERE nombre LIKE 'L%';

-- 2. Busca los productos cuyos nombres contengan la palabra "Teléfono".
SELECT * 
FROM productos 
WHERE nombre LIKE '%Teléfono%';

-- 3. Encuentra los clientes cuyas direcciones contienen la palabra "Calle".
SELECT * 
FROM clientes 
WHERE direccion LIKE '%Calle%';

-- 4. Busca los empleados cuyos correos electrónicos terminan en "mail.com".
SELECT *
FROM empleados
WHERE correo_electronico LIKE "%mail.com";

-- 5. Encuentra los productos cuyos nombres tengan exactamente 6 caracteres.
SELECT *
FROM productos
WHERE nombre LIKE "______";

-- 6. Busca los clientes cuyos nombres tengan una "a" en la tercera posición.
SELECT *
FROM clientes
WHERE nombre LIKE "__a%";