-- 9959-18-5201 Angel Antonio Vail Chacón
-- 							Serie II, Caso Practico, Analisis

CREATE DATABASE TrasladoProd;
USE TrasladoProd;
#DROP DATABASE TrasladoProd;

create table empresa(
	idEmpresa varchar(15) primary key not null,
	nit varchar(13) not null,
    nombre varchar(35) not null,
    direccion text not null,
    telefono int(10) not null,
    estatus char(1) not null
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

create table proveedor(
	idProveedor varchar(15),
	nombre varchar(100) not NULL,
	direccion varchar(500) not NULL,
	telefono int not NULL,
	email varchar(200) not NULL,
	idEmpresa varchar(15),
	estado varchar(1),
	primary key (idProveedor),
	foreign key (idEmpresa) references empresa (idEmpresa)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create table bodega(
	pkid varchar(15) primary key,
	nombre varchar(30) not null,
	direccion varchar(65) not null,
	estado varchar(1) not null
)engine=InnoDB DEFAULT CHARSET=latin1;

create table sucursal(
	idSucursal varchar(15) primary key not null,
	idEmpresa varchar(15) not null,
    nombre varchar(35) not null,
    direccion text not null,
    telefono int(10) not null,
    codigoPostal int not null,
    estatus char(1) not null,
    
    foreign key (idEmpresa) references empresa (idEmpresa)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

create table tipoInventario(
	Pkid varchar(15) primary key,
	nombre varchar(30) not null,
	estatus varchar(1)
)engine=InnoDB DEFAULT CHARSET=latin1;

create table Inventario(
	Pkid varchar(15) primary key,
	fkidsucursal varchar(15) not null,
	Fktipoinventario varchar(15) not null,
	fkidbodega varchar(15) NOT NULL,

	foreign key (Fktipoinventario) references TipoInventario (Pkid),
	foreign key (Fkidsucursal) references sucursal (idsucursal),
	foreign key (Fkidbodega) references bodega (pkid)
)engine=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE marca (
	idMarca varchar(15),
	nombre varchar(100) not NULL,
	descripcion varchar(500) not NULL,
	primary key (idMarca)
 )ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE linea (
	idLinea varchar(15),
	nombre varchar(100) not NULL,
	descripcion varchar(500) not NULL,
	idMarca varchar(15) not null,
	primary key (idLinea),
	foreign key (idMarca) references marca (idMarca)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create table producto (
	pkid varchar(15) primary key,
	fkinventario varchar(15) not null,
	Nombre varchar(30) not null,
	Fkidlinea varchar(15) not null,
    Existencia int not null,
    StockMaximo int not null,
    StockMinimo int not null,
    Fecha_Vencimiento date not null,
	Costo float not null,
	Precio float not null,
	Estatus varchar(1),
	foreign key (Fkidlinea) references linea (idLinea),
	foreign key (fkinventario) references inventario (Pkid)
)engine=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE trasladoProducto(
	pkId VARCHAR(15) PRIMARY KEY,
	fkidbodegaO VARCHAR(15) NOT NULL, 
	fkidbodegaD VARCHAR(15) NOT NULL,
	fecha DATE not null,
    fkidproducto VARCHAR(15) NOT NULL,
	cantidadtraslado INT not null,
    foreign key (fkidbodegaO) references bodega(pkid),
    foreign key (fkidbodegaD) references bodega(pkid),
    foreign key (fkidproducto) references producto(pkid)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create table ordencompra(
  idOrdenCompra varchar(15),
  idProveedor	varchar(15) not null,
  total			float not null,
  fecha 		date,
  descripcion	varchar(100),
  primary key (idOrdenCompra),
  foreign key (idProveedor) references proveedor (idProveedor)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE facturaEncabezado (
  idFacturaEncabezado varchar(15),
  idProveedor varchar(15) not NULL,
  fecha date,
  descripcion varchar(200),
  total float not null,
  idOrdenCompra varchar(15) not null,
  primary key(idFacturaEncabezado),
  foreign key (idProveedor) references proveedor(idProveedor),  
  foreign key (idOrdenCompra) references ordencompra (idOrdenCompra)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create table facturaDetalle(
	idFacturaDetalle varchar(15), 
	idFacturaEncabezado varchar(15),
	idProducto			varchar(15),
	monto float,
	concepto varchar(65),
	primary key(idFacturaDetalle),
    foreign key (idFacturaEncabezado) references facturaEncabezado (idFacturaEncabezado),
    foreign key (idProducto) references producto (pkid)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

create table movimiento (
  idMovimiento  varchar(15),
  idOrdenCompra varchar(15) not null,
  total			float,
  abonado		float,
  stsMov		varchar(1),
  primary key	(idMovimiento),
  foreign key   (idOrdenCompra) references ordencompra (idOrdenCompra)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;