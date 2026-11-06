
CREATE DATABASE HotelPatitas_Practica;
USE HotelPatitas_Practica;
CREATE TABLE Cliente AS SELECT * FROM Hotel_Patitas.Cliente;
CREATE TABLE Mascota AS SELECT * FROM Hotel_Patitas.Mascota;
CREATE TABLE Estancia AS SELECT * FROM Hotel_Patitas.Estancia;
CREATE TABLE Servicio AS SELECT * FROM Hotel_Patitas.Servicio;
CREATE TABLE EstanciaServicio AS SELECT * FROM Hotel_Patitas.EstanciaServicio;

ALTER TABLE Cliente
ADD PRIMARY KEY (id_cliente);
ALTER TABLE Mascota
ADD PRIMARY KEY (id_mascota);
ALTER TABLE Estancia 
ADD PRIMARY KEY (id_estancia);
ALTER TABLE Servicio 
ADD PRIMARY KEY (id_servicio);

ALTER TABLE EstanciaServicio 
ADD PRIMARY KEY (id_estancia, id_servicio);

ALTER TABLE Cliente
MODIFY COLUMN id_cliente INT NOT NULL AUTO_INCREMENT;
ALTER TABLE Mascota
MODIFY COLUMN id_mascota INT NOT NULL AUTO_INCREMENT;
ALTER TABLE Estancia 
MODIFY COLUMN id_estancia INT NOT NULL AUTO_INCREMENT;
ALTER TABLE Servicio 
MODIFY COLUMN id_servicio INT NOT NULL AUTO_INCREMENT;

ALTER TABLE Mascota
ADD CONSTRAINT fk_mascota_cliente
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente);

ALTER TABLE Estancia 
ADD CONSTRAINT fk_estancia_mascota
FOREIGN KEY (id_mascota) REFERENCES Mascota(id_mascota);

ALTER TABLE EstanciaServicio
ADD CONSTRAINT fk_estancia_servicio_estancia
FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio);

ALTER TABLE Mascota
ADD COLUMN color VARCHAR(30);

ALTER TABLE Cliente
ADD COLUMN codigo_externo  VARCHAR(20) FIRST;
ALTER TABLE Mascota
ADD COLUMN raza VARCHAR(50) AFTER especie;
ALTER TABLE Servicio
ADD COLUMN descripcion VARCHAR(150) AFTER nombre;


ALTER TABLE Mascota
MODIFY COLUMN raza VARCHAR(100);
ALTER TABLE Servicio 
MODIFY COLUMN descripcion VARCHAR(250) AFTER nombre;


ALTER TABLE Cliente
RENAME COLUMN telefono TO telefono_contacto;
ALTER TABLE Servicio
CHANGE COLUMN descripcion detalle VARCHAR(300);

ALTER TABLE Cliente
DROP COLUMN codigo_externo;
ALTER TABLE Mascota
DROP COLUMN color;


ALTER TABLE Mascota
ADD CONSTRAINT chk_peso CHECK (peso > 0);

ALTER TABLE Servicio 
ADD CONSTRAINT chk_precio CHECK (precio >= 0);

ALTER TABLE Estancia
ADD CONSTRAINT chk_fechas CHECK (fecha_salida > fecha_entrada);


ALTER TABLE Servicio 
ADD CONSTRAINT uq_nombre_servicio UNIQUE (nombre);


ALTER TABLE Mascota DROP CHECK chk_peso;
ALTER TABLE Servicio DROP INDEX uq_nombre_servicio;
ALTER TABLE Mascota DROP FOREIGN KEY fk_mascota_cliente;


ALTER TABLE Mascota
ADD CONSTRAINT fk_mascota_cliente
FOREIGN KEY (id_cliente)
REFERENCES Cliente(id_cliente);

DESCRIBE Cliente;
DESCRIBE Mascota;
DESCRIBE Servicio;
DESCRIBE Estancia;
DESCRIBE EstanciaServicio;
SHOW CREATE TABLE Mascota;
SHOW CREATE TABLE EstanciaServicio;
SHOW CREATE TABLE Servicio;

