CREATE DATABASE actividad5;

use actividad5;

 /* PARTE 2*/
 
create table usuario(
	id_usuario VARCHAR(30) primary key,
    nombre VARCHAR(45) not null,
    apellido VARCHAR(45) not null,
    contrasena VARCHAR(45) not null,
    zona_horaria VARCHAR(45) default '-3:00',
    genero CHAR(1),
    telefono INT not null  
);

create table ingreso_usuario(
	id_ingreso INT primary key auto_increment,
    id_usuario VARCHAR(30) not null,
    fecha_hora_ingreso timestamp not null default current_timestamp,
    foreign key (id_usuario) references usuario(id_usuario)
);

set time_zone = '-3:00';
select now();

INSERT into usuario() values ('kevin','kevin','rojas','123456','-3:00','M',966362686);
insert into ingreso_usuario() values (1,'kevin',now());

select *from usuario;
select * from ingreso_usuario;

/*parte 3 modificar*/
/*UPDATE ingreso_usuario SET fecha_hora_ingreso = CONVERT_TZ(fecha_hora_ingreso, '-03:00', '-08:00') WHERE id_ingreso!=0;*/

select fecha_hora_ingreso AS "UTC-3",CONVERT_TZ(fecha_hora_ingreso, '-03:00', '-04:00') AS "UTC-2"  from ingreso_usuario;

/*pARTE 4 insertar*/

INSERT INTO usuario (id_usuario, nombre, apellido, contrasena, zona_horaria, genero, telefono) 
VALUES 
('usuario1', 'Juan', 'Perez', '1234567890', null, 'M', 945555555),
('usuario2', 'Maria', 'Gomez', 'abcdefghij', null, 'F', 946666666),
('usuario3', 'Pedro', 'Rodriguez', 'klmnopqrst', null, 'M', 947777777),
('usuario4', 'Laura', 'Sanchez', 'uvwxyzabcd', null, 'F', 948888888),
('usuario5', 'Diego', 'Lopez', '1234567890', null, 'M', 949999999),
('usuario6', 'Carla', 'Garcia', 'abcdefghij', null, 'F', 951111111),
('usuario7', 'Federico', 'Alvarez', 'klmnopqrst', null, 'M', 952222222),
('usuario8', 'Ana', 'Torres', 'uvwxyzabcd', null, 'F', 953333333);


INSERT INTO ingreso_usuario ()
VALUES 
(2, 'usuario1', '2023-01-01 00:00:00'),
(3, 'usuario2', '2023-02-14 10:30:00'),
(4, 'usuario3', '2023-03-20 18:45:00'),
(5, 'usuario4', '2023-04-01 08:15:00'),
(6, 'usuario5', '2023-05-01 15:00:00'),
(7, 'usuario6', '2023-04-05 22:30:00'),
(8, 'usuario7', '2023-02-28 09:00:00'),
(9, 'usuario8', '2023-03-15 12:00:00');


select * from ingreso_usuario;
select fecha_hora_ingreso AS "Hora de registro original",CONVERT_TZ(fecha_hora_ingreso, '-00:00', '-03:00') AS "UTC-3",CONVERT_TZ(fecha_hora_ingreso, '-00:00', '-02:00') AS "UTC-2"  from ingreso_usuario;

/*PARTE 5
id_usuario VARCHAR(30) primary key, --> id usuario definimos varchar, ya que existen usuarios con combinaciones alfanumericas ej. enrique2023
    nombre VARCHAR(45) not null,   ---> varchar ya que acepta una cadena de string 
    apellido VARCHAR(45) not null,   ---> varchar ya que acepta una cadena de string 
    contrasena VARCHAR(45) not null,   --> varchar ya que puede ser alfanumerica ej. bahamonde1954
    zona_horaria VARCHAR(45) default '-3:00',   ---> 
    genero CHAR(1),    --> 'M' Masculino 'F' Femenino / 'H' Hombre 'M' Mujer 'O' Otres
    telefono INT not null    --> Int ya que es una expresión numérica.
        
    id_ingreso INT primary key auto_increment,  ---> int autoincremental para guardar cada registro con su nro identificador
    id_usuario VARCHAR(30) not null,  ---> lo extrae desde tabla usuario
    fecha_hora_ingreso timestamp not null default current_timestamp,   --->   ya que es timpo fecha-hora
    foreign key (id_usuario) references usuario(id_usuario)
*/

/*PARTE 6 Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono,
correo electronico). */

create table contacto(
	id_contacto int primary key auto_increment,
    id_usuario VARCHAR(30) not null,
    telefono INT not null,
    email VARCHAR(45) not null,
    foreign key (id_usuario) references usuario(id_usuario)
);

insert into contacto() values(1,'kevin',123456,'kevinrojas@123.cl');

ALTER TABLE usuario drop column telefono;

select * from usuario;
select * from contacto;











