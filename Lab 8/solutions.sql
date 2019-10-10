create database lab8;
use lab8;

create table salesman (
salesman_id numeric(5),name varchar(30), city varchar(15), commission decimal(5,2),
PRIMARY KEY (`salesman_id`));

create table orders (
order_no numeric(5), purch_amt decimal(8,2), ord_date date, customer_id numeric(5), salesman_id numeric(5),
 KEY `sale_salesman_IX` (`salesman_id`),  KEY `cust_customer_IX` (`customer_id`));

 create table customer (
salesman_id numeric(5), cust_name varchar(30), city varchar(15), grade numeric(3), customer_id numeric (5),
PRIMARY KEY (`customer_id`));

insert into salesman (salesman_id, name, city, commission) values
("5001","James Hoog","New York","0.15"),
("5002","Nail Knite","Paris","0.13"),
("5005","Pit Alex","London","0.11"),
("5006","Mc Lyon","Paris","0.14"),
("5007","Paul Adam","Rome","0.13"),
("5003","Lauson Hen","San Jose","0.12");

insert into customer (customer_id, cust_name, city, grade,salesman_id) values
("3002 ", "Nick Rimando" , "New York", "100" , "5001"),
("3007", "Brad Davis", "New York", "200", "5001"),
("3005", "Graham Zusi", "California", "200", "5002"),
("3008", "Julian Green", "London", "300", "5002"),
("3004", "Fabian Johnson", "Paris", "300", "5006"),
("3009", "Geoff Cameron", "Berlin", "100", "5003"),
("3003", "Jozy Altidor", "Moscow", "200", "5007"),
("3001", "Brad Guzan", "London", "0", "5005");

insert into orders (order_no, purch_amt, ord_date, customer_id, salesman_id) values
(70001,150.5,"2012-10-05",3005,5002),
(70009,270.65,"2012-09-10",3001,5005),
(70002,65.26,"2012-10-05",3002,5001),
(70004,110.5,"2012-08-17",3009,5003),
(70007,948.5,"2012-09-10",3005,5002),
(70005,2400.6,"2012-07-27",3007,5001),
(70008,5760,"2012-09-10",3002,5001),
(70010,1983.43,"2012-10-10",3004,5006),
(70003,2480.4,"2012-10-10",3009,5003),
(70012,250.45,"2012-06-27",3008,5002),
(70011,75.29,"2012-08-17",3003,5007),
(70013,3045.6,"2012-04-25",3002,5001);

create view q1 as
select *
from salesman
where city in ("New York", "London", "Rome");
select * from q1;

create view q2 as
select customer_id, cust_name, salesman_id, city
from customer;
select * from q2;

create view q3 as
select distinct(s.salesman_id), s.name, o.order_no
from salesman s
join orders o on o.salesman_id=s.salesman_id
and ord_date IN('2012-08-17', '2012-10-10') order by salesman_id;
select * from q3;


create view q4 as
select s.salesman_id, s.name, order_no
from salesman s
join orders o on o.salesman_id=s.salesman_id
and ord_date = "2012-10-10" order by salesman_id;
select * from q4;

create view q5 as
select count(*), ord_date
from orders
group by ord_date;
select * from q5;

create view q6 as
select cust_name, s.name, s.city
from customer c
join salesman s on s.salesman_id=c.salesman_id
and c.city=s.city;
select * from q6;

create view q7 as
select s.name, avg(purch_amt), sum(purch_amt)
from orders o
join salesman s on s.salesman_id=o.salesman_id
group by s.name;
select * from q7;

CREATE VIEW q8 AS
SELECT *
FROM customer
WHERE grade =
(SELECT MAX(grade) FROM customer);
select * from q8;

CREATE VIEW q9
AS SELECT DISTINCT salesman_id, name
FROM salesman a
WHERE 3 <=
(SELECT COUNT(*)
FROM salesman b
WHERE a.salesman_id = b.salesman_id);
select * from q9;

drop view q3;
