﻿use mysql;
create database centro_estudios;


use centro_estudios;
create table alumno(dni varchar(9),nombre varchar(35), apellidos varchar(35), curso varchar(15), fecha_nacimiento date, primary key(dni));


create table profesor(dni varchar(9),nombre varchar(35), apellidos varchar(35), departamento varchar(40), sueldo decimal(15,2), primary key(dni));


create table asignatura(codigo varchar(20), nombre varchar(35), primary key(codigo));


create table detalle_clase(alumno varchar(9), profesor varchar(9), asignatura varchar(20), primary key (alumno, profesor, asignatura), foreign key (alumno) references alumno(dni),
foreign key (profesor) references profesor(dni),
foreign key (asignatura) references asignatura(codigo));

create or replace view alumno_con_asignatura as select a.dni, a.nombre, a.apellidos, a.curso, a.fecha_nacimiento, asi.nombre as asignatura from alumno as a inner join detalle_clase as dc on a.dni = dc.alumno inner join asignatura as asi on dc.asignatura = asi.codigo;

create or replace view alumno_con_profesor as select a.dni, a.nombre, a.apellidos, a.curso, a.fecha_nacimiento, p.nombre as profesor from alumno as a inner join detalle_clase as dc on a.dni = dc.alumno inner join profesor as p on dc.profesor = p.dni;

