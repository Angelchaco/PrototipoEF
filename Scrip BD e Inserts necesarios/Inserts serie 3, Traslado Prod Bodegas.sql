-- 9959-18-5201 Angel Antonio Vail Chacón
-- 											Serie III

USE TrasladoProd;

INSERT INTO bodega values ('1','Bodega1','Zona 2','A');
INSERT INTO `trasladoprod`.`empresa` (`idEmpresa`, `nit`, `nombre`, `direccion`, `telefono`, `estatus`) VALUES ('1', '2546546', 'Emp1', 'Zona 1', '15648', 'A');
INSERT INTO `trasladoprod`.`sucursal` (`idSucursal`, `idEmpresa`, `nombre`, `direccion`, `telefono`, `codigoPostal`, `estatus`) VALUES ('1', '1', 'Sucursal1', 'Zona 12', '64815485', '1', 'A');
INSERT INTO `trasladoprod`.`tipoinventario` (`Pkid`, `nombre`, `estatus`) VALUES ('1', 'InventarioCompras', 'A');
INSERT INTO `trasladoprod`.`inventario` (`Pkid`, `fkidsucursal`, `Fktipoinventario`, `fkidbodega`) VALUES ('1', '1', '1', '1');
INSERT INTO `trasladoprod`.`marca` (`idMarca`, `nombre`, `descripcion`) VALUES ('1', 'Marca1', 'marca 1');
INSERT INTO `trasladoprod`.`linea` (`idLinea`, `nombre`, `descripcion`, `idMarca`) VALUES ('1', 'Linea1', 'linea 1', '1');
INSERT INTO `trasladoprod`.`producto` (`pkid`, `fkinventario`, `Nombre`, `Fkidlinea`, `Existencia`, `StockMaximo`, `StockMinimo`, `Fecha_Vencimiento`, `Costo`, `Precio`, `Estatus`) VALUES ('1', '1', 'Prod1', '1', '20', '50', '15', '2021/11/25', '12', '13', 'A');
