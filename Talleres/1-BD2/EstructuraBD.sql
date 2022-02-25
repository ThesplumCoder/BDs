create schema huellitas;

create table huellitas.Login(
	id int,
	usuario varchar(20) not null,
	contraseña varchar(20) not null,
	constraint PK_Login primary key (id)
);

create table huellitas.Empleado(
	id int,
	idLogin int not null,
	nombre varchar(20) not null,
	apellidos varchar(20) not null,
	telefono int,
	salario float not null,
	tipodocumento varchar(15),
	documento numeric not null,
	direccion varchar(30),
	fechanacimiento date not null,
	email varchar(50),
	constraint PK_Empleado primary key (id)
);

create table huellitas.Ayudante( 
	id int,
	idEmpleado int not null,
	descripcion varchar(25),
	constraint PK_Ayudante primary key (id)
);

create table huellitas.LoteAyudante( 
	id int,
	idLote int not null,
	idAyudante int not null,
	constraint PK_LoteAyudante primary key (id)

);

create table huellitas.Lote(
	id int,
	fecharecibido date not null,
	fechaagotado date,
	constraint PK_Lote primary key (id)
);

create table huellitas.LoteMolde(
	id int,
	idMolde int not null,
	idLote int not null,
	constraint PK_LoteMolde primary key (id)

);



create table huellitas.Molde(
	id int,
	idMaterialMolde int not null,
	talla int not null,
	formazapato varchar(50),
	constraint PK_Molde primary key (id)
);

create table huellitas.Materialmolde(
	id int,
	nombre varchar(30) not null,
	constraint PK_Materialmolde primary key (id)
	
);

create table huellitas.LoteSuela(
	id int,
	idSuela int not null,
	idLote int not null,
	constraint PK_LoteSuela primary key (id)

);

create table huellitas.LoteAccesorio(
	id int,
	idAccesorio int not null,
	idLote int not null,
	constraint PK_LoteAccesorio primary key (id)
	
);

create table huellitas.LoteMaterial(
	id int,
	idMaterial int not null,
	idLote int not null,
	constraint PK_LoteMaterial primary key (id)

);

create table huellitas.Suela(
	id int,
	tipo varchar(30),
	descripcion varchar(30),
	constraint PK_Suela primary key (id)
);

create table huellitas.Accesorio(
	id int,
	nombre varchar(30),
	descripcion varchar(30),
	constraint PK_Accesorio primary key (id)
);

create table huellitas.Material(
	id int,
	nombre varchar(30),
	descripcion varchar(30),
	constraint PK_Material primary key (id)
);

create table huellitas.AccesorioDiseño(
	id int,
	idAccesorio int not null,
	idDiseño int not null,
	constraint PK_AccesorioDiseño primary key (id)
	
		
);

create table huellitas.DiseñoZapato(
	id int,
	idTrozo int not null,
	idSuela int not null,
	idMaestro int not null,
	nombre varchar(25),
	rangoTallas numeric,
	cantidadTrozos int not null,
	numeroAccesorios int,
	constraint PK_DiseñoZapato primary key (id)
	
);

create table huellitas.MoldeDiseño(
	id int,
	idMolde int not null,
	idDiseño int not null,
	constraint PK_MoldeDiseño primary key (id)

);

create table huellitas.MaestroZapatero( 
	id int,
	idEmpleado int not null,
	idMaestro int,
	descripcion varchar(40),
	constraint PK_MaestroZapatero primary key (id)
);

create table huellitas.Cortador( 
	id int,
	idEmpleado int not null,
	descripcion varchar(40),
	constraint PK_Cortador primary key (id)
);

create table huellitas.CortadorTrozo( 
	id int,
	idCortador int not null,
	idTrozo int not null,
	constraint PK_CortadorTrozo primary key (id)

);

create table huellitas.Trozo( 
	id int,
	idMaterial int not null,
	idTrozo int not null,
	constraint PK_Trozo primary key (id)
);

create table huellitas.Zapato( 
	id int,
	idLoteZapatoProduccion int not null,
	idMaestro int not null,
	idDiseño int not null,
	constraint PK_Zapato primary key (id)
);

create table huellitas.LoteZapatoProduccion( 
	id int,
	cantidadTrozos int,
	tiempoterminar date,
	constraint PK_LoteZapatoProduccion primary key (id)
);

ALTER TABLE huellitas.Empleado
ADD CONSTRAINT FK_Empleado_Login FOREIGN KEY(idLogin)
REFERENCES huellitas.login (id)
on delete restrict on update restrict;


  
 ALTER TABLE huellitas.Ayudante
ADD CONSTRAINT FK_Ayudante_Empleado FOREIGN KEY(idEmpleado)
REFERENCES huellitas.Empleado (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.LoteAyudante
ADD CONSTRAINT FK_LoteAyudante_Ayudante FOREIGN KEY(idAyudante)
REFERENCES huellitas.Ayudante (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.LoteAyudante
ADD CONSTRAINT FK_LoteAyudante_Lote FOREIGN KEY(idLote)
REFERENCES huellitas.Lote (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.LoteMolde
ADD CONSTRAINT FK_LoteMolde_Lote FOREIGN KEY(idLote)
REFERENCES huellitas.Lote (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.LoteMolde
ADD CONSTRAINT FK_LoteMolde_Molde FOREIGN KEY(idMolde)
REFERENCES huellitas.Molde (id)
on delete restrict on update restrict;




 ALTER TABLE huellitas.Molde
ADD CONSTRAINT FK_Molde_Materialmolde FOREIGN KEY(idMaterialMolde)
REFERENCES huellitas.Materialmolde (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.MoldeDiseño
ADD CONSTRAINT FK_MoldeDiseño_Molde FOREIGN KEY(idMolde)
REFERENCES huellitas.Molde (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.MoldeDiseño
ADD CONSTRAINT FK_MoldeDiseño_DiseñoZapato FOREIGN KEY(idDiseño)
REFERENCES huellitas.DiseñoZapato (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.LoteSuela
ADD CONSTRAINT FK_LoteSuela_Lote FOREIGN KEY(idLote)
REFERENCES huellitas.Lote (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.LoteSuela
ADD CONSTRAINT FK_LoteSuela_Suela FOREIGN KEY(idSuela)
REFERENCES huellitas.Suela (id)
on delete restrict on update restrict;






 ALTER TABLE huellitas.LoteAccesorio
ADD CONSTRAINT FK_LoteAccesorio_Accesorio FOREIGN KEY(idAccesorio)
REFERENCES huellitas.Accesorio (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.LoteAccesorio
ADD CONSTRAINT FK_LoteAccesorio_Lote FOREIGN KEY(idLote)
REFERENCES huellitas.Lote (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.AccesorioDiseño
ADD CONSTRAINT FK_AccesorioDiseño_Accesorio FOREIGN KEY(idAccesorio)
REFERENCES huellitas.Accesorio (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.AccesorioDiseño
ADD CONSTRAINT FK_AccesorioDiseño_DiseñoZapato FOREIGN KEY(idDiseño)
REFERENCES huellitas.DiseñoZapato (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.LoteMaterial
ADD CONSTRAINT FK_LoteMaterial_Lote FOREIGN KEY(idLote)
REFERENCES huellitas.Lote (id)
on delete restrict on update restrict;






 ALTER TABLE huellitas.LoteMaterial
ADD CONSTRAINT FK_LoteMaterial_Material FOREIGN KEY(idMaterial)
REFERENCES huellitas.Material (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.Cortador
ADD CONSTRAINT FK_Cortador_Empleado FOREIGN KEY(idEmpleado)
REFERENCES huellitas.Empleado (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.CortadorTrozo
ADD CONSTRAINT FK_CortadorTrozo_Cortador FOREIGN KEY(idCortador)
REFERENCES huellitas.Cortador (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.CortadorTrozo
ADD CONSTRAINT FK_CortadorTrozo_Trozo FOREIGN KEY(idTrozo)
REFERENCES huellitas.Trozo (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.Trozo
ADD CONSTRAINT FK_Trozo_Material FOREIGN KEY(idMaterial)
REFERENCES huellitas.Material (id)
on delete restrict on update restrict;






 ALTER TABLE huellitas.Trozo
ADD CONSTRAINT FK_Trozo_Trozo FOREIGN KEY(idTrozo)
REFERENCES huellitas.Trozo (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.MaestroZapatero
ADD CONSTRAINT FK_MaestroZapatero_Empleado FOREIGN KEY(idEmpleado)
REFERENCES huellitas.Empleado (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.MaestroZapatero
ADD CONSTRAINT FK_MaestroZapatero_MaestroZapatero FOREIGN KEY(idMaestro)
REFERENCES huellitas.MaestroZapatero (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.DiseñoZapato
ADD CONSTRAINT FK_DiseñoZapato_Suela FOREIGN KEY(idSuela)
REFERENCES huellitas.Suela (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.DiseñoZapato
ADD CONSTRAINT FK_DiseñoZapato_Trozo FOREIGN KEY(idTrozo)
REFERENCES huellitas.Trozo (id)
on delete restrict on update restrict;







 ALTER TABLE huellitas.DiseñoZapato
ADD CONSTRAINT FK_DiseñoZapato_MaestroZapatero FOREIGN KEY(idMaestro)
REFERENCES huellitas.MaestroZapatero (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.Zapato
ADD CONSTRAINT FK_Zapato_LoteZapatoProduccion FOREIGN KEY(idLoteZapatoProduccion)
REFERENCES huellitas.LoteZapatoProduccion (id)
on delete restrict on update restrict;

 ALTER TABLE huellitas.Zapato
ADD CONSTRAINT FK_Zapato_DiseñoZapato FOREIGN KEY(idDiseño)
REFERENCES huellitas.DiseñoZapato (id)
on delete restrict on update restrict;