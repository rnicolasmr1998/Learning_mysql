-- Actividad : Aplicando DML
-- 1. Instrucción INSERT INTO (Inserción de Datos): La instrucción INSERT INTO se utiliza para agregar nuevos registros o filas a una tabla existente en la base de datos. 
USE mi_bd;
INSERT INTO empleados (nombre, apellido, edad, salario) VALUES ('Juan', 'Pérez', 30, 2500.50);

-- 2. Instrucción UPDATE (Actualización de Datos):La instrucción UPDATE se utiliza para modificar los valores de uno o más registros en una tabla existente. Las cláusulas clave asociadas con esta instrucción son:
UPDATE empleados SET salario = 2700.00 WHERE nombre = 'Juan';

-- 3. Instrucción DELETE (Eliminación de Datos): La instrucción DELETE se utiliza para eliminar registros de una tabla existente. Las cláusulas clave son:
DELETE FROM empleados WHERE nombre = 'Juan';

-- 4.  Inserta un departamento llamado "Ventas" en la tabla "departamentos".
INSERT INTO departamentos (nombre) VALUES ('Ventas');

-- 5. Inserta un departamento llamado "Recursos Humanos" en la tabla "departamentos".
INSERT INTO departamentos (nombre) VALUES ('Recursos Humanos');

/*
-- 6. Inserta un empleado en la tabla "empleados" con los siguientes valores:
Nombre: Ana
Apellido: Rodríguez.
Edad: 28.
Salario: 3000.00.
Correo electrónico: anarodriguez@mail.com
departamento_id: (debe coincidir con el ID del departamento "Ventas" que insertaste anteriormente, puedes saber el id haciendo una consulta a la tabla “SELECT * FROM departamentos”).
*/
INSERT INTO empleados
(nombre,apellido,edad,salario,correo_electronico,departamento_id)
VALUES ('Ana', 'Rodríguez', 28, 3000.00, 'anarodriguez@mail.com', 1 );

/*
-- 7. Inserta un empleado en la tabla "empleados" con los siguientes valores:
Inserta otro empleado en la tabla "empleados" con los siguientes valores:
Nombre: Carlos.
Apellido: López.
Edad: 32.
Salario: 3200.50.
Correo electrónico: carloslopez@mail.com
departamento_id: (debe coincidir con el ID del departamento "Recursos Humanos" que insertaste anteriormente).
*/
INSERT INTO empleados
(nombre,apellido,edad,salario,correo_electronico,departamento_id)
VALUES ('Carlos', 'López', 32, 3200.50, 'carloslopez@mail', 2 );

/*
-- 8. Inserta un empleado en la tabla "empleados" con los siguientes valores:
Nombre: Laura
Apellido: Pérez
Edad: 26
Salario: 2800.75
Correo electrónico: lauraperez@mail.com
departamento_id:  (debe coincidir con el ID del departamento "Ventas" que insertaste anteriormente).
*/
INSERT INTO empleados(nombre,apellido,edad,salario,correo_electronico,departamento_id)
VALUES ('Laura', 'Pérez', 26, 2800.75, 'lauraperez@mail.com', 1 );
/*
-- 9. Inserta otro empleado en la tabla "empleados" con los siguientes valores:
Nombre: Martín
Apellido: González
Edad: 30
Salario: 3100.25
Correo electrónico: martingonzalez@mail.com
departamento_id: (debe coincidir con el ID del departamento "Recursos Humanos" que insertaste anteriormente).
*/
INSERT INTO empleados
(nombre,apellido,edad,salario,correo_electronico,departamento_id)
VALUES ('Martín', 'González', 30, 3100.25, 'martingonzalez@mail.com', 2);

-- 10. Actualiza el salario del empleado con nombre "Ana" para aumentarlo en un 10%.
UPDATE empleados
SET salario = salario * 1.1
WHERE nombre = "Ana";
SELECT * FROM empleados;

-- 11. Crea un departamento llamado “Contabilidad”. 
INSERT INTO departamentos (nombre) VALUES ('Contabilidad');

-- 12. Cambia el departamento del empleado con nombre "Carlos" de "Recursos Humanos" a "Contabilidad":
UPDATE empleados
SET departamento_id = 3
WHERE nombre = 'Carlos';

-- 13. Elimina al empleado con nombre "Laura"
DELETE FROM empleados WHERE nombre = 'Laura';

-- 14. Haz una consulta simple de los datos de la tabla empleados
SELECT * FROM empleados;

-- 15. Haz una consulta simple de los datos de la tabla departamentos
SELECT * FROM departamentos;