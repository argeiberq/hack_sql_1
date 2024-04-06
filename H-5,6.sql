create table countries(
  id_country serial primary key,
  name varchar(60) not null
);

create table roles(
  id_role serial primary key,
  name varchar(60) not null
);

create table taxes(
  id_tax serial primary key,
  percentage integer not null
);

create table offers(
  id_offer serial primary key,
  status text not null
);

create table discounts(
  id_discount serial primary key,
  status text not null,
  percentage integer not null
);

create table payments(
  id_payment integer primary key,
  type_payments text not null
);

create table customers(
  email varchar(100) primary key,
  id_country serial not null,
  id_role serial not null,
  name varchar(60) not null,
  age integer not null,
  password varchar(20) not null,
  physical_address text not null,
  foreign key (id_country) references countries (id_country),
  foreign key (id_role) references roles (id_role)
);

create table invoice_status(
  id_invoice_status serial primary key,
  status text not null
);

create table products(
  id_product serial primary key,
  id_discount serial not null,
  id_offer serial not null,
  id_tax serial not null,
  name varchar(60) not null,
  details text not null,
  minimum_stock integer not null,
  maximum_stock integer not null,
  current_stock integer not null,
  price integer not null,
  price_with_tax integer not null,
  foreign key (id_discount) references discounts (id_discount),
  foreign key (id_offer) references offers (id_offer),
  foreign key (id_tax) references taxes (id_tax)
);

create table products_customers(
  id_product integer,
  id_customer varchar(100),
  foreign key (id_product) references products (id_product),
  foreign key (id_customer) references customers (email),
  PRIMARY KEY (id_customer, id_product)
);

create table invoices(
  id_invoice serial primary key,
  id_customer varchar(100) not null,
  id_payment integer not null,
  id_invoice_status serial not null,
  date_invoices date not null,
  total_to_pay integer not null ,
  foreign key (id_customer) references customers (email) ON DELETE CASCADE,
  foreign key (id_invoice_status) references invoice_status (id_invoice_status),
  foreign key (id_payment) references payments (id_payment)
);

create table orders(
  id_order serial primary key,
  id_invoice serial not null,
  id_product serial not null,
  detail text not null,
  price integer not null,
  amount integer not null,
  foreign key (id_invoice) references invoices (id_invoice) ON DELETE CASCADE,
  foreign key (id_product) references products (id_product)
);

insert into countries (id_country, name) values (1, 'venezuela'),(2, 'chile'),(3, 'argentina');
insert into roles (id_role, name) values (1, 'administrativo'),(2, 'legal'),(3, 'RRHH');
insert into taxes (id_tax, percentage) values (1, 0.15),(2, 0.2),(3, 0.15);
insert into offers (id_offer, status) values (1, 'activa'),(2, 'activa'),(3, 'activa');
insert into discounts (id_discount, status, percentage) values (1, 'active', 0.05),(2, 'active', 0.10),(3, 'active', 0.10);
insert into payments (id_payment, type_payments) values (1, 'efectivo'),(2, 'devito'),(3, 'credito');
insert into customers (email, id_country, id_role, name, age, password, physical_address) values ('juan@correo.com', 1, 2, 'juan', 30, 'juan123', 'av.fajardo, edf. doral'),('jose@correo.com', 2, 2, 'jose', 50, 'jose123', 'valle arriva, edf. bella vista'),('judas@correo.com', 3, 2, 'judas', 20, 'judas123', 'av. palermo, edf. sam martin');
insert into invoice_status (id_invoice_status, status) values (1, 'por pagar'),(2, 'paga'),(3, 'paga');
insert into products  (id_discount, id_offer, id_tax, name, details, minimum_stock, maximum_stock, current_stock, price, price_with_tax) values (1, 1, 1, 'Camiseta', 'Algodón 100%', 20, 50, 21, 20.00, 21.00),(2, 1, 2, 'cocina', '6 hornillas, a gas', 15, 30, 16, 300.00, 330.00),(3, 1, 2, 'nevera', 'samsung, smart', 15, 30, 20, 500.00, 550.00);


--------------------- INVOICES --------------------------

insert into invoices (id_customer, id_payment, id_invoice_status, date_invoices, total_to_pay)
values ('juan@correo.com', 1, 2, '2024-04-06', 40.00);
insert into orders (id_invoice, id_product, detail, amount, price)
values (1, 1, 'Camiseta algodon 100%', 2, 20.00);

insert into invoices (id_customer, id_payment, id_invoice_status, date_invoices, total_to_pay)
values ('jose@correo.com', 2, 2, '2024-04-06', 300.00);
insert into orders (id_invoice, id_product, detail, amount, price)
values (2, 2, 'cocina', 1, 35.00);

insert into invoices (id_customer, id_payment, id_invoice_status, date_invoices, total_to_pay)
values ('judas@correo.com', 3, 2, '2024-04-06', 500.00);
insert into orders (id_invoice, id_product, detail, amount, price)
values (3, 3, 'nevera', 1, 500.00);

-------------------------- DELETE USER --------------------------

delete from customers where email = 'juan@correo.com';

select * from customers;

-------------------------- UPDATE --------------------------

update customers set age = 40 where email = 'judas@correo.com';

select * from customers;

update taxes set percentage = 0.08 where id_tax = 1;
update taxes set percentage = 0.08 where id_tax = 2;
update taxes set percentage = 0.08 where id_tax = 3;

select * from taxes;

update products set price = 21.00 WHERE id_product = 1;
update products set price = 320.00 WHERE id_product = 2;
update products set price = 520.00 WHERE id_product = 3;

select * from products;