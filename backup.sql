BEGIN TRANSACTION;
CREATE TABLE clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    apellidos TEXT,
    celular TEXT,
    referencia TEXT
, email TEXT);
INSERT INTO "clientes" VALUES(1,'edgar','olvera','4521080681','agencia',NULL);
INSERT INTO "clientes" VALUES(2,'fdff','sss','333','sss',NULL);
INSERT INTO "clientes" VALUES(3,'edgar','olvera','4521080681','agencia',NULL);
INSERT INTO "clientes" VALUES(4,'edgar','olvera','4521080681','d',NULL);
INSERT INTO "clientes" VALUES(5,'edgar','olvera','4521080681','agencia',NULL);
INSERT INTO "clientes" VALUES(6,'luis','angel','4525451233','chino','g@hh.com');
INSERT INTO "clientes" VALUES(7,'ronaldo','juju','78y8','ihio','y@ff.com');
INSERT INTO "clientes" VALUES(8,'lionel','messi suarez','988','agencia','ns@x.com');
INSERT INTO "clientes" VALUES(9,'lionel','messi lopez','987987','ihoh','hghg@dsd.com');
INSERT INTO "clientes" VALUES(10,'lionel','messi lopez','2333','agencia','h@ht.com');
INSERT INTO "clientes" VALUES(11,'lionel','messi lopez','987987','agencia','hghg@dsd.com');
INSERT INTO "clientes" VALUES(12,'roo','olvera','4521363065','agencia','ron@gmail.com');
INSERT INTO "clientes" VALUES(13,'pedro','paramo','8787','ojh','ji@fjjf.com');
INSERT INTO "clientes" VALUES(14,'pedro','picapiedra','85847373','dioj','yabdabauu@hotmail.com');
INSERT INTO "clientes" VALUES(15,'rococo','perez','5656','ojo','kk@kk.com');
INSERT INTO "clientes" VALUES(16,'sarai','olvera','45234576','kij','hj@jk.com');
INSERT INTO "clientes" VALUES(17,'lulu','lolu','333','kjhjk','ss@kk.com');
INSERT INTO "clientes" VALUES(18,'edgar','messi lopez','s','agencia','edgarviajasiempre@gmail.com');
INSERT INTO "clientes" VALUES(19,'mauricio','silva','45327890','edgar amigo','chino@blu.com');
INSERT INTO "clientes" VALUES(20,'zidane','zizu','8','','admin@agencia.com');
INSERT INTO "clientes" VALUES(21,'raul ','gonzales','9090','real madrid','real@ij.com');
INSERT INTO "clientes" VALUES(22,'pele','menso','98867','ijij','jh@ij.com');
INSERT INTO "clientes" VALUES(23,'armando','manzanero','0909','kjk','lk@ok.com');
INSERT INTO "clientes" VALUES(24,'roonie','olvera','4521363065','familia','ok@ok.com');
INSERT INTO "clientes" VALUES(25,'jose luis','persea','875654','okok','okok@oij.com');
INSERT INTO "clientes" VALUES(26,'rosalba','madrigal','097654','poopo','ok@hotmail.com');
INSERT INTO "clientes" VALUES(27,'luis miguel','fallador','908765','agencia','uhuh@m.com');
INSERT INTO "clientes" VALUES(28,'aryna','sabalenka','','tenis','oio@lkm-com');
INSERT INTO "clientes" VALUES(29,'alan ','parson','98798','borrachaso el amigo','ok@ddd.com');
INSERT INTO "clientes" VALUES(30,'eduard','lozano','09890','ojn','kmok@jnok.com');
INSERT INTO "clientes" VALUES(31,'pete ','sampras','09809','ijh','kompo@ojno.com');
INSERT INTO "clientes" VALUES(32,'luis','conrriquez','222','cantante','lk@lkl.com');
INSERT INTO "clientes" VALUES(33,'luis ','figo','','','');
INSERT INTO "clientes" VALUES(34,'edgar','zamora','','','');
INSERT INTO "clientes" VALUES(35,'tere','zamora','333','agencia','edgarviajasiempre@gmail.com');
INSERT INTO "clientes" VALUES(36,'lionel','olvera','333','agencia','admin@agencia.com');
INSERT INTO "clientes" VALUES(37,'zinedine','zamora','333','agencia','edgarviajasiempre@gmail.com');
INSERT INTO "clientes" VALUES(38,'fernando','messi lopez','333','borrachaso el amigo','admin@agencia.com');
INSERT INTO "clientes" VALUES(39,'ronaldo','nazareo','4521080681','','admin@agencia.com');
INSERT INTO "clientes" VALUES(40,'ronaldo','paramo','4521080681','agencia','admin@agencia.com');
INSERT INTO "clientes" VALUES(41,'fernando','zamora','4521080681','agencia','edgarviajasiempre@gmail.com');
INSERT INTO "clientes" VALUES(42,'zinedine','paramo','4521080681','agencia','admin@agencia.com');
INSERT INTO "clientes" VALUES(43,'fernando','olvera','4521080681','agencia','admin@agencia.com');
INSERT INTO "clientes" VALUES(44,'zinedine','messi lopez','4521080681','agencia','admin@agencia.com');
INSERT INTO "clientes" VALUES(45,'edgar','paramo','','chino','admin@agencia.com');
INSERT INTO "clientes" VALUES(46,'fernando','zidane','876554','d','admin@agencia.com');
INSERT INTO "clientes" VALUES(47,'fernando','paramo','4521655920','d','kj@ij.com');
CREATE TABLE habitaciones (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    reservacion_id INTEGER NOT NULL,
    habitacion_num INTEGER NOT NULL,
    adultos INTEGER,
    menores INTEGER,
    edades TEXT, numero_habitacion INTEGER,
    FOREIGN KEY (reservacion_id) REFERENCES reservaciones(id)
);
INSERT INTO "habitaciones" VALUES(1,6,1,NULL,NULL,NULL,NULL);
INSERT INTO "habitaciones" VALUES(2,6,2,NULL,NULL,NULL,NULL);
INSERT INTO "habitaciones" VALUES(3,7,1,2,1,'3',NULL);
INSERT INTO "habitaciones" VALUES(4,7,2,2,1,'2',NULL);
INSERT INTO "habitaciones" VALUES(5,8,1,2,0,'',NULL);
INSERT INTO "habitaciones" VALUES(6,8,2,1,2,'5,8',NULL);
INSERT INTO "habitaciones" VALUES(7,9,1,3,1,'',NULL);
INSERT INTO "habitaciones" VALUES(8,10,1,2,1,'4',NULL);
INSERT INTO "habitaciones" VALUES(9,10,2,3,1,'4',NULL);
INSERT INTO "habitaciones" VALUES(10,11,1,2,0,'',NULL);
INSERT INTO "habitaciones" VALUES(11,12,1,2,0,'',NULL);
INSERT INTO "habitaciones" VALUES(12,13,1,2,0,'',NULL);
INSERT INTO "habitaciones" VALUES(13,14,1,1,0,'',NULL);
INSERT INTO "habitaciones" VALUES(14,15,1,1,0,'',NULL);
INSERT INTO "habitaciones" VALUES(15,16,1,1,0,'',NULL);
INSERT INTO "habitaciones" VALUES(16,17,1,2,0,'',NULL);
INSERT INTO "habitaciones" VALUES(17,18,1,1,0,'',NULL);
INSERT INTO "habitaciones" VALUES(18,19,1,2,'','',NULL);
INSERT INTO "habitaciones" VALUES(19,20,1,2,'','',NULL);
INSERT INTO "habitaciones" VALUES(20,26,1,2,1,'3',NULL);
INSERT INTO "habitaciones" VALUES(21,30,1,2,'','',NULL);
INSERT INTO "habitaciones" VALUES(22,31,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(23,32,1,2,2,'3,4',NULL);
INSERT INTO "habitaciones" VALUES(24,35,1,2,'','',NULL);
INSERT INTO "habitaciones" VALUES(25,36,1,2,'','',NULL);
INSERT INTO "habitaciones" VALUES(26,37,1,2,'','',NULL);
INSERT INTO "habitaciones" VALUES(27,38,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(28,40,1,2,'','',NULL);
INSERT INTO "habitaciones" VALUES(29,42,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(30,43,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(31,44,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(32,45,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(33,46,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(34,47,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(35,48,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(36,49,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(37,50,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(38,51,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(39,52,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(40,53,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(41,54,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(42,55,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(43,56,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(44,57,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(45,58,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(46,59,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(47,60,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(48,61,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(49,62,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(50,63,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(51,64,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(52,65,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(53,66,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(54,67,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(55,68,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(56,69,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(57,70,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(58,76,1,1,'','',NULL);
INSERT INTO "habitaciones" VALUES(59,77,1,1,'','',NULL);
CREATE TABLE pagos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    reservacion_id INTEGER NOT NULL,
    tipo_pago TEXT NOT NULL,
    monto REAL NOT NULL,
    fecha TEXT NOT NULL, forma_pago TEXT, observacion TEXT, recibo_id INTEGER, proveedor_id INTEGER, tarjeta_id INTEGER, fecha_limite DATE, concepto TEXT, fecha_registro DATETIME,
    FOREIGN KEY (reservacion_id) REFERENCES reservaciones(id)
);
INSERT INTO "pagos" VALUES(1,4,'cliente_agencia',10.0,'2026-01-02 00:40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-02 00:40');
INSERT INTO "pagos" VALUES(2,4,'agencia_proveedor',5.0,'2026-01-02 00:40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-02 00:40');
INSERT INTO "pagos" VALUES(3,5,'cliente_agencia',50.0,'2026-01-02 01:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-02 01:04');
INSERT INTO "pagos" VALUES(4,5,'agencia_proveedor',40.0,'2026-01-02 01:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-02 01:04');
INSERT INTO "pagos" VALUES(5,4,'cliente_agencia',23.0,'2026-01-02 02:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-02 02:10');
INSERT INTO "pagos" VALUES(6,6,'cliente_agencia',0.02,'2026-01-02 02:43',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-02 02:43');
INSERT INTO "pagos" VALUES(7,6,'cliente_agencia',2000.0,'2026-01-02 02:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-02 02:44');
INSERT INTO "pagos" VALUES(8,6,'cliente_agencia',8000.0,'2026-01-02 02:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-02 02:45');
INSERT INTO "pagos" VALUES(9,7,'cliente_agencia',1000.0,'2026-01-02 03:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-02 03:18');
INSERT INTO "pagos" VALUES(10,7,'cliente_agencia',1000.0,'2026-01-02 03:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-02 03:18');
INSERT INTO "pagos" VALUES(11,11,'Cliente a Agencia',111.0,'2026-01-02 21:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-02 21:24');
INSERT INTO "pagos" VALUES(12,12,'Cliente a Agencia',20.0,'2026-01-02 22:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-02 22:08');
INSERT INTO "pagos" VALUES(13,13,'Cliente_Agencia',2.0,'2026-01-02 22:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-02 22:34');
INSERT INTO "pagos" VALUES(14,13,'Cliente_Agencia',8.0,'2026-01-02 22:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-02 22:35');
INSERT INTO "pagos" VALUES(15,13,'Cliente_Agencia',2.0,'2026-01-02 23:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-02 23:17');
INSERT INTO "pagos" VALUES(16,11,'Cliente_Agencia',50.0,'2026-01-02 23:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-02 23:18');
INSERT INTO "pagos" VALUES(17,11,'cliente_agencia',100.0,'2026-01-02 23:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-02 23:32');
INSERT INTO "pagos" VALUES(18,11,'cliente_agencia',11.0,'2026-01-02 23:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-02 23:51');
INSERT INTO "pagos" VALUES(19,13,'cliente_agencia',11.0,'2026-01-02 23:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-02 23:51');
INSERT INTO "pagos" VALUES(20,10,'cliente_agencia',45.0,'2026-01-03 00:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-03 00:21');
INSERT INTO "pagos" VALUES(21,10,'agencia_proveedor',20.0,'2026-01-03 00:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-03 00:23');
INSERT INTO "pagos" VALUES(22,11,'agencia_proveedor',40.0,'2026-01-03 00:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-03 00:23');
INSERT INTO "pagos" VALUES(23,9,'cliente_agencia',1000.0,'2026-01-03 00:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-03 00:29');
INSERT INTO "pagos" VALUES(24,7,'agencia_proveedor',400.0,'2026-01-03 00:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-01-03 00:34');
INSERT INTO "pagos" VALUES(25,8,'cliente_agencia',1000.0,'2026-01-03 03:22:58','Efectivo','pago perro perez',NULL,NULL,NULL,NULL,NULL,'2026-01-03 03:22:58');
INSERT INTO "pagos" VALUES(26,12,'cliente_agencia',44.0,'2026-01-03 04:17:10','Efectivo','pago perro perez',NULL,NULL,NULL,NULL,NULL,'2026-01-03 04:17:10');
INSERT INTO "pagos" VALUES(27,12,'cliente_agencia',6.0,'2026-01-03 04:23:32','Efectivo','hh',NULL,NULL,NULL,NULL,NULL,'2026-01-03 04:23:32');
INSERT INTO "pagos" VALUES(28,12,'cliente_agencia',5.0,'2026-01-03 04:23:40','Efectivo','ggg',NULL,NULL,NULL,NULL,NULL,'2026-01-03 04:23:40');
INSERT INTO "pagos" VALUES(29,3,'cliente_agencia',2.0,'2026-01-03 18:24:35','Efectivo','dd',NULL,NULL,NULL,NULL,NULL,'2026-01-03 18:24:35');
INSERT INTO "pagos" VALUES(30,3,'cliente_agencia',3.0,'2026-01-03 18:26:22','Efectivo','ddd',NULL,NULL,NULL,NULL,NULL,'2026-01-03 18:26:22');
INSERT INTO "pagos" VALUES(31,14,'cliente_agencia',300.0,'2026-01-03 18:28:24','Efectivo','edgar',NULL,NULL,NULL,NULL,NULL,'2026-01-03 18:28:24');
INSERT INTO "pagos" VALUES(32,14,'cliente_agencia',200.0,'2026-01-03 18:29:37','Efectivo','yyyy',NULL,NULL,NULL,NULL,NULL,'2026-01-03 18:29:37');
INSERT INTO "pagos" VALUES(33,14,'cliente_agencia',100.0,'2026-01-03 18:55:17','Efectivo','jjj',NULL,NULL,NULL,NULL,NULL,'2026-01-03 18:55:17');
INSERT INTO "pagos" VALUES(34,1,'cliente_agencia',32.0,'2026-01-03 19:21:14','Efectivo','gn',NULL,NULL,NULL,NULL,NULL,'2026-01-03 19:21:14');
INSERT INTO "pagos" VALUES(35,8,'cliente_agencia',200.0,'2026-01-03 19:49:23','Efectivo','..',1,NULL,NULL,NULL,NULL,'2026-01-03 19:49:23');
INSERT INTO "pagos" VALUES(36,14,'cliente_agencia',100.0,'2026-01-03 20:00:17','Efectivo',',,,,',2,NULL,NULL,NULL,NULL,'2026-01-03 20:00:17');
INSERT INTO "pagos" VALUES(37,12,'cliente_agencia',30.0,'2026-01-03 20:00:42','Efectivo','gre',3,NULL,NULL,NULL,NULL,'2026-01-03 20:00:42');
INSERT INTO "pagos" VALUES(38,14,'cliente_agencia',60.0,'2026-01-03 20:18:25','Efectivo','{{',4,NULL,NULL,NULL,NULL,'2026-01-03 20:18:25');
INSERT INTO "pagos" VALUES(39,4,'cliente_agencia',23.0,'2026-01-03 20:19:37','Efectivo','',5,NULL,NULL,NULL,NULL,'2026-01-03 20:19:37');
INSERT INTO "pagos" VALUES(40,4,'cliente_agencia',60.0,'2026-01-03 20:19:57','Efectivo','fghh',6,NULL,NULL,NULL,NULL,'2026-01-03 20:19:57');
INSERT INTO "pagos" VALUES(41,12,'cliente_agencia',50.0,'2026-01-03 20:23:17','Efectivo','gracias',7,NULL,NULL,NULL,NULL,'2026-01-03 20:23:17');
INSERT INTO "pagos" VALUES(42,15,'cliente_agencia',100.0,'2026-01-03 20:32:42','Efectivo','tut',8,NULL,NULL,NULL,NULL,'2026-01-03 20:32:42');
INSERT INTO "pagos" VALUES(43,15,'cliente_agencia',400.0,'2026-01-03 20:34:07','Efectivo','ññ',9,NULL,NULL,NULL,NULL,'2026-01-03 20:34:07');
INSERT INTO "pagos" VALUES(44,15,'cliente_agencia',1000.0,'2026-01-03 20:34:20','Efectivo','mm',10,NULL,NULL,NULL,NULL,'2026-01-03 20:34:20');
INSERT INTO "pagos" VALUES(45,6,'cliente_agencia',0.1,'2026-01-03 20:39:51','Efectivo','k',11,NULL,NULL,NULL,NULL,'2026-01-03 20:39:51');
INSERT INTO "pagos" VALUES(46,15,'cliente_agencia',3000.0,'2026-01-03 23:46:12','Efectivo','',12,NULL,NULL,NULL,NULL,'2026-01-03 23:46:12');
INSERT INTO "pagos" VALUES(47,18,'cliente_agencia',1000.0,'2026-01-08 11:54:30','Efectivo','prueba1',13,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "pagos" VALUES(48,18,'cliente_agencia',1500.0,'2026-01-08 12:11:41','Efectivo','prueba 2',14,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "pagos" VALUES(49,12,'cliente_agencia',30.0,'2026-01-08 13:14:06','Efectivo','',15,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "pagos" VALUES(50,36,'cliente_agencia',200.0,'2026-01-22 02:38:47','Efectivo','ggg',16,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "pagos" VALUES(51,36,'agencia_proveedor',760.0,'2026-01-22 02:41:41','T Crédito','hh',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO "pagos" VALUES(52,38,'cliente_agencia',100.0,'2026-01-24 18:50:53','Efectivo','',17,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(53,13,'agencia_proveedor',6.0,'2026-01-25 22:47:54','Efectivo','ff',18,NULL,NULL,NULL,'Penalidad Proveedor',NULL);
INSERT INTO "pagos" VALUES(54,13,'cliente_agencia',6.0,'2026-01-25 22:47:54','Efectivo','ff',19,NULL,NULL,NULL,'Penalidad Cliente',NULL);
INSERT INTO "pagos" VALUES(55,13,'agencia_cliente',5.0,'2026-01-25 22:47:54','Efectivo','ff',20,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(56,15,'agencia_proveedor',2000.0,'2026-01-25 23:40:51','Efectivo','propotipo',21,NULL,NULL,NULL,'Penalidad Proveedor',NULL);
INSERT INTO "pagos" VALUES(57,15,'cliente_agencia',2000.0,'2026-01-25 23:40:51','Efectivo','propotipo',22,NULL,NULL,NULL,'Penalidad Cliente',NULL);
INSERT INTO "pagos" VALUES(58,15,'agencia_cliente',2000.0,'2026-01-25 23:40:51','Efectivo','propotipo',23,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(59,15,'cliente_agencia',1.0,'2026-01-26 00:00:34','Efectivo','pago perro perez',24,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(60,10,'agencia_proveedor',10.0,'2026-01-26 11:44:34','Efectivo','frf',25,NULL,NULL,NULL,'Penalidad Proveedor',NULL);
INSERT INTO "pagos" VALUES(61,10,'proveedor_agencia',35.0,'2026-01-26 11:44:34','Transferencia','frf',26,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(62,10,'cliente_agencia',10.0,'2026-01-26 11:44:34','Efectivo','frf',27,NULL,NULL,NULL,'Penalidad Cliente',NULL);
INSERT INTO "pagos" VALUES(63,10,'agencia_cliente',25.0,'2026-01-26 11:44:34','Efectivo','frf',28,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(64,11,'agencia_proveedor',10.0,'2026-01-26 14:11:11','Transferencia','',29,NULL,NULL,NULL,'Penalidad Proveedor',NULL);
INSERT INTO "pagos" VALUES(65,11,'proveedor_agencia',30.0,'2026-01-26 14:11:11','Transferencia','',30,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(66,11,'agencia_cliente',96.0,'2026-01-26 14:11:11','Transferencia','',31,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(67,40,'cliente_agencia',500.0,'2026-01-26 14:30:15','Efectivo','prueba',32,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(68,40,'agencia_proveedor',200.0,'2026-01-26 14:30:39','Efectivo','prueba',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(69,40,'agencia_proveedor',100.0,'2026-01-26 14:38:24','Transferencia','',33,NULL,NULL,NULL,'Penalidad Proveedor',NULL);
INSERT INTO "pagos" VALUES(70,40,'cliente_agencia',50.0,'2026-01-26 14:38:24','Efectivo','',34,NULL,NULL,NULL,'Penalidad Cliente',NULL);
INSERT INTO "pagos" VALUES(71,40,'proveedor_agencia',100.0,'2026-01-26 14:38:24','Transferencia','',35,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(72,40,'agencia_cliente',450.0,'2026-01-26 14:38:24','Transferencia','',36,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(73,41,'cliente_agencia',1000.0,'2026-01-26 15:15:30','Efectivo','',37,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(74,41,'agencia_proveedor',300.0,'2026-01-26 15:15:53','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(75,41,'agencia_proveedor',100.0,'2026-01-26 15:30:34','Transferencia','prueba',38,NULL,NULL,NULL,'Penalidad Proveedor',NULL);
INSERT INTO "pagos" VALUES(76,41,'cliente_agencia',100.0,'2026-01-26 15:30:34','Efectivo','prueba',39,NULL,NULL,NULL,'Penalidad Cliente',NULL);
INSERT INTO "pagos" VALUES(77,41,'agencia_cliente',800.0,'2026-01-26 15:30:34','Transferencia','prueba',40,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(78,42,'cliente_agencia',300.0,'2026-01-27 00:00:33','Efectivo','',41,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(79,42,'agencia_proveedor',200.0,'2026-01-27 00:01:06','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(80,42,'agencia_proveedor',200.0,'2026-01-27 00:03:05','Transferencia','',42,NULL,NULL,NULL,'Penalidad Proveedor',NULL);
INSERT INTO "pagos" VALUES(81,42,'cliente_agencia',100.0,'2026-01-27 00:03:05','Efectivo','',43,NULL,NULL,NULL,'Penalidad Cliente',NULL);
INSERT INTO "pagos" VALUES(82,35,'cliente_agencia',1200.0,'2026-01-27 00:17:31','Efectivo','',44,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(83,35,'agencia_proveedor',300.0,'2026-01-27 00:18:00','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(84,35,'agencia_proveedor',100.0,'2026-01-27 00:18:42','Transferencia','',45,NULL,NULL,NULL,'Penalidad Proveedor',NULL);
INSERT INTO "pagos" VALUES(85,35,'cliente_agencia',100.0,'2026-01-27 00:18:42','Efectivo','',46,NULL,NULL,NULL,'Penalidad Cliente',NULL);
INSERT INTO "pagos" VALUES(86,35,'agencia_cliente',1000.0,'2026-01-27 00:18:42','Transferencia','',47,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(87,7,'agencia_proveedor',200.0,'2026-01-27 00:29:07','Transferencia','',48,NULL,NULL,NULL,'Penalidad Proveedor',NULL);
INSERT INTO "pagos" VALUES(88,7,'cliente_agencia',100.0,'2026-01-27 00:29:07','Efectivo','',49,NULL,NULL,NULL,'Penalidad Cliente',NULL);
INSERT INTO "pagos" VALUES(89,7,'agencia_cliente',1700.0,'2026-01-27 00:29:07','Transferencia','',50,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(90,43,'cliente_agencia',1000.0,'2026-01-27 00:37:34','Efectivo','',51,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(91,43,'agencia_proveedor',600.0,'2026-01-27 00:37:49','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(92,43,'agencia_proveedor',200.0,'2026-01-27 00:38:15','Transferencia','',52,NULL,NULL,NULL,'Penalidad Proveedor',NULL);
INSERT INTO "pagos" VALUES(93,43,'cliente_agencia',100.0,'2026-01-27 00:38:15','Efectivo','',53,NULL,NULL,NULL,'Penalidad Cliente',NULL);
INSERT INTO "pagos" VALUES(94,43,'agencia_cliente',700.0,'2026-01-27 00:38:15','Transferencia','',54,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(95,23,'cliente_agencia',1200.0,'2026-01-27 17:23:34','Efectivo','',55,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(96,23,'agencia_proveedor',500.0,'2026-01-27 17:23:50','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(97,23,'proveedor_agencia',200.0,'2026-01-27 17:25:43','Ajuste','',56,NULL,NULL,NULL,'Penalidad Proveedor',NULL);
INSERT INTO "pagos" VALUES(98,23,'cliente_agencia',100.0,'2026-01-27 17:25:43','Penalización','',57,NULL,NULL,NULL,'Penalidad Cliente',NULL);
INSERT INTO "pagos" VALUES(99,23,'agencia_cliente',600.0,'2026-01-27 17:25:43','Transferencia','',58,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(100,17,'agencia_proveedor',7000.0,'2026-01-27 18:03:13','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(101,21,'cliente_agencia',100.0,'2026-01-27 18:03:58','Efectivo','',59,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(102,21,'agencia_proveedor',50.0,'2026-01-27 18:04:09','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(103,27,'cliente_agencia',1000.0,'2026-01-27 18:28:05','Efectivo','',60,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(104,27,'agencia_proveedor',50.0,'2026-01-27 18:28:32','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(105,27,'agencia_cliente',690.0,'2026-01-27 18:29:11','Transferencia','',61,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(106,30,'cliente_agencia',8000.0,'2026-01-27 19:01:14','Efectivo','',62,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(107,30,'agencia_proveedor',4000.0,'2026-01-27 19:01:27','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(108,30,'cliente_agencia',2000.0,'2026-01-27 19:01:54','Efectivo','',63,NULL,NULL,NULL,'Penalidad Cliente',NULL);
INSERT INTO "pagos" VALUES(109,30,'agencia_cliente',4000.0,'2026-01-27 19:01:54','Transferencia','',64,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(110,31,'cliente_agencia',8000.0,'2026-01-27 21:52:39','Efectivo','',65,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(111,31,'agencia_proveedor',1500.0,'2026-01-27 21:52:49','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(112,31,'agencia_cliente',6000.0,'2026-01-27 21:55:48','Transferencia','',66,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(113,33,'cliente_agencia',3000.0,'2026-01-27 22:01:38','Efectivo','',67,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(114,33,'agencia_proveedor',1000.0,'2026-01-27 22:01:49','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(115,33,'agencia_cliente',2000.0,'2026-01-27 22:05:54','Transferencia','',68,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(116,37,'cliente_agencia',8000.0,'2026-01-27 22:36:15','Efectivo','',69,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(117,37,'agencia_proveedor',50.0,'2026-01-27 22:37:06','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(118,26,'cliente_agencia',1000.0,'2026-01-27 22:52:09','Efectivo','',70,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(119,26,'agencia_proveedor',500.0,'2026-01-27 22:53:30','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(120,26,'proveedor_agencia',300.0,'2026-01-27 22:54:48','Transferencia','',71,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(121,39,'cliente_agencia',8000.0,'2026-01-27 23:18:40','Efectivo','',72,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(122,39,'agencia_proveedor',500.0,'2026-01-27 23:18:57','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(123,39,'agencia_proveedor',4500.0,'2026-01-27 23:21:47','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(124,36,'cliente_agencia',1000.0,'2026-01-27 23:22:39','Efectivo','',73,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(125,36,'proveedor_agencia',460.0,'2026-01-27 23:25:51','Transferencia','',74,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(126,32,'cliente_agencia',3900.0,'2026-01-27 23:32:45','Efectivo','',75,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(127,32,'agencia_proveedor',3000.0,'2026-01-27 23:33:12','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(128,32,'proveedor_agencia',2000.0,'2026-01-27 23:35:26','Transferencia','',76,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(129,32,'agencia_cliente',1900.0,'2026-01-27 23:35:26','Transferencia','',77,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(130,45,'cliente_agencia',500.0,'2026-01-28 21:42:15','Efectivo','',78,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(131,45,'agencia_proveedor',200.0,'2026-01-28 21:42:29','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(132,45,'proveedor_agencia',100.0,'2026-01-28 21:43:45','Transferencia','',79,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(133,45,'agencia_cliente',300.0,'2026-01-28 21:43:45','Transferencia','',80,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(134,46,'cliente_agencia',1000.0,'2026-01-28 21:47:27','Efectivo','',81,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(135,46,'agencia_proveedor',500.0,'2026-01-28 21:47:39','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(136,46,'proveedor_agencia',350.0,'2026-01-28 21:47:59','Transferencia','',82,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(137,47,'cliente_agencia',1000.0,'2026-01-29 10:22:55','Efectivo','',83,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(138,47,'cliente_agencia',1000.0,'2026-01-29 10:23:08','Efectivo','',84,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(139,47,'agencia_proveedor',1000.0,'2026-01-29 10:23:19','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(140,47,'proveedor_agencia',800.0,'2026-01-29 10:25:24','Transferencia','',85,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(141,48,'cliente_agencia',200.0,'2026-02-02 00:30:45','Efectivo','',86,NULL,NULL,NULL,'Penalidad Cliente',NULL);
INSERT INTO "pagos" VALUES(142,49,'cliente_agencia',500.0,'2026-02-02 00:32:10','Efectivo','',87,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(143,49,'agencia_proveedor',300.0,'2026-02-02 00:32:25','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(144,49,'proveedor_agencia',200.0,'2026-02-02 00:32:56','Transferencia','',88,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(145,50,'cliente_agencia',1000.0,'2026-02-02 00:42:44','Efectivo','',89,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(146,50,'agencia_proveedor',300.0,'2026-02-02 00:43:03','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(147,50,'proveedor_agencia',100.0,'2026-02-02 00:43:23','Transferencia','',90,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(148,50,'cliente_agencia',100.0,'2026-02-02 00:43:23','Efectivo','',91,NULL,NULL,NULL,'Penalidad Cliente',NULL);
INSERT INTO "pagos" VALUES(149,51,'cliente_agencia',2000.0,'2026-02-02 01:19:38','Efectivo','',92,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(150,51,'agencia_proveedor',500.0,'2026-02-02 01:19:51','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(151,52,'cliente_agencia',1500.0,'2026-02-02 02:01:09','Efectivo','',93,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(152,52,'agencia_proveedor',500.0,'2026-02-02 02:01:16','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(153,53,'cliente_agencia',1000.0,'2026-02-02 02:11:53','Efectivo','',94,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(154,53,'agencia_proveedor',500.0,'2026-02-02 02:12:03','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(155,53,'proveedor_agencia',200.0,'2026-02-02 02:12:19','Transferencia','',95,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(156,54,'cliente_agencia',2000.0,'2026-02-02 17:55:20','Efectivo','',96,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(157,54,'agencia_proveedor',700.0,'2026-02-02 17:55:41','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(158,55,'cliente_agencia',5000.0,'2026-02-02 18:44:37','Efectivo','',97,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(159,55,'agencia_proveedor',2000.0,'2026-02-02 18:45:29','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(160,55,'proveedor_agencia',1500.0,'2026-02-02 18:46:28','Transferencia','',98,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(161,55,'cliente_agencia',500.0,'2026-02-02 18:46:28','Efectivo','',99,NULL,NULL,NULL,'Penalidad Cliente',NULL);
INSERT INTO "pagos" VALUES(162,56,'cliente_agencia',2000.0,'2026-02-02 19:17:14','Efectivo','',100,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(163,56,'agencia_proveedor',500.0,'2026-02-02 19:17:27','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(164,56,'proveedor_agencia',300.0,'2026-02-02 19:17:52','Transferencia','',101,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(165,56,'cliente_agencia',300.0,'2026-02-02 19:17:52','Efectivo','',102,NULL,NULL,NULL,'Penalidad Cliente',NULL);
INSERT INTO "pagos" VALUES(166,57,'cliente_agencia',1500.0,'2026-02-02 19:31:06','Efectivo','',103,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(167,57,'agencia_proveedor',500.0,'2026-02-02 19:31:18','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(168,58,'cliente_agencia',2000.0,'2026-02-02 19:33:46','Efectivo','',104,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(169,58,'agencia_proveedor',600.0,'2026-02-02 19:34:18','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(170,58,'proveedor_agencia',400.0,'2026-02-02 19:34:37','Transferencia','',105,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(171,59,'cliente_agencia',1000.0,'2026-02-02 20:11:14','Efectivo','',106,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(172,59,'agencia_proveedor',500.0,'2026-02-02 20:11:33','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(173,59,'proveedor_agencia',200.0,'2026-02-02 20:11:52','Transferencia','',107,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(174,59,'agencia_cliente',200.0,'2026-02-02 20:11:52','Transferencia','',108,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(175,60,'cliente_agencia',1000.0,'2026-02-02 21:46:53','Efectivo','',109,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(176,60,'agencia_proveedor',600.0,'2026-02-02 21:47:06','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(177,61,'cliente_agencia',1200.0,'2026-02-02 21:54:45','Efectivo','',110,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(178,61,'agencia_proveedor',700.0,'2026-02-02 21:55:03','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(179,62,'cliente_agencia',1000.0,'2026-02-02 22:03:59','Efectivo','',111,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(180,62,'agencia_proveedor',500.0,'2026-02-02 22:04:06','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(181,63,'cliente_agencia',1000.0,'2026-02-02 22:20:38','Efectivo','',112,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(182,63,'agencia_proveedor',600.0,'2026-02-02 22:21:05','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(183,63,'proveedor_agencia',400.0,'2026-02-02 22:22:28','Transferencia','',113,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(184,64,'cliente_agencia',1000.0,'2026-02-02 22:25:03','Efectivo','',114,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(185,64,'agencia_proveedor',500.0,'2026-02-02 22:25:12','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(186,64,'proveedor_agencia',350.0,'2026-02-02 22:25:28','Transferencia','',115,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(187,65,'cliente_agencia',50.0,'2026-02-02 22:36:25','Efectivo','',116,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(188,65,'agencia_proveedor',20.0,'2026-02-02 22:36:33','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(189,65,'proveedor_agencia',10.0,'2026-02-02 22:37:00','Transferencia','',117,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(190,66,'cliente_agencia',1000.0,'2026-02-02 22:44:51','Efectivo','pago perro perez',118,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(191,66,'agencia_proveedor',600.0,'2026-02-02 22:45:28','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(192,66,'proveedor_agencia',450.0,'2026-02-02 22:45:46','Transferencia','',119,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(193,67,'cliente_agencia',1500.0,'2026-02-02 23:47:10','Efectivo','',120,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(194,67,'agencia_proveedor',600.0,'2026-02-02 23:47:24','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(195,67,'proveedor_agencia',400.0,'2026-02-02 23:47:41','Transferencia','',121,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(196,67,'agencia_cliente',1300.0,'2026-02-02 23:47:41','Transferencia','',122,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(197,68,'cliente_agencia',1500.0,'2026-02-03 00:17:19','Efectivo','',123,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(198,68,'agencia_proveedor',800.0,'2026-02-03 00:17:31','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(199,68,'proveedor_agencia',600.0,'2026-02-03 00:17:45','Transferencia','',124,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(200,68,'agencia_cliente',1000.0,'2026-02-03 00:17:45','Transferencia','',125,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(201,69,'cliente_agencia',2000.0,'2026-02-03 00:23:08','Efectivo','',126,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(202,69,'agencia_proveedor',800.0,'2026-02-03 00:23:19','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(203,69,'proveedor_agencia',600.0,'2026-02-03 00:23:52','Transferencia','',127,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(204,70,'cliente_agencia',100.0,'2026-02-04 23:26:52','Efectivo','',128,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(205,70,'cliente_agencia',1000.0,'2026-02-05 00:00:39','Efectivo','',129,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(206,73,'cliente_agencia',1500.0,'2026-02-11 19:53:59','Efectivo','',130,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(207,73,'agencia_proveedor',600.0,'2026-02-11 19:54:07','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(208,73,'proveedor_agencia',400.0,'2026-02-11 19:54:30','Transferencia','',131,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(209,73,'agencia_cliente',1100.0,'2026-02-11 19:54:30','Transferencia','',132,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(210,76,'cliente_agencia',8000.0,'2026-02-12 00:00:06','Efectivo','',133,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(211,76,'agencia_proveedor',4000.0,'2026-02-12 13:46:21','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(212,76,'proveedor_agencia',3000.0,'2026-02-12 13:51:35','Transferencia','',134,NULL,NULL,NULL,'Devolución Proveedor',NULL);
INSERT INTO "pagos" VALUES(213,76,'agencia_cliente',6000.0,'2026-02-12 13:51:35','Transferencia','',135,NULL,NULL,NULL,'Devolución Cliente',NULL);
INSERT INTO "pagos" VALUES(214,77,'cliente_agencia',1200.0,'2026-02-12 21:51:42','Efectivo','',136,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(215,77,'agencia_proveedor',500.0,'2026-02-12 22:04:18','Efectivo','',NULL,NULL,NULL,NULL,'Pago Normal',NULL);
INSERT INTO "pagos" VALUES(216,75,'cliente_agencia',5000.0,'2026-02-13 00:42:54','Efectivo','',137,NULL,NULL,NULL,'Pago Normal',NULL);
CREATE TABLE pasajeros_avion (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  reservacion_id INTEGER,
  nombre TEXT,
  apellidos TEXT,
  fecha_nacimiento TEXT,
  FOREIGN KEY (reservacion_id) REFERENCES reservaciones(id)
);
INSERT INTO "pasajeros_avion" VALUES(1,21,'zinedine ','zizu','1111-11-11');
INSERT INTO "pasajeros_avion" VALUES(2,23,'pele','menso','2026-01-02');
INSERT INTO "pasajeros_avion" VALUES(3,24,'zinedine ','zidane','2026-01-29');
INSERT INTO "pasajeros_avion" VALUES(4,24,'aaaaa','aaaa','2026-01-24');
INSERT INTO "pasajeros_avion" VALUES(5,25,'jose ','perez','2026-01-15');
INSERT INTO "pasajeros_avion" VALUES(6,25,'linda','perez','2026-01-25');
INSERT INTO "pasajeros_avion" VALUES(7,27,'jose luis','persea','2026-01-14');
INSERT INTO "pasajeros_avion" VALUES(8,28,'pedro','picapiedra','2025-10-30');
INSERT INTO "pasajeros_avion" VALUES(9,28,'villma','yabadbadu','2026-01-23');
INSERT INTO "pasajeros_avion" VALUES(10,33,'peta','sampras','2026-01-09');
INSERT INTO "pasajeros_avion" VALUES(11,33,'esposa','sampras','2026-01-22');
INSERT INTO "pasajeros_avion" VALUES(12,39,'edgar','olvera','2026-01-07');
INSERT INTO "pasajeros_avion" VALUES(13,41,'edgar','zamora','');
CREATE TABLE proveedores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL UNIQUE,
    tipo TEXT,                -- Hotel, Aerolínea, Tour, Transporte, Otro
    contacto TEXT,
    telefono TEXT,
    email TEXT,
    activo INTEGER DEFAULT 1,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE reservacion_avion (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  reservacion_id INTEGER,
  aerolinea TEXT,
  vuelo TEXT,
  tipo_vuelo TEXT,
  fecha_regreso TEXT,
  hora_regreso TEXT,
  origen TEXT,
  destino TEXT,
  fecha_salida TEXT,
  hora_salida TEXT,
  hora_llegada TEXT,
  tiene_escala BOOLEAN,
  ciudad_escala TEXT,
  hora_salida_escala TEXT,
  destino_escala TEXT,
  hora_llegada_escala TEXT,
  tiempo_limite TEXT,
  clave_proveedor TEXT,
  clave_aerolinea TEXT,
  observaciones TEXT, hora_llegada_regreso TEXT,
  FOREIGN KEY (reservacion_id) REFERENCES reservaciones(id)
);
INSERT INTO "reservacion_avion" VALUES(1,21,'volaris','','sencillo',NULL,NULL,'Cancún','Ciudad de México','2026-01-16','14:22','14:22',0,NULL,NULL,NULL,NULL,'2026-01-15T22:32','22','22','2',NULL);
INSERT INTO "reservacion_avion" VALUES(2,23,'aeromexico','yt69','sencillo',NULL,NULL,'Guadalajara','Guadalajara','2026-01-16','10:00','12:00',0,NULL,NULL,NULL,NULL,'2026-01-24T01:41','qq','www','',NULL);
INSERT INTO "reservacion_avion" VALUES(3,24,'volaris','y4100','sencillo',NULL,NULL,'Monterrey','Ciudad de México','2026-01-24','12:00','12:00',0,NULL,NULL,NULL,NULL,'','aa','aaa','',NULL);
INSERT INTO "reservacion_avion" VALUES(4,25,'interjet','90','sencillo',NULL,NULL,'Monterrey','maracaibo','2026-01-23','12:00','22:00',0,NULL,NULL,NULL,NULL,'2026-01-26T09:32','qq','22','',NULL);
INSERT INTO "reservacion_avion" VALUES(5,27,'volaris','y4 100','sencillo',NULL,NULL,'Cancún','Guadalajara','2026-02-20','12:00','12:00',0,NULL,NULL,NULL,NULL,'2026-01-21T10:50','ws','ss','',NULL);
INSERT INTO "reservacion_avion" VALUES(6,28,'aeromexico','12ws','sencillo',NULL,NULL,'Monterrey','las vegas','2026-01-23','12:00','22:00',0,NULL,NULL,NULL,NULL,'','wwww','wwwwwaaaaa','',NULL);
INSERT INTO "reservacion_avion" VALUES(7,33,'interjet','3we','sencillo',NULL,NULL,'uruapan','Guadalajara','2026-01-23','12:00','12:00',0,NULL,NULL,NULL,NULL,'2026-01-08T20:08','qq','ww','',NULL);
INSERT INTO "reservacion_avion" VALUES(8,39,'volaris','iy 800','sencillo',NULL,NULL,'Cancún','maracaibo','2026-01-29','12:00','12:00',0,NULL,NULL,NULL,NULL,'2026-01-23T18:33','aa','tata','',NULL);
INSERT INTO "reservacion_avion" VALUES(9,41,'volaris','iy 800','sencillo',NULL,NULL,'Cancún','Ciudad de México','2026-01-30','12:00','12:00',0,NULL,NULL,NULL,NULL,'2026-01-28T14:27','d','d','',NULL);
CREATE TABLE reservacion_hotel (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    reservacion_id INTEGER,
    ciudad TEXT,
    fecha_entrada TEXT,
    fecha_salida TEXT,
    habitaciones INTEGER,
    tipo_habitacion TEXT,
    menores INTEGER,
    plan TEXT,
    tiempo_limite TEXT,
    observaciones TEXT,
    clave_proveedor TEXT,
    clave_hotel TEXT,
    observacion_pagos TEXT
, hotel TEXT);
INSERT INTO "reservacion_hotel" VALUES(1,1,'rff','2025-12-31','2025-12-25',5,'SGL',44,'Desayuno buffet','44','dd','dd','dd','dd',NULL);
INSERT INTO "reservacion_hotel" VALUES(2,2,'mexicio','2025-12-04','2025-12-12',4,'SGL',11,'Solo Hospedaje','44','aa','ss','lk','',NULL);
INSERT INTO "reservacion_hotel" VALUES(3,3,'ixtapa','2026-01-08','2026-01-10',1,NULL,NULL,'Todo Incluido','2026-01-16T21:26','vv','dd','4','',NULL);
INSERT INTO "reservacion_hotel" VALUES(4,4,'ixtapa','2026-01-22','2026-01-24',1,NULL,NULL,'Todo Incluido','2026-01-24T18:29','','a','a','',NULL);
INSERT INTO "reservacion_hotel" VALUES(5,5,'ixtapa','2026-01-09','2026-01-11',1,NULL,NULL,'Desayuno buffet','2026-01-07T18:35','dd','a','sss','',NULL);
INSERT INTO "reservacion_hotel" VALUES(6,6,'ixtapa','2026-01-08','2026-01-10',NULL,NULL,NULL,'Todo Incluido','2026-01-05T02:42','hab queen zise','aa','sss',NULL,'azul ixtapa');
INSERT INTO "reservacion_hotel" VALUES(7,7,'ixtapa','2026-01-15','2026-01-17',NULL,NULL,NULL,'Desayuno','2026-01-10T05:17','aa','aa','aa',NULL,'qualton');
INSERT INTO "reservacion_hotel" VALUES(8,8,'ixtapa','2026-01-08','2026-01-10',NULL,NULL,NULL,'Todo incluido','2026-01-15T13:20','cama extra','w','ww',NULL,'sunscape');
INSERT INTO "reservacion_hotel" VALUES(9,9,'ixtapa','2026-01-22','2026-01-24',NULL,NULL,NULL,'Desayuno','2026-01-13T13:22','sss','ssssxxxx','xxxx',NULL,'fontan');
INSERT INTO "reservacion_hotel" VALUES(10,10,'ixtapa','2026-01-15','2026-01-17',NULL,NULL,NULL,'Todo incluido','2026-01-23T15:36','edfeer','rr','rr',NULL,'qualton');
INSERT INTO "reservacion_hotel" VALUES(11,11,'ixtapa','2026-01-21','2026-01-23',NULL,NULL,NULL,'Desayuno','2026-01-14T16:00','wsw','sws','sws',NULL,'park royal');
INSERT INTO "reservacion_hotel" VALUES(12,12,'ixtapa','2026-01-23','2026-01-24',NULL,NULL,NULL,'Todo incluido','2026-01-21T17:48','ddd','dd','ddd',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(13,13,'ixtapa','2026-01-20','2026-01-21',NULL,NULL,NULL,'Desayuno','2026-01-22T18:00','aaa','ss','11',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(14,14,'ixtapa','2026-01-16','2026-01-17',NULL,NULL,NULL,'Todo incluido','2026-01-25T22:31','ssss','aa','45y5y',NULL,'park royal');
INSERT INTO "reservacion_hotel" VALUES(15,15,'uruspan','2026-01-12','2026-01-14',NULL,NULL,NULL,'Todo incluido','2026-01-20T20:34','ssf','56','466',NULL,'seadsides');
INSERT INTO "reservacion_hotel" VALUES(16,16,'ixtapa','2026-01-14','2026-01-16',NULL,NULL,NULL,'Desayuno','2026-01-06T23:49','sss','ss','ss',NULL,'palace');
INSERT INTO "reservacion_hotel" VALUES(17,17,'uruapan','2026-01-09','2026-01-11',NULL,NULL,NULL,'Todo incluido','2026-01-08T12:33','scdsc','ccc','cc',NULL,'hotel tarasco');
INSERT INTO "reservacion_hotel" VALUES(18,18,'uruapan','2026-01-08','2026-01-10',NULL,NULL,NULL,'Desayuno','2026-01-06T15:07','ss','ss','ss',NULL,'tarasco');
INSERT INTO "reservacion_hotel" VALUES(19,19,'uruapan','2026-01-15','2026-01-15',NULL,NULL,NULL,'Desayuno Americano','2026-01-16T20:21','oo','oo','lkk',NULL,'fontan');
INSERT INTO "reservacion_hotel" VALUES(20,20,'ixtapa','2026-01-22','2026-01-24',NULL,NULL,NULL,'Todo Incluido','2026-01-17T20:31','v al mar','ss','11',NULL,'fontan ixtapa');
INSERT INTO "reservacion_hotel" VALUES(21,26,'ixtapa','2026-01-29','2026-01-31',NULL,NULL,NULL,'Todo Incluido','2026-01-20T10:48','','wed','wed',NULL,'melia azul');
INSERT INTO "reservacion_hotel" VALUES(22,29,'ixtapa','2026-01-30','2026-01-31',NULL,NULL,NULL,'','2026-01-22T17:22','','wwww','wwwww',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(23,30,'ixtapa','2026-01-22','2026-01-24',NULL,NULL,NULL,'Desayuno Americano','2026-01-06T19:51','','tete','trtrt',NULL,'fontan');
INSERT INTO "reservacion_hotel" VALUES(24,31,'ixtapa','2026-01-29','2026-01-31',NULL,NULL,NULL,'Todo Incluido','2026-01-13T20:04','','dd','sss',NULL,'azul ixtapa');
INSERT INTO "reservacion_hotel" VALUES(25,32,'ixtapa','2026-01-27','2026-01-30',NULL,NULL,NULL,'Alimentos B','2026-01-31T10:00','','qqq','ss',NULL,'park royal');
INSERT INTO "reservacion_hotel" VALUES(26,34,'cancun','2026-01-27','2026-01-29',NULL,NULL,NULL,'','2026-01-22T20:23','','aaa','aa',NULL,'riu');
INSERT INTO "reservacion_hotel" VALUES(27,35,'ixtapa','2026-01-30','2026-01-31',NULL,NULL,NULL,'Alimentos y Bebidas','2026-01-22T23:17','','dd','sss',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(28,36,'ixtapa','2026-01-30','2026-01-31',NULL,NULL,NULL,'Alimentos y Bebidas','2026-01-22T23:17','','dd','sss',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(29,37,'ixtapa','2026-01-30','2026-01-31',NULL,NULL,NULL,'Todo Incluido','2026-01-24T13:15','','dd','aa',NULL,'azul ixtapa');
INSERT INTO "reservacion_hotel" VALUES(30,38,'ixtapa','2026-01-29','2026-01-31',NULL,NULL,NULL,'Solo Hospedaje','2026-01-27T17:54','','dd','xx',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(31,40,'ixtapa','2026-01-29','2026-01-31',NULL,NULL,NULL,'Alimentos B','2026-01-27T14:26','','ssssxxxx','4',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(32,42,'uruapan','2026-01-29','2026-01-30',NULL,NULL,NULL,'Todo Incluido','2026-01-27T23:59','','dd','xx',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(33,43,'ixtapa','2026-01-28','2026-01-30',NULL,NULL,NULL,'Desayuno Americano','2026-01-22T00:37','','dd','4',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(34,44,'e','2026-01-28','2026-01-30',NULL,NULL,NULL,'Alimentos B','2026-01-24T21:33','','dd','ss',NULL,'park royal');
INSERT INTO "reservacion_hotel" VALUES(35,45,'ixtapa','2026-01-30','2026-01-31',NULL,NULL,NULL,'Solo Hospedaje','2026-01-29T21:37','','dd','aa',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(36,46,'uruapan','2026-02-03','2026-02-05',NULL,NULL,NULL,'Todo Incluido','2026-01-30T21:46','','dd','sss',NULL,'park royal');
INSERT INTO "reservacion_hotel" VALUES(37,47,'ixtapa','2026-01-30','2026-01-31',NULL,NULL,NULL,'Desayuno Americano','2026-01-30T10:21','','ssssxxxx','11',NULL,'qualton');
INSERT INTO "reservacion_hotel" VALUES(38,48,'uruapan','2026-02-06','2026-02-08',NULL,NULL,NULL,'Alimentos B','2026-02-05T00:29','','dd','aa',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(39,49,'ixtapa','2026-02-06','2026-02-08',NULL,NULL,NULL,'Solo Hospedaje','2026-02-05T00:31','','dd','sss',NULL,'park royal');
INSERT INTO "reservacion_hotel" VALUES(40,50,'ixtapa','2026-02-20','2026-02-21',NULL,NULL,NULL,'Alimentos B','2026-02-11T00:42','','dd','aa',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(41,51,'ixtapa','2026-02-06','2026-02-08',NULL,NULL,NULL,'Desayuno Buffet','2026-02-03T01:18','','dd','aa',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(42,52,'ixtapa','2026-02-13','2026-02-14',NULL,NULL,NULL,'Alimentos B','2026-02-08T02:00','','dd','aa',NULL,'park royal');
INSERT INTO "reservacion_hotel" VALUES(43,53,'ixtapa','2026-02-13','2026-02-14',NULL,NULL,NULL,'Solo Hospedaje','2026-02-11T02:11','','dd','aa',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(44,54,'ixtapa','2026-02-20','2026-02-22',NULL,NULL,NULL,'Todo Incluido','2026-02-04T17:53','','w','4',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(45,55,'ixtapa','2026-02-27','2026-02-28',NULL,NULL,NULL,'Alimentos B','2026-02-04T18:32','','dd','aa',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(46,56,'ixtapa','2026-02-20','2026-02-21',NULL,NULL,NULL,'Desayuno Buffet','2026-02-04T19:15','','dd','aa',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(47,57,'ixtapa','2026-02-26','2026-02-27',NULL,NULL,NULL,'Alimentos y Bebidas','2026-02-03T19:30','','ssssxxxx','xx',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(48,58,'ixtapa','2026-02-27','2026-02-28',NULL,NULL,NULL,'Todo Incluido','2026-02-04T19:33','','ssssxxxx','aa',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(49,59,'w','2026-02-13','2026-02-14',NULL,NULL,NULL,'Todo Incluido','2026-02-13T20:10','','ssssxxxx','aa',NULL,'melia azul');
INSERT INTO "reservacion_hotel" VALUES(50,60,'ixtapa','2026-02-13','2026-02-14',NULL,NULL,NULL,'Todo Incluido','2026-02-11T21:21','','ssssxxxx','xx',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(51,61,'ixtapa','2026-02-20','2026-02-21',NULL,NULL,NULL,'Desayuno Americano','2026-02-11T21:24','','ss','xx',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(52,62,'ixtapa','2026-02-20','2026-02-21',NULL,NULL,NULL,'Todo Incluido','2026-02-04T22:03','','aa','11',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(53,63,'ixtapa','2026-02-20','2026-02-22',NULL,NULL,NULL,'Todo Incluido','2026-02-04T22:20','','dd','11',NULL,'park royal');
INSERT INTO "reservacion_hotel" VALUES(54,64,'rff','2026-02-20','2026-02-21',NULL,NULL,NULL,'Solo Hospedaje','2026-02-05T22:24','','dd','4',NULL,'melia azul');
INSERT INTO "reservacion_hotel" VALUES(55,65,'ixtapa','2026-02-27','2026-02-28',NULL,NULL,NULL,'Todo Incluido','2026-02-21T22:35','','ssssxxxx','xx',NULL,'park royal');
INSERT INTO "reservacion_hotel" VALUES(56,66,'uruapan','2026-02-13','2026-02-15',NULL,NULL,NULL,'Todo Incluido','2026-02-03T22:44','','ssssxxxx','sss',NULL,'qualton');
INSERT INTO "reservacion_hotel" VALUES(57,67,'uruapan','2026-02-20','2026-02-21',NULL,NULL,NULL,'Desayuno Americano','2026-02-04T23:46','','ssssxxxx','sss',NULL,'melia azul');
INSERT INTO "reservacion_hotel" VALUES(58,68,'ixtapa','2026-02-20','2026-02-21',NULL,NULL,NULL,'Alimentos B','2026-02-04T00:16','','ssssxxxx','aa',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(59,69,'ixtapa','2026-02-19','2026-02-21',NULL,NULL,'','ep','2026-02-05T00:22','','ssssxxxx','xx',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(60,70,'ixtapa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ss',NULL,'barcelo');
INSERT INTO "reservacion_hotel" VALUES(61,76,'ixtapa','2026-02-20','2026-02-22',NULL,NULL,NULL,'Desayuno Americano','2026-02-13T23:40','','ssssxxxx','sss',NULL,'park royal');
INSERT INTO "reservacion_hotel" VALUES(62,77,'ixtapa','2026-02-20','2026-02-21',NULL,NULL,NULL,'Alimentos y Bebidas','2026-02-19T15:08','','','ss',NULL,'barcelo');
CREATE TABLE reservaciones (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fecha_creacion TEXT,
    cliente_id INTEGER,
    tipo_reservacion TEXT,
    descripcion TEXT,
    proveedor TEXT,
    costo_cliente REAL,
    costo_proveedor REAL,
    utilidad REAL,
    estatus TEXT
, producto_reservado TEXT, devolucion_cliente REAL DEFAULT 0, saldo_a_favor REAL DEFAULT 0, penalidad_proveedor REAL DEFAULT 0, penalidad_agencia REAL DEFAULT 0);
INSERT INTO "reservaciones" VALUES(1,'2025-12-31 18:28:55',1,'Hotel','Hotel en rff','dd',44.0,44.0,4.0,'Activa',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(2,'2025-12-31 19:09:02',2,'Hotel','Hotel en mexicio','ss','','','','Activa',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(3,'2026-01-01 18:27:30',3,'Hotel','Hotel en ixtapa','dd',10.0,8.0,2.0,'Activa',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(4,'2026-01-01 18:30:47',4,'Hotel','Hotel en ixtapa','a',123.0,10.0,113.0,'Activa',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(5,'2026-01-01 18:36:46',5,'Hotel','Hotel en ixtapa','d',120.0,100.0,20.0,'Activa',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(6,'2026-01-02 02:43',6,NULL,NULL,'quality service',10000.0,8000.0,2000.0,'pendiente',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(7,'2026-01-02 03:18',7,'Hotel',NULL,'kjhkj',2000.0,1000.0,1000.0,'cancelada_con_saldo',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(8,'2026-01-02 13:21',8,'Hotel',NULL,'ss',2000.0,1000.0,1000.0,'pendiente',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(9,'2026-01-02 13:23',9,'Hotel',NULL,'a',5000.0,4000.0,1000.0,'pendiente',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(10,'2026-01-02 15:36',10,'Hotel',NULL,'a',45.0,25.0,20.0,'cancelada',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(11,'2026-01-02 16:00',11,'Hotel',NULL,'dd',111.0,45.0,66.0,'cancelada_con_saldo',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(12,'2026-01-02 17:48:35',12,'Hotel',NULL,'dd',200.0,100.0,100.0,'Pendiente',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(13,'2026-01-02 18:00:19',12,'Hotel',NULL,'ss',11.0,1.0,10.0,'cancelada',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(14,'2026-01-03 18:28:09',13,'Hotel',NULL,'okplkp',800.0,700.0,100.0,'Pendiente',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(15,'2026-01-03 20:32:30',14,'Hotel',NULL,'edd',4500.0,4000.0,500.0,'cancelada',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(16,'2026-01-04 23:50:47',15,'Hotel',NULL,'naturleon',900.0,700.0,200.0,'Pendiente',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(17,'2026-01-05 12:33:31',16,'Hotel',NULL,'popo',7000.0,6000.0,1000.0,'Pendiente',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(18,'2026-01-05 18:08:15',17,'Hotel',NULL,'popopo',90000.0,80000.0,10000.0,'Pendiente',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(19,'2026-01-15 20:21:36',18,'hotel',NULL,'quality service',90.0,80.0,10.0,'Pendiente',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(20,'2026-01-15 20:32:19',19,'hotel',NULL,'quality service',5000.0,4000.0,1000.0,'Pendiente',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(21,'2026-01-19 19:32:35',20,'avion',NULL,'ram',100.0,90.0,10.0,'cancelada_con_saldo',NULL,0.0,75.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(22,'2026-01-20 01:14:37',21,'avion',NULL,'ram',1000.0,760.0,240.0,'Pendiente',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(23,'2026-01-20 01:41:52',22,'avion',NULL,'ram',1200.0,1000.0,200.0,'cancelada',NULL,600.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(24,'2026-01-20 01:45:03',23,'avion',NULL,'ram',1500.0,1000.0,500.0,'Pendiente',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(25,'2026-01-20 09:33:04',13,'avion',NULL,'quality service',500.0,400.0,100.0,'Pendiente',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(26,'2026-01-20 10:49:08',24,'hotel',NULL,'quality service',1000.0,760.0,240.0,'cancelada_con_saldo',NULL,650.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(27,'2026-01-20 10:51:04',25,'avion',NULL,'ram',1000.0,80.0,920.0,'cancelada',NULL,690.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(28,'2026-01-20 17:21:00',26,'avion',NULL,'quality service',1000.0,90.0,910.0,'Pendiente',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(29,'2026-01-20 17:22:53',27,'hotel',NULL,'quality service',1200.0,760.0,440.0,'Pendiente',NULL,0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(30,'2026-01-20 19:52:03',28,'hotel',NULL,'quality service',8000.0,5000.0,3000.0,'cancelada',NULL,4000.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(31,'2026-01-20 20:04:42',29,'hotel',NULL,'quality service',8000.0,3133.0,4867.0,'cancelada',NULL,6000.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(32,'2026-01-20 20:06:45',30,'hotel',NULL,'popo',3900.0,3500.0,400.0,'cancelada_con_saldo',NULL,1900.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(33,'2026-01-20 20:08:54',31,'avion',NULL,'ram',3000.0,2000.0,1000.0,'cancelada',NULL,2000.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(34,'2026-01-20 20:23:49',32,'hotel',NULL,'quality service',7900.0,7000.0,900.0,'Pendiente','riu',0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(35,'2026-01-20 23:18:16',1,'hotel',NULL,'ram',1200.0,760.0,440.0,'cancelada_con_saldo','barcelo',0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(36,'2026-01-20 23:34:29',1,'hotel',NULL,'ram',1200.0,760.0,440.0,'cancelada_con_saldo','barcelo',0.0,700.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(37,'2026-01-22 13:15:33',1,'hotel',NULL,'quality service',8000.0,90.0,7910.0,'Pendiente','azul ixtap',0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(38,'2026-01-22 17:55:15',1,'hotel',NULL,'quality service',900.0,800.0,100.0,'cancelada','barcelo',0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(39,'2026-01-22 18:33:49',1,'avion',NULL,'ram',8000.0,760.0,7240.0,'Pendiente','volaris',0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(40,'2026-01-26 14:27:01',35,'hotel',NULL,'quality service',500.0,400.0,100.0,'cancelada_con_saldo','barcelo',0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(41,'2026-01-26 14:28:16',35,'avion',NULL,'ram',1200.0,400.0,800.0,'cancelada_con_saldo','volaris',0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(42,'2026-01-26 23:59:33',34,'hotel',NULL,'quality service',1000.0,800.0,200.0,'cancelada_con_saldo','barcelo',0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(43,'2026-01-27 00:37:19',1,'hotel',NULL,'ram',1000.0,800.0,200.0,'cancelada_con_saldo','barcelo',0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(44,'2026-01-28 21:33:46',36,'hotel',NULL,'ram',500.0,300.0,200.0,'Pendiente','park royal',0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(45,'2026-01-28 21:37:24',1,'hotel',NULL,'popo',500.0,200.0,300.0,'cancelada_con_saldo','barcelo',300.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(46,'2026-01-28 21:46:44',37,'hotel',NULL,'ram',1000.0,500.0,500.0,'cancelada_con_saldo','park royal',0.0,1000.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(47,'2026-01-29 10:21:18',1,'hotel',NULL,'ram',2000.0,1000.0,1000.0,'cancelada_con_saldo','qualton',0.0,2000.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(48,'2026-02-02 00:30:08',1,'hotel',NULL,'ram',200.0,0.0,200.0,'cancelada_con_saldo','barcelo',0.0,200.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(49,'2026-02-02 00:31:51',1,'hotel',NULL,'quality service',500.0,300.0,200.0,'cancelada_con_saldo','park royal',0.0,500.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(50,'2026-02-02 00:42:31',9,'hotel',NULL,'popo',1100.0,300.0,800.0,'cancelada_con_saldo','barcelo',0.0,1100.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(51,'2026-02-02 01:19:20',38,'hotel',NULL,'ram',2000.0,1000.0,1000.0,'Pendiente','barcelo',0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(52,'2026-02-02 02:00:27',1,'hotel',NULL,'dd',1500.0,1000.0,500.0,'Pendiente','park royal',0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(53,'2026-02-02 02:11:33',1,'hotel',NULL,'ram',400.0,200.0,200.0,'cancelada_con_saldo','barcelo',0.0,600.0,200.0,200.0);
INSERT INTO "reservaciones" VALUES(54,'2026-02-02 17:53:29',39,'hotel',NULL,'quality service',2000.0,1700.0,300.0,'Pendiente','barcelo',0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(55,'2026-02-02 18:32:38',40,'hotel',NULL,'quality service',5500.0,2000.0,3500.0,'cancelada_con_saldo','barcelo',0.0,5500.0,500.0,500.0);
INSERT INTO "reservaciones" VALUES(56,'2026-02-02 19:15:36',41,'hotel',NULL,'popo',500.0,200.0,-100.0,'cancelada','barcelo',0.0,1800.0,200.0,300.0);
INSERT INTO "reservaciones" VALUES(57,'2026-02-02 19:30:45',42,'hotel',NULL,'popo',100.0,0.0,-100.0,'cancelada','barcelo',0.0,1400.0,0.0,100.0);
INSERT INTO "reservaciones" VALUES(58,'2026-02-02 19:33:28',43,'hotel',NULL,'quality service',400.0,200.0,0.0,'cancelada','barcelo',0.0,1600.0,200.0,200.0);
INSERT INTO "reservaciones" VALUES(59,'2026-02-02 20:10:58',41,'hotel',NULL,'quality service',600.0,300.0,300.0,'cancelada','melia azul',200.0,0.0,300.0,300.0);
INSERT INTO "reservaciones" VALUES(60,'2026-02-02 21:21:24',41,'hotel',NULL,'quality service',300.0,0.0,300.0,'cancelada','barcelo',0.0,700.0,0.0,300.0);
INSERT INTO "reservaciones" VALUES(61,'2026-02-02 21:25:18',44,'hotel',NULL,'quality service',1200.0,1000.0,200.0,'Pendiente','barcelo',0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(62,'2026-02-02 22:03:48',1,'hotel',NULL,'quality service',1000.0,700.0,300.0,'Pendiente','barcelo',0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(63,'2026-02-02 22:20:21',1,'hotel',NULL,'ram',200.0,0.0,200.0,'cancelada','park royal',0.0,800.0,0.0,200.0);
INSERT INTO "reservaciones" VALUES(64,'2026-02-02 22:24:45',1,'hotel',NULL,'quality service',150.0,0.0,150.0,'cancelada','melia azul',0.0,850.0,0.0,150.0);
INSERT INTO "reservaciones" VALUES(65,'2026-02-02 22:36:13',34,'hotel',NULL,'dd',20.0,10.0,10.0,'cancelada','park royal',0.0,30.0,10.0,10.0);
INSERT INTO "reservaciones" VALUES(66,'2026-02-02 22:44:30',1,'hotel',NULL,'quality service',300.0,150.0,150.0,'cancelada','qualton',0.0,0.0,150.0,150.0);
INSERT INTO "reservaciones" VALUES(67,'2026-02-02 23:46:57',1,'hotel',NULL,'quality service',400.0,200.0,200.0,'cancelada','melia azul',1300.0,0.0,200.0,200.0);
INSERT INTO "reservaciones" VALUES(68,'2026-02-03 00:17:03',38,'hotel',NULL,'popo',500.0,200.0,300.0,'cancelada','barcelo',1000.0,0.0,200.0,300.0);
INSERT INTO "reservaciones" VALUES(69,'2026-02-03 00:22:31',1,'hotel',NULL,'quality service',600.0,200.0,400.0,'cancelada','barcelo',0.0,1400.0,200.0,400.0);
INSERT INTO "reservaciones" VALUES(70,'2026-02-03 23:54:22',1,'hotel',NULL,'popo',4000.0,1000.0,2000.0,'Pendiente','barcelo',0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(71,'2026-02-11 17:04:47',34,'hotel','','quality service',3500.0,1000.0,2500.0,'Pendiente','fontan',0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(72,'2026-02-11 17:10:28',9,'hotel','','ram',5000.0,3000.0,2000.0,'Pendiente','fontan',0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(73,'2026-02-11 19:52:45',45,'hotel','','quality service',400.0,200.0,200.0,'cancelada','fontan',1100.0,0.0,200.0,200.0);
INSERT INTO "reservaciones" VALUES(74,'2026-02-11 23:10:50',1,'hotel','','popo',1000.0,800.0,200.0,'Pendiente','fontan',0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(75,'2026-02-11 23:22:38',46,'hotel','','ram',8000.0,1000.0,7000.0,'Pendiente','fontan',0.0,0.0,0.0,0.0);
INSERT INTO "reservaciones" VALUES(76,'2026-02-11 23:40:15',38,'hotel',NULL,'ram',2000.0,1000.0,1000.0,'cancelada','park royal',6000.0,0.0,1000.0,1000.0);
INSERT INTO "reservaciones" VALUES(77,'2026-02-12 15:08:29',47,'hotel',NULL,'quality service',1200.0,800.0,400.0,'Pendiente','barcelo',0.0,0.0,0.0,0.0);
CREATE TABLE tarjetas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,                  -- Ej: "Santander Visa Crédito"
    tipo TEXT,                             -- Ej: crédito / débito
    banco TEXT,
    terminacion TEXT,                      -- Últimos 4 dígitos
    titular TEXT,
    activa BOOLEAN DEFAULT 1
);
CREATE TABLE tarjetas_credito (
    id INTEGER PRIMARY KEY AUTOINCREMENT,

    alias TEXT NOT NULL UNIQUE,
    -- Ej: BBVA AZUL / AMEX NEGOCIO / HSBC AGENCIA

    banco TEXT,
    ultimos_4 TEXT,

    dia_corte INTEGER,
    dia_pago INTEGER,

    activa INTEGER DEFAULT 1,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE VIEW vista_estado_financiero_reserva AS
SELECT
    r.id AS reservacion_id,

    -- PAGADO CLIENTE
    (SELECT IFNULL(SUM(p.monto),0)
     FROM pagos p
     WHERE p.reservacion_id = r.id
     AND p.tipo_pago = 'cliente_agencia') AS pagado_cliente,

    -- PAGADO PROVEEDOR
    (SELECT IFNULL(SUM(p.monto),0)
     FROM pagos p
     WHERE p.reservacion_id = r.id
     AND p.tipo_pago = 'agencia_proveedor') AS pagado_proveedor,

    -- SALDO CLIENTE
    r.costo_cliente -
    (SELECT IFNULL(SUM(p.monto),0)
     FROM pagos p
     WHERE p.reservacion_id = r.id
     AND p.tipo_pago = 'cliente_agencia') AS saldo_cliente,

    -- SALDO PROVEEDOR
    r.costo_proveedor -
    (SELECT IFNULL(SUM(p.monto),0)
     FROM pagos p
     WHERE p.reservacion_id = r.id
     AND p.tipo_pago = 'agencia_proveedor') AS saldo_proveedor

FROM reservaciones r;
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('clientes',47);
INSERT INTO "sqlite_sequence" VALUES('reservaciones',77);
INSERT INTO "sqlite_sequence" VALUES('reservacion_hotel',62);
INSERT INTO "sqlite_sequence" VALUES('pagos',216);
INSERT INTO "sqlite_sequence" VALUES('habitaciones',59);
INSERT INTO "sqlite_sequence" VALUES('reservacion_avion',9);
INSERT INTO "sqlite_sequence" VALUES('pasajeros_avion',13);
COMMIT;
