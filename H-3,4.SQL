create table countries(
  id_contry serial primary key,
  name varchar(60) not null
);

create table priorities(
  id_priority serial primary key,
  type_name varchar(50) not null
);

create table contact_request(
  id_email varchar(100) primary key,
  id_contry integer not null,
  id_priority integer not null,
  name varchar(60) not null,
  detail text not null,
  physical_address text not null,
  foreign key (id_priority) references priorities (id_priority),
  foreign key (id_contry) references countries (id_contry)
);
insert into countries
(id_contry, name)
values
(11111, 'argentina');
insert into countries
(id_contry, name)
values
(22222, 'brasil');
insert into countries
(id_contry, name)
values
(33333, 'usa');
insert into countries
(id_contry, name)
values
(44444,'españa');
insert into countries
(id_contry, name)
values
(55555, 'venezuela');

insert into priorities
(id_priority, type_name)
values
(1212, 'enzo');
insert into priorities
(id_priority, type_name)
values
(2121, 'joao');
insert into priorities
(id_priority, type_name)
values
(3323, 'jou');

insert into contact_request
(id_contry, id_email, id_priority, name, detail, physical_address)
values
(11111,'arge@gmail.com', 1212, 'jose', 'hola como estas', 'av. san martin');
insert into contact_request
(id_contry, id_email, id_priority, name, detail, physical_address)
values
(22222,'bra@gmail.com', 2121, 'martin', 'hola como estas', 'av. san martin');
insert into contact_request
(id_contry, id_email, id_priority, name, detail, physical_address)
values
(33333,'usa@gmail.com', 3323, 'jon', 'hola como estas', 'av. san martin');
delete from contact_request where id_contry = 33333;

update contact_request set id_email = 'argen01@gmail.com', id_priority = 1212, name = 'jose',detail = 'hola', physical_address = 'av.San martin' where id_contry = 11111;
select * from countries;
select * from priorities;
select * from contact_request;