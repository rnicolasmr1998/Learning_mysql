-- Actividad : Aplicando DDL 
-- 1. Modifica la columna "edad" para que no pueda tener valores nulos.
USE mi_bd;
SHOW COLUMNS FROM empleados;
ALTER TABLE mi_bd.empleados MODIFY COLUMN edad INT NOT NULL;
/*
Tambien lo puedes hacer de la siguiente manera:
ALTER TABLE mi_bd.empleados MODIFY COLUMN edad INT NOT NULL;
*/

-- 2. Modifica la columna "salario" para que tenga un valor predeterminado de 0 en lugar de nulo.
ALTER TABLE empleados MODIFY COLUMN `salario` DECIMAL(10,2) DEFAULT 0;

-- 3. Agrega una columna llamada "departamento" de tipo VARCHAR(50) para almacenar el departamento al que pertenece cada empleado.
ALTER TABLE empleados ADD COLUMN departamento VARCHAR(50);

-- 4. Agrega una columna llamada "correo_electronico" de tipo VARCHAR(100) para almacenar las direcciones de correo electrónico de los empleados.
ALTER TABLE empleados ADD COLUMN correo_electronico VARCHAR(100);

-- 5. Elimina la columna "fecha_contratacion" de la tabla "empleados".
ALTER TABLE empleados DROP COLUMN fecha_contratacion;

-- 6. Vuelve a crear la columna "fecha_contratacion" de la tabla "empleados" pero con un valor por default que sea la fecha actual. Para eso puedes usar las funciones “CURRENT_DATE” o “NOW()”.
ALTER TABLE empleados ADD COLUMN fecha_contratacion DATE DEFAULT (CURRENT_DATE);

/*
-- 7. Crea una nueva tabla llamada "departamentos" con las siguientes columnas:
id (clave primaria, tipo INT AUTO_INCREMENT)
nombre (tipo VARCHAR(50))
*/
DROP TABLE IF EXISTS departamentos; -- Para que no salga error a la hora de correr el query
CREATE TABLE departamentos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- 8.  Agrega una nueva columna llamada "departamento_id" en la tabla "empleados" que servirá como clave foránea para hacer referencia al departamento al que pertenece cada empleado.
ALTER TABLE empleados ADD COLUMN departamento_id INT;

-- 9. Modifica la tabla “empleados” y establece una restricción de clave foránea en la columna "departamento_id" para que haga referencia a la columna "id" en la tabla "departamentos".
ALTER TABLE empleados
ADD FOREIGN KEY (departamento_id)
REFERENCES departamentos(id);

-- 10. Elimina el campo “departamentos” de la tabla empleados, ahora usaremos la clave foránea para poder relacionar ambas tablas.
ALTER TABLE empleados DROP COLUMN departamento;


