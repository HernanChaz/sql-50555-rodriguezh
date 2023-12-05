CREATE DATABASE workshop_rodriguezh;

USE workshop_rodriguezh;

CREATE TABLE IF NOT EXISTS proveedor (
    id INT AUTO_INCREMENT,
    razon_social VARCHAR(30) NOT NULL,
    email VARCHAR(30),
    telefono VARCHAR(20),
    direccion VARCHAR(50),
    activo BOOLEAN NOT NULL DEFAULT true,
    PRIMARY KEY (id),
    INDEX razon_social (razon_social)
);

CREATE TABLE IF NOT EXISTS categoria (
	id INT AUTO_INCREMENT,
    nombre VARCHAR(20),
    activo BOOLEAN NOT NULL,
    PRIMARY KEY (id),
    INDEX (nombre)
);

CREATE TABLE IF NOT EXISTS articulo (
    id INT AUTO_INCREMENT,
    id_categoria INT NOT NULL,
    descripcion VARCHAR(30) NOT NULL,
    stock SMALLINT DEFAULT 0,
    cantidad_por_bulto SMALLINT,
    costo DECIMAL(8,2),
    precio_venta DECIMAL(8,2),
    activo BOOLEAN NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_articulo_categoria FOREIGN KEY (id_categoria) REFERENCES categoria (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    INDEX descripcion (descripcion)
);

CREATE TABLE IF NOT EXISTS cliente (
    cuil INT AUTO_INCREMENT,
    razon_social VARCHAR(30) UNIQUE NOT NULL,
    nombre_titular VARCHAR(30),
    email VARCHAR(30),
    direccion VARCHAR(50),
    telefono VARCHAR(20),
    activo BOOLEAN NOT NULL,
    PRIMARY KEY (cuil),
    INDEX (razon_social)
);

CREATE TABLE IF NOT EXISTS cuenta (
    id INT AUTO_INCREMENT,
    cuil_cliente INT,
    id_proveedor INT,
    isProveedor BOOLEAN NOT NULL DEFAULT false,
    fecha_alta DATETIME DEFAULT CURRENT_TIMESTAMP(),
    limite_descubierto DECIMAL(8,2),
    saldo DECIMAL(8,2),
    activo BOOLEAN NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_cuenta_cuilcliente FOREIGN KEY (cuil_cliente) REFERENCES cliente (cuil) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_cuenta_idproveedor FOREIGN KEY (id_proveedor) REFERENCES proveedor (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS pago (
    id INT AUTO_INCREMENT,
    cuil_cliente INT,
    id_proveedor INT,
    fecha_pago DATE,
    monto DECIMAL(8,2),
    activo BOOLEAN NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_pago_idcliente FOREIGN KEY (cuil_cliente) REFERENCES cliente (cuil) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_pago_idproveedor FOREIGN KEY (id_proveedor) REFERENCES proveedor (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS presupuesto (
    id INT AUTO_INCREMENT,
    cuil_cliente INT NOT NULL,
    fecha DATE NOT NULL,
    activo BOOLEAN NOT NULL,
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
    activo BOOLEAN NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_pedido_presupuesto FOREIGN KEY (id_presupuesto) REFERENCES presupuesto (id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (cuil_cliente) REFERENCES cliente (cuil) ON DELETE RESTRICT ON UPDATE CASCADE
);