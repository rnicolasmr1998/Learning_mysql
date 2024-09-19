-- Ejercicios DML
-- 1. Inserta un nuevo producto en la tabla "productos" con el nombre "Teléfono móvil" y un precio de 450.00.
USE mi_bd;
INSERT INTO productos (nombre, precio)
VALUES ('Teléfono móvil', 450.00);

/*
Para cargar multiples datos en la tabla se puede ir agregando mediante una coma:
INSERT INTO clientes (nombre, direccion)
VALUES 
('Juan Pérez', 'Libertad 3215, Mar del Plata'),
('Lucía Torres', 'Calle 5, Buenos Aires'),
('Pedro Gómez', 'Av. Corrientes 1000, Rosario');

*/

-- 2. Inserta un nuevo cliente en la tabla "clientes" con el nombre "María García" y la dirección "Constitución 456, Luján".
INSERT INTO clientes (nombre, direccion)
VALUES ('María García', 'Constitución 456, Luján');

-- 3. Modifica la columna correo_electronico de la tabla empleados para que se genere automáticamente concatenado el nombre, apellido y el string “@mail.com”.
ALTER TABLE empleados 
MODIFY COLUMN correo_electronico VARCHAR(100) 
GENERATED ALWAYS AS (CONCAT(nombre, apellido, '@mail.com')) STORED;

-- 4. Inserta un nuevo empleado en la tabla "empleados" con el nombre "Luis” y apellido “Fernández", edad 28, salario 2800.00 y que pertenezca al departamento “ventas”.
INSERT INTO empleados (nombre, apellido, edad, salario, departamento_id)
VALUES ('Luis', 'Fernández', 28, 2800.00, 1);

-- 5. Actualiza el precio del producto "Laptop" a 1350.00 en la tabla "productos".
UPDATE productos SET precio = 1350.00
WHERE nombre = 'Laptop';

-- 6. Modifica la dirección del cliente "Juan Pérez" a "Alberti 1789, Mar del Plata" en la tabla "clientes".
UPDATE clientes SET direccion = "Alberti 1789, Mar del Plata"
WHERE nombre = "Juan Pérez";

-- 7. Incrementa el salario de todos los empleados en un 5% en la tabla "empleados".
UPDATE empleados
SET salario = 1.05 * salario;

-- 8. Inserta un nuevo producto en la tabla "productos" con el nombre "Tablet" y un precio de 350.00.
INSERT INTO productos (nombre, precio)
VALUES ("Tablet", 350.00);

-- 9. Inserta un nuevo cliente en la tabla "clientes" con el nombre "Ana López" y la dirección "Beltrán 1452, Godoy Cruz".
INSERT INTO clientes (nombre, direccion)
VALUES ("Ana López", "Beltrán 1452, Godoy Cruz");

-- 10. Inserta un nuevo empleado en la tabla "empleados" con el nombre "Marta", apellido "Ramírez", edad 32, salario 3100.00 y que pertenezca al departamento “ventas”.
INSERT INTO empleados (nombre, apellido, edad, salario, departamento_id)
VALUES ("Marta", "Ramírez", 32, 3100.00, 1);

-- 11. Actualiza el precio del producto "Teléfono móvil" a 480.00 en la tabla "productos".
UPDATE productos 
SET precio = 480.00
WHERE nombre = "Teléfono móvil";

-- 12. Modifica la dirección del cliente "María García" a "Avenida 789, Ciudad del Este" en la tabla "clientes".
UPDATE clientes 
SET direccion = "Avenida 789, Ciudad del Este"
WHERE nombre = "María García";

-- 13. Incrementa el salario de todos los empleados en el departamento de "Ventas" en un 7% en la tabla "empleados".
UPDATE empleados 
SET salario = salario * 1.07
WHERE departamento_id = 1;

-- 14. Inserta un nuevo producto en la tabla "productos" con el nombre "Impresora" y un precio de 280.00.
INSERT INTO productos (nombre, precio)
VALUES ("Impresora", 280.00);

-- 15. Inserta un nuevo cliente en la tabla "clientes" con el nombre "Carlos Sánchez" y la dirección "Saavedra 206, Las Heras".
INSERT INTO clientes (nombre, direccion)
VALUES ("Carlos Sánchez", "Saavedra 206, Las Heras");

-- 16. Inserta un nuevo empleado en la tabla "empleados" con el nombre "Lorena", apellido "Guzmán", edad 26, salario 2600.00 y que pertenezca al departamento “ventas”.
INSERT INTO empleados (nombre, apellido, edad, salario, departamento_id)
VALUES ("Lorena", "Guzmán", 26, 2600.00, 1);

-- 17. Haz una consulta simple de los datos de la tabla empleados y verifica que se presente de la siguiente manera:
SELECT * FROM empleados;

-- 18. Haz una consulta simple de los datos de la tabla clientes y verifica que se presente de la siguiente manera:
SELECT * FROM clientes;

-- 19. Haz una consulta simple de los datos de la tabla productos y verifica que se presente de la siguiente manera:
SELECT * FROM productos;
SELECT * FROM departamentos;

