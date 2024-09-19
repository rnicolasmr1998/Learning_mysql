-- Actividad: Ejercicios Complementarios
-- 1. Inserta una venta en la tabla "ventas" donde el cliente "Juan Pérez" compra una "Laptop" con una cantidad de 2 y el vendedor tiene el nombre "Ana" y apellido "Rodríguez".
USE mi_bd;
INSERT INTO ventas (cliente_id, producto_id, cantidad, precio_unitario, empleado_id)
VALUES (1, 1, 2, (SELECT precio FROM productos WHERE id = 1), 2);

-- 2. Inserta una venta en la tabla "ventas" donde el cliente "María García" compra un "Teléfono móvil" con una cantidad de 3 y el vendedor tiene el nombre "Carlos" y apellido "López".
INSERT INTO ventas (cliente_id, producto_id, cantidad, precio_unitario, empleado_id)
VALUES (2, 2, 3, (SELECT precio FROM productos WHERE id = 2), 3);

-- 3. Crea una venta en la tabla "ventas" donde el cliente "Carlos Sánchez" compra una "Impresora" con una cantidad de 1 y el vendedor tiene el nombre "Marta" y apellido "Ramírez".
INSERT INTO ventas (cliente_id, producto_id, cantidad, precio_unitario, empleado_id)
VALUES (4, 4, 1, (SELECT precio FROM productos WHERE id = 4), 7);

-- 4. Inserta una venta en la tabla "ventas" donde el cliente "Ana López" compra una "Laptop" con una cantidad de 1 y el vendedor tiene el nombre "Carlos" y apellido "López".
INSERT INTO ventas (cliente_id, producto_id, cantidad, precio_unitario, empleado_id)
VALUES (3, 1, 1, (SELECT precio FROM productos WHERE id = 1), 3);

-- 5. Crea una venta en la tabla "ventas" donde el cliente "Juan Pérez" compra una "Tablet" con una cantidad de 2 y el vendedor tiene el nombre "Luis" y apellido "Fernández".
INSERT INTO ventas (cliente_id, producto_id, cantidad, precio_unitario, empleado_id)
VALUES (1, 3, 2, (SELECT precio FROM productos WHERE id = 3), 6);

-- 6.  Inserta una venta en la tabla "ventas" donde el cliente "María García" compra un "Teléfono móvil" con una cantidad de 1 y el vendedor tiene el nombre "Marta" y apellido "Ramírez".
INSERT INTO ventas (cliente_id, producto_id, cantidad, precio_unitario, empleado_id)
VALUES (2, 2, 1, (SELECT precio FROM productos WHERE id = 2), 7);

-- 7. Crea una venta en la tabla "ventas" donde el cliente "Carlos Sánchez" compra una "Impresora" con una cantidad de 2 y el vendedor tiene el nombre "Lorena" y apellido "Guzmán".
INSERT INTO ventas (cliente_id, producto_id, cantidad, precio_unitario, empleado_id)
VALUES (4, 4, 2, (SELECT precio FROM productos WHERE id = 4), 8);

-- 8. Haz una consulta simple de los datos de la tabla ventas y verifica que se presente de la siguiente manera:
SELECT * FROM ventas;