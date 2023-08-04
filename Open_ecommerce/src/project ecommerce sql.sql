create database open_ecomerce;
use open_ecomerce;

create table user_table(user_name varchar(100) not null , user_email varchar(100) primary key , user_number bigint not null , user_que varchar(100) not null , user_ans varchar(100) not null , user_password varchar(50) not null , user_address varchar(500)  , user_city varchar(50)  , user_state varchar(50) , user_country varchar(50));
show tables;
describe user_table;
select * from user_table;
select * from user_table where user_email="ajmal@gmail.com" && user_password="ajmal2002";

create table product_table(product_id int primary key,product_name varchar(100) not null,product_category varchar(100) not null,product_price int not null,product_active varchar(10) not null);
describe product_table;
select * from product_table;

Select * from product_table where product_name like'%Smart Phone%' or product_category like'%Smart Phone%' and product_active='yes';

show tables;

drop table product_table;

select user_name from user_table where user_email="ajmal@gmail.com";

create table cart(email varchar(100),product_id int,name varchar(50),quantity int,price int,total int); 
select * from cart;
drop table cart;

create table cartExist(email varchar(100),product_id int,name varchar(50),total int);
select * from cartExist;
drop table cartExist;

create table bill(email varchar(100),address varchar(500),city varchar(50),state varchar(50),country varchar(50),billuser_number bigint,order_date varchar(30),payment_method varchar(30),status varchar(30));
select * from bill;
drop table bill;