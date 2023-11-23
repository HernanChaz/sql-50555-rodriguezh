CREATE DATABASE workshop_rodriguezh;

USE workshop_rodriguezh;

CREATE TABLE IF NOT EXISTS proveedor (
    id INT AUTO_INCREMENT,
    razon_social VARCHAR(30) NOT NULL,
    email VARCHAR(30),
    telefono VARCHAR(20),
    direccion VARCHAR(50),
    PRIMARY KEY (id),
    INDEX razon_social (razon_social)
);

CREATE TABLE IF NOT EXISTS articulo (
    id INT AUTO_INCREMENT,
    descripcion VARCHAR(30) NOT NULL,
    stock SMALLINT DEFAULT 0,
    cantidad_por_bulto SMALLINT,
    costo DECIMAL(8,2),
    precio_venta DECIMAL(8,2),
    categoría VARCHAR(20),
    PRIMARY KEY (id),
    INDEX descripcion (descripcion)
);

CREATE TABLE IF NOT EXISTS cuenta_proveedor (
    id INT AUTO_INCREMENT,
    id_proveedor INT UNIQUE NOT NULL,
    fecha_alta DATETIME DEFAULT CURRENT_TIMESTAMP(),
    saldo DECIMAL(8,2),
    PRIMARY KEY (id),
    CONSTRAINT fk_cuenta_proveedor_id FOREIGN KEY (id_proveedor) REFERENCES proveedor (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS cliente (
    cuil INT AUTO_INCREMENT,
    razon_social VARCHAR(30) UNIQUE NOT NULL,
    nombre_titular VARCHAR(30),
    email VARCHAR(30),
    direccion VARCHAR(50),
    telefono VARCHAR(20),
    PRIMARY KEY (cuil),
    INDEX (razon_social)
);

CREATE TABLE IF NOT EXISTS cuenta (
    id INT AUTO_INCREMENT,
    cuil_cliente INT NOT NULL,
    fecha_alta DATETIME DEFAULT CURRENT_TIMESTAMP(),
    limite_descubierto DECIMAL(8,2),
    saldo DECIMAL(8,2),
    PRIMARY KEY (id),
    CONSTRAINT fk_cuenta_cuilcliente FOREIGN KEY (cuil_cliente) REFERENCES cliente (cuil) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS pago (
    id INT AUTO_INCREMENT,
    cuil_cliente INT,
    id_proveedor INT,
    fecha_pago DATE,
    monto DECIMAL(8,2),
    PRIMARY KEY (id),
    CONSTRAINT fk_pago_idcliente FOREIGN KEY (cuil_cliente) REFERENCES cliente (cuil) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_pago_idproveedor FOREIGN KEY (id_proveedor) REFERENCES proveedor (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS presupuesto (
    id INT AUTO_INCREMENT,
    cuil_cliente INT NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_presupuesto_cliente FOREIGN KEY (cuil_cliente) REFERENCES cliente (cuil) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS item_presupuesto (
    id INT AUTO_INCREMENT,
    id_presupuesto INT NOT NULL,
    id_articulo INT NOT NULL,
    cantidad SMALLINT NOT NULL,
    precio DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_ip_idpresupuesto FOREIGN KEY (id_presupuesto) REFERENCES presupuesto (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_ip_idarticulo FOREIGN KEY (id_articulo) REFERENCES articulo (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS pedido (
    id INT AUTO_INCREMENT,
    id_presupuesto INT NOT NULL,
    cuil_cliente INT NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_pedido_presupuesto FOREIGN KEY (id_presupuesto) REFERENCES presupuesto (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (cuil_cliente) REFERENCES cliente (cuil) ON DELETE RESTRICT ON UPDATE CASCADE
);