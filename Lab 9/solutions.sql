create database lab9;
use lab9;

DROP TRIGGER IF EXISTS q1;
DELIMITER $$
    CREATE TRIGGER q1
    BEFORE INSERT ON customer
    FOR EACH ROW BEGIN
		IF (NEW.customer_id = '0') THEN
			signal sqlstate '45000' set message_text = 'Invalid ID 0';
	  END IF;
    END$$
DELIMITER ;

insert into customer (customer_id, cust_name, city, grade,salesman_id) values ("0000", "Invalid Cust" , "Some Place", "99" , "88");

DROP TRIGGER IF EXISTS q2;
DELIMITER $$
    CREATE TRIGGER q2
    BEFORE INSERT ON customer
    FOR EACH ROW BEGIN
		IF (NEW.grade = '0') THEN
			signal sqlstate '45000' set message_text = 'Invalid Grade 0';
	  END IF;
    END$$
DELIMITER ;

insert into customer (customer_id, cust_name, city, grade,salesman_id) values ("3003", "Invalid Cust" , "Some Place", "0" , "88");

create table customerCopy (
salesman_id numeric(5), cust_name varchar(30), city varchar(15), grade numeric(3), customer_id numeric (5),
PRIMARY KEY (`customer_id`));

DROP TRIGGER IF EXISTS q3;
DELIMITER $$
    CREATE TRIGGER q3
    BEFORE INSERT ON customer
    FOR EACH ROW BEGIN
		insert into customercopy (customer_id, cust_name, city, grade,salesman_id) values (new.customer_id, new.cust_name, new.city, new.grade, new.salesman_id);
    END$$
DELIMITER ;

insert into customer (customer_id, cust_name, city, grade,salesman_id) values ("3003", "Invalid Cust" , "Some Place", "90" , "88");
select * from customercopy;

DROP TRIGGER IF EXISTS q4;
DELIMITER $$
    CREATE TRIGGER q4
    BEFORE INSERT ON customer
    FOR EACH ROW BEGIN
		delete from customer where customer_id = new.customer_id;
    END$$
DELIMITER ;
insert into customer (customer_id, cust_name, city, grade,salesman_id) values ("3003", "Invalid Cust" , "Some Place", "90" , "88");
