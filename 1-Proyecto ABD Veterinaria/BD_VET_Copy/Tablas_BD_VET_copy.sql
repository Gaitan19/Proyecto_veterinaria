create database DBVETERINARIA_Cop

go

use DBVETERINARIA_Cop

go



create table Persona(
idpersona int primary key identity(1,1),
nombreCompleto varchar(100),
correo varchar(40),
esActivo bit default 1,
fechaRegistro datetime default getdate(),
tipoPersona varchar(40)

)

go




create table Rol(
idRol int primary key identity(1,1),
nombre varchar(50),
fechaRegistro datetime default getdate()

)

go

create table Menu(
idMenu int primary key identity(1,1),
nombre varchar(50),
icono varchar(50),
url varchar(50)
)

go

create table MenuRol(
idMenuRol int primary key identity(1,1),
idMenu int references Menu(idMenu),
idRol int references Rol(idRol)
)

go


create table Usuario(
idUsuario int primary key identity(1,1),
idpersona int foreign key references persona(idpersona),
idRol int references Rol(idRol),
clave varchar(40)

)

go

create table Categoria(
idCategoria int primary key identity(1,1),
nombre varchar(50),
esActivo bit default 1,
fechaRegistro datetime default getdate()
)

go


create table Provedor(
idProvedor int primary key identity(1,1),
idpersona int foreign key references persona(idpersona)
)

go



create table Producto (
idProducto int primary key identity(1,1),
idprovedor int foreign key references Provedor(idprovedor),
nombre varchar(100),
idCategoria int references Categoria(idCategoria),
stock int,
precio decimal(10,2),
esActivo bit default 1,
fechaRegistro datetime default getdate()
)

go

create table NumeroDocumento(
idNumeroDocumento int primary key identity(1,1),
ultimo_Numero int not null,
fechaRegistro datetime default getdate()
)
go

create table Venta(
idVenta int primary key identity(1,1),
numeroDocumento varchar(40),
tipoPago varchar(50),
total decimal(10,2),
fechaRegistro datetime default getdate()
)
go

create table DetalleVenta(
idDetalleVenta int primary key identity(1,1),
idVenta int references Venta(idVenta),
idProducto int references Producto(idProducto),
cantidad int,
precio decimal(10,2),
total decimal(10,2)
)




go

go