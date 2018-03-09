create table TipoUsuario(
	id int not null auto_increment,
	nombre varchar(15),
	primary key (id)
);
create table TipoSalas(
	id int not null auto_increment,
	nombre varchar(15),
	primary key (id)
);
create table TipoInmuebles(
	id int not null auto_increment,
	nombre varchar(15),
	primary key (id)
);
create table Usuarios(
	id int not null auto_increment,
	correo varchar(20) not null,
	password varchar(20) not null,
	nombre varchar(15),
	apellido_p varchar(15),
	apellido_m varchar(15),
	telefono varchar(18),
	celular varchar(15),
	tipo_de_usuario int not null,
	primary key (id),
	foreign key (tipo_de_usuario) references TipoUsuario(id)
);
create table SalasChat(
	id int not null auto_increment,
	tipo_de_sala int not null,
	primary key (id),
	foreign key (tipo_de_sala) references TipoSalas(id)
);
create table IntegrantesSalas(
	id_usuario int,
	id_sala int,
	foreign key (id_usuario) references Usuarios(id),
	foreign key (id_sala) references SalasChat(id)
);
create table Mensajes(
	id int not null auto_increment,
	id_sala int not null,
	id_usuario int not null,
	texto text,
	primary key (id),
	foreign key (id_sala) references SalasChat(id),
	foreign key (id_usuario) references Usuarios(id)
);
create table Inmuebles(
	id int not null auto_increment,
	titulo varchar (100),
	dueño int not null,
	direccion varchar (100),
	imagen longblob,
	descripcion text,
	precio float,
	estado bool,
	vendido_a int null,
	tipo int not null,
	primary key (id),
	foreign key (dueño) references Usuarios(id),
	foreign key (vendido_a) references Usuarios(id),
	foreign key (tipo) references TipoInmuebles(id)
);
