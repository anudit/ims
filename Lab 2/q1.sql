CREATE TABLE Client_Master (
    Client_No varchar(6),
    Fname varchar(255),
    City varchar(255),
    Pincode INT(10),
    Bal_due INT(10)
);

INSERT INTO Client_Master(Client_No, Fname, City, Pincode, Bal_Due) VALUES('C00001','SMITHA JAIN','Mumbai',400054,15000);
INSERT INTO Client_Master(Client_No, Fname, City, Pincode, Bal_Due) VALUES('C00002','VANDANA RAO','Chennai',780000,0);
INSERT INTO Client_Master(Client_No, Fname, City, Pincode, Bal_Due) VALUES('C00003','PREM PUJARI','Mumbai',400057,5000);
INSERT INTO Client_Master(Client_No, Fname, City, Pincode, Bal_Due) VALUES('C00004','BASU NATH' 'Mumbai',400056,0);
INSERT INTO Client_Master(Client_No, Fname, City, Pincode, Bal_Due) VALUES('C00005','RAVI SHANKAR','Delhi',100001,2000);
INSERT INTO Client_Master(Client_No, Fname, City, Pincode, Bal_Due) VALUES('C00006','ROOPA', 'Mumbai',400050,0);


CREATE TABLE Sale_Order (
    Order_No varchar(255),
    Order_Date DATE,
    Client_No varchar(255),
    Salesman_No varchar(255),
    Delay_Date DATE,
    Order_Status varchar(255)
);

INSERT INTO Sale_Order(Order_No, Order_Date, Client_No, Salesman_No, Delay_Date, Order_Status) VALUES('O19001', DATE '2013-01-12', 'C00001', 'S00001', DATE '2013-01-20', 'In process');
INSERT INTO Sale_Order(Order_No, Order_Date, Client_No, Salesman_No, Delay_Date, Order_Status) VALUES('O19002', DATE '2013-01-25', 'C00002', 'S00002', DATE '2013-01-27', 'Cancelled');
INSERT INTO Sale_Order(Order_No, Order_Date, Client_No, Salesman_No, Delay_Date, Order_Status) VALUES('O46865', DATE '2013-02-18', 'C00003', 'S00003', DATE '2013-02-20', 'Fulfilled');
INSERT INTO Sale_Order(Order_No, Order_Date, Client_No, Salesman_No, Delay_Date, Order_Status) VALUES('O19003', DATE '2013-04-03', 'C00001', 'S00001', DATE '2013-04-07', 'Fulfilled');
INSERT INTO Sale_Order(Order_No, Order_Date, Client_No, Salesman_No, Delay_Date, Order_Status) VALUES('O46866', DATE '2013-05-20', 'C00004', 'S00002', DATE '2013-06-07', 'Cancelled');
INSERT INTO Sale_Order(Order_No, Order_Date, Client_No, Salesman_No, Delay_Date, Order_Status) VALUES('O19008', DATE '2013-05-24', 'C00005', 'S00004', DATE '2013-05-26', 'In process');

Select * from client_master where Bal_due = 0

UPDATE client_master SET city = "Jaipur" WHERE Client_no LIKE "C00004";

Select Fname, city  from client_master where Order_No IN ('O19003', 'O19002');

Select Fname, city  from client_master where Client_No IN (Select Client_No from Sale_Order where Order_No IN ('O19003', 'O19002'));

select concat(client_master.Fame , ' lives in the city of ', client_master.City) as address from Client_master;

Select fname, city  from Client_Master where Client_No IN (Select Client_No from Sale_Order where Order_status = 'In process');
