INSERT INTO `workshop_rodriguezh`.`categoria` (`nombre`, `activo`) 
VALUES
('Accesorios', '1'),
('Cintas', '1'),
('Diluyentes', '1'),
('Lijas', '1');

INSERT INTO `workshop_rodriguezh`.`articulo` (`id_categoria`, `descripcion`, `cantidad_por_bulto`, `activo`)
VALUES
('4', 'Lija agua num 60', '50', '1'),
('4', 'Lija agua num 80', '50', '1'),
('4', 'Lija agua num 100', '50', '1'),
('4', 'Lija agua num 120', '50', '1'),
('4', 'Lija agua num 150', '50', '1'),
('4', 'Lija agua num 180', '50', '1'),
('4', 'Lija agua num 220', '50', '1'),
('4', 'Lija agua num 320', '50', '1'),
('4', 'Lija agua num 360', '50', '1'),
('4', 'Lija agua num 400', '50', '1'),
('4', 'Lija agua num 500', '50', '1'),
('4', 'Lija agua num 600', '50', '1'),
('4', 'Lija agua num 100', '50', '1'),
('4', 'Lija agua num 1200', '50', '1'),
('4', 'Lija agua num 1500', '50', '1'),
('4', 'Lija agua num 2000', '50', '1'),
('4', 'Lija agua num 2500', '50', '1'),
('2', 'Cinta 18 mm', '48', '1'),
('2', 'Cinta 24 mm', '36', '1'),
('2', 'Cinta 36 mm', '24', '1'),
('2', 'Cinta 48 mm', '20', '1');

INSERT INTO `workshop_rodriguezh`.`cliente` (`cuil`, `razon_social`, `nombre_titular`, `email`, `direccion`, `telefono`, `activo`)
VALUES
('100001', 'Cliente 1', 'C1', 'c1@gmail.com', 'Dir 1', '12345671', '1'),
('100002', 'Cliente 2', 'C2', 'c2@gmail.com', 'Dir 2', '12345672', '1'),
('100003', 'Cliente 3', 'C3', 'c3@gmail.com', 'Dir 3', '12345673', '1');


INSERT INTO `workshop_rodriguezh`.`proveedor` (`razon_social`, `email`, `telefono`, `direccion`, `activo`)
VALUES
('Proveedor 1', 'p1@gmail.com', '12346001', 'Dir Prov 1', '1'),
('Proveedor 2', 'p2@gmail.com', '12346002', 'Dir Prov 2', '1'),
('Proveedor 3', 'p3@gmail.com', '12346003', 'Dir Prov 3', '1');


INSERT INTO `workshop_rodriguezh`.`cuenta` (`cuil_cliente`, `isProveedor`, `fecha_alta`, `activo`)
VALUES
('100001', '0', '2023-12-05 00:00:00', '1'),
('100002', '0', '2023-12-05 00:00:00', '1');

INSERT INTO `workshop_rodriguezh`.`cuenta` (`id_proveedor`, `isProveedor`, `fecha_alta`, `activo`)
VALUES
('1', '1', '2023-12-05 00:00:00', '1'),
('2', '1', '2023-12-05 00:00:00', '1');
