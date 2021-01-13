/*Nombre de la base de datos*/
--create database sandwicheria

/*Creacion de tablas*/
create table usuarios(
	rut_user varchar (12) primary key not null,
	nombre varchar (50) not null,
	clave varchar (50) not null,
	email varchar (500) not null
) 

create table productos(
	nombre_ti varchar(50) primary key not null
)

create table agregados(
	nombre_ag varchar(50) primary key not null
)

create table entrega(
	id_entre int identity primary key not null,
	nombre_entre varchar(50) not null,
	direccion_entre varchar(100) not null,
	telefono_entre varchar(12) not null,
	rut_us_entre varchar(12),
	constraint UserEntrega foreign key (rut_us_entre)
	references usuarios(rut_user)
)

create table pedidos(
	id_ped int identity primary key not null,
	cantidad_ped int not null,
	total_ped int,
	rut_user_ped varchar(12),
	nombre_tipo_ped varchar(50),
	nombre_agregado_ped varchar(50),
	constraint UserPedido foreign key (rut_user_ped)
	references usuarios (rut_user),
	constraint ProPedido foreign key(nombre_tipo_ped)
	references productos (nombre_ti),
	constraint AgPedido foreign key(nombre_agregado_ped)
	references agregados (nombre_ag)
)

/*Insertacion de Datos*/
insert into usuarios values ('20408005-4','Matías','happy25','thuputitalegre@gmail.com') 

insert into productos values
('Arrollado de Huaso'),('Barros Luco'),('Completo'),('Chacarero'),('Churrasco'),('Fricandela'),('Lomito'),('Mechada'),('Pernil'),('Chemilico'), ('Potito'), ('Merluza'), ('Gorda'), ('Lengua')

insert into agregados values
('Chucrut'),('Tomate'),('Salsa Picante'),('Porotos Verde'),('Queso'),('Huevos'),('Cebolla frita')

insert into pedidos values
(4,2000,'20408005-4','Chemilico','Cebolla frita')

/*Sentencias*/
select * from usuarios
select * from productos
select * from agregados
select * from entrega
select * from pedidos

delete usuarios
delete agregados
delete pedidos
delete entrega

drop database sandwicheria