# SOCIAL OPLESK
### 🏴‍☠️ HACKS 

<br/>

📚 tutoriales de python [tutorial 1](https://www.w3schools.com/postgresql/index.php) | [tutorial 2](https://www.tutorialesprogramacionya.com/postgresqlya/)
---

```diff
- NOTA HACER LAS PRÁCTICAS MEDIANTE coderpad.io / onecompiler.com / sqliteonline.com
```

<br/>

|Hacks | Details | 
|----------|---------|
| H-1      | REGISTER DATABASE |
| H-2      | CRUD - REGISTER DATABASE |
| H-3      | CONTACT DATABASE |
| H-4      | CRUD - CONTACT DATABASE | 
| H-5      | ECOMMERCE DATABASE |
| H-6      | CRUD |
<br/>


## 🏆 H-1
![](https://github.com/argeiberq/hack_sql_1/blob/main/captures/H-1.png)

![](https://github.com/SocialOplesk/hack_sql_1/blob/main/gifs/hack_sql_1_run_gif.gif)
```sh

design register database

tables:
- table countries
- table users

-----------------
⚡ example script

create table countries(
  id_country serial primary key,
  name varchar(50) not null  
);

create table users(
 id_users serial primary key,
 id_country integer not null,
 email varchar(100) not null,
 name varchar (50) not null,
 foreign key (id_country) references countries (id_country)   
);
```


## 🏆 H-2
![](https://github.com/argeiberq/hack_sql_1/blob/main/captures/H-2.png)
![](https://github.com/SocialOplesk/hack_sql_1/blob/main/gifs/hack_sql_1_install_gif.gif)

```sh
crud register database

-----------------
⚡ example script

✔ create:
- insert into countries (name) values ('argentina') , ('colombia'),('chile');
- select * from countries;

- insert into users (id_country, email, name) 
  values (2, 'foo@foo.com', 'fooziman'), (3, 'bar@bar.com', 'barziman'); 
- select * from users;

✔ delete:
- delete from users where email = 'bar@bar.com';

✔ update:
- update users set email = 'foo@foo.foo', name = 'fooz' where id_users = 1;
- select * from users;

✔select:
- select * from users inner join  countries on users.id_country = countries.id_country;

- select u.id_users as id, u.email, u.name as fullname, c.name 
  from users u inner join  countries c on u.id_country = c.id_country;
```


## 🏆 H-3
![](https://github.com/SocialOplesk/hack_sql_1/blob/main/assets/contact_database.png)
![](https://github.com/argeiberq/hack_sql_1/blob/main/captures/H-3.png)
```sh
design contact database

tables:
- table countries
- table priorities
- table contact_request
```


## 🏆 H-4
![](https://github.com/argeiberq/hack_sql_1/blob/main/captures/H-4.1.png)
![](https://github.com/argeiberq/hack_sql_1/blob/main/captures/H-4.2.png)
```sh
crud contact database

✔insert:
- insert 5 record in countries
- insert 3 record in priorities
- insert 3 record in contact_request

✔delete;
- delete last user:

✔update:
- update first user:
```


## 🏆 H-5
![](https://github.com/SocialOplesk/hack_sql_1/blob/main/assets/ecommerce_database.png)
![](https://github.com/argeiberq/hack_sql_1/blob/main/captures/H-5.png)
```sh
design ecommerce database

tables:
- table countries
- table roles
- table taxes
- table offers
- table discounts
- table payments
- table customers
- table invoice_status
- table products
- table product_customers
- table invoices
- table orders
```


## 🏆 H-6
![](https://github.com/argeiberq/hack_sql_1/blob/main/captures/H-6.png)
```sh
crud ecommerce database

✔insert:
- insert 3 record in all tables
- create 3 invoices

✔delete:
- delete last first user:

✔update:
- update last user:
- update all taxes:
- update all prices

-----------------
⚡ example script


✔ Many to Many: products table and customers table

create table products (
    id_product serial primary key,
    ...
);

create table customers (
    id_customer serial primary key,
    ...
);

create table products_customers (
    id_customer integer,
    id_product integer,
    foreign key (id_customer) references customers (id_customer),
    foreign key (id_product) references products (id_product),
    PRIMARY KEY (id_customer, id_product)
);
```
