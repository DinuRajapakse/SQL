-- USE Sales;
-- CREATE TABLE IF NOT EXISTS sales
-- (
-- 	purchase_number INT NOT NULL PRIMARY KEY auto_increment,
--     date_of_purchase DATE NOT NULL,
--     customer_id INT, -- we might not know who we sold to 
--     item_code VARCHAR(10) NOT NULL
-- );
-- CREATE TABLE IF NOT EXISTS customers
-- (
-- 	customer_id INT,
--     first_name VARCHAR(255),
--     last_name VARCHAR(255), 
--     email_address VARCHAR(255),
--     number_of_complaints INT
-- );

-- SELECT * FROM sales;
-- SELECT * FROM sales.sales;
-- DROP TABLE sales;

CREATE TABLE IF NOT EXISTS sales
(
 	purchase_number INT NOT NULL PRIMARY KEY auto_increment,
    date_of_purchase DATE NOT NULL,
    customer_id INT, -- we might not know who we sold to 
    item_code VARCHAR(10) NOT NULL
);

-- DROP TABLE customers;
CREATE TABLE IF NOT EXISTS customers
(
	customer_id int,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int,
    primary key(customer_id)
);

create table if not exists items
(
	item_code varchar(255),
    item varchar(255),
    unit_price numeric(10,2),
    company_id varchar(255),
    primary key(item_code)
);

create table if not exists companies
(
	company_id varchar(255),
    company_name varchar(255),
    headquaters_phone_number int(12),
    primary key(company_id)
);
alter table sales
add foreign key (customer_id) references customers(customer_id) on delete cascade;

-- this is how you remove the foreign key
alter table sales
drop foreign key sales_ibfk_1;

use sales;
drop table sales;
drop table customers;
drop table items;
drop table companies;

create table if not exists customers
(
	customer_id INT NOT NULL,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int,
    primary key (customer_id)
);

alter table customers
add unique key (email_address);

alter table customers
drop index email_address_2;

alter table customers
drop index email_address;

drop table customers;

create table if not exists customers
(
	customer_id int not null auto_increment,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int,
    primary key (customer_id)
);

alter table customers
add column gender enum('M','F') after last_name;

insert into customers
(first_name, last_name, gender, email_address, number_of_complaints)
values('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);

alter table customers
change column number_of_complaints number_of_complaints int default 0;

insert into customers (first_name, last_name, gender)
values ('Peter', 'Figaro', 'M');

select * from customers;

alter table customers
alter column number_of_complaints drop default;

create table if not exists companies
(
	company_id varchar(255),
    company_name varchar(255) default 'X',
    headquaters_phone_number varchar(255),
    unique key (headquaters_phone_number)
);

alter table companies
add primary key (company_id);



drop table companies;

create table if not exists companies
(
	company_id int primary key auto_increment,
    headquaters_phone_number varchar(255),
    company_name varchar(255) not null
);

alter table companies
modify company_name varchar(255) null;

alter table companies
change column company_name company_name varchar(255) not null;

insert into companies (headquaters_phone_number, company_name)
values('+1 (202) 555-0196', 'company A');

select * from companies;

alter table companies
modify headquaters_phone_number varchar(255) NULL;

alter table companies
change column headquaters_phone_number headquaters_phone_number varchar(255) not null;

-- writing clean code
use sales;

CREATE TABLE IF NOT EXISTS test 
(
    numbers 	INT(10),
    words 		VARCHAR(10)
);

SELECT 
    *
FROM
    test;
drop table test;

use sales;
SELECT 
    *
FROM
    customers;