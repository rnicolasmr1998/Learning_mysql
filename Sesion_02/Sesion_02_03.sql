-- Actividad : Práctica avanzada 
-- 1. Crea una tabla llamada "clientes" con columnas para el "id" (entero autoincremental), "nombre" (cadena de hasta 50 caracteres), y "direccion" (cadena de hasta 100 caracteres).
USE mi_bd;
DROP TABLE IF EXISTS `clientes`, `productos`, `ventas`;
CREATE TABLE `clientes` (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(100)
);

-- 2. Crea una tabla llamada "productos" con columnas para el "id" (entero autoincremental), "nombre" (cadena de hasta 50 caracteres), y "precio" (decimal con 10 dígitos, 2 decimales).
CREATE TABLE `productos` (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10, 2)
);

-- 3. Crea una tabla llamada "ventas" con columnas para "id" (entero autoincremental), "producto_id" (entero), "cliente_id" (entero), "cantidad" (entero), “precio_unitario” (decimal con 10 dígitos, 2 decimales), "monto_total" (decimal con 10 dígitos, 2 decimales), y "empleado_id" (entero).
CREATE TABLE `ventas` (
	id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT,
    cliente_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    monto_total DECIMAL(10, 2),
    empleado_id INT
);

-- 4. En la tabla creada Ventas, establece restricciones de clave foránea en las columnas "producto_id," "cliente_id," y "empleado_id" para hacer referencia a las tablas correspondientes.
ALTER TABLE ventas
ADD FOREIGN KEY (producto_id)
REFERENCES productos(id),
ADD FOREIGN KEY (cliente_id)
REFERENCES clientes(id),
ADD FOREIGN KEY (empleado_id)
REFERENCES empleados(id);

-- 5. Inserta un nuevo cliente en la tabla "clientes" con el nombre "Juan Pérez" y la dirección "Libertad 3215, Mar del Plata"
INSERT INTO clientes (nombre, direccion)
VALUES ('Juan Pérez', 'Libertad 3215, Mar del Plata');

-- 6. Inserta un nuevo producto en la tabla "productos" con el nombre "Laptop" y un precio de 1200.00 .
INSERT INTO productos (nombre, precio)
VALUES ('Laptop', 1200.00);

-- 7. Modifica la columna monto_total de la tabla ventas para que por defecto sea el resultado de multiplicar la cantidad por el precio del producto_id
ALTER TABLE ventas
MODIFY COLUMN monto_total DECIMAL(10, 2) 
GENERATED ALWAYS AS (cantidad * precio_unitario) STORED;

-- 8. Crea una venta en la tabla "ventas" donde el cliente "Juan Pérez" compra "Laptop" por una cantidad de 2 unidades y el vendedor tenga el nombre “Ana" y apellido "Rodriguez”. Ten en cuenta que debes “tener” los ID y valores correspondientes previamente, luego aprenderemos a recuperarlos con subconsultas.
INSERT INTO ventas (producto_id, cliente_id, cantidad, precio_unitario, empleado_id) VALUES (1, 1, 2, 1350.00, 2);

-- 9. Haz una consulta simple de los datos de la tabla ventas
select * from ventas;