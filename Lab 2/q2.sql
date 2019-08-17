create table emply(
    empcode varchar(4) primary key,
    empname varchar(20) not null,
    address varchar(30),
    age INT(2) not null,
    deptcode varchar(4) not null
);

INSERT INTO emply(empcode, empname, address, age, deptcode) VALUES('E101','Anjaly','Anjaly Nivas, Thiruvalla', 25,'D301');
INSERT INTO emply(empcode, empname, address, age, deptcode) VALUES('E102','Bobby','Alapuzha',28,'D305');
INSERT INTO emply(empcode, empname, address, age, deptcode) VALUES('E103','Aravind','Chennai',31,'D305');
INSERT INTO emply(empcode, empname, address, age, deptcode) VALUES('E104','Lakshmi','Mannar',55,'D707');
INSERT INTO emply(empcode, empname, address, age, deptcode) VALUES('E105','Daisy','Chaithram, Angamaly', 35,'D707');
INSERT INTO emply(empcode, empname, address, age, deptcode) VALUES('E106','Esha','Mumbai', 23,'D707');
INSERT INTO emply(empcode, empname, address, age, deptcode) VALUES('E107','Georgy','Pala', 45,'D909');
INSERT INTO emply(empcode, empname, address, age, deptcode) VALUES('E108','Prakash','Vennikulam', 36,'D110');
INSERT INTO emply(empcode, empname, address, age, deptcode) VALUES('E109','Madhavan','Mynakum, Kottayam', 46,'D202');
INSERT INTO emply(empcode, empname, address, age, deptcode) VALUES('E110','Anugraha','Aparna, Angamaly', 47,'D301');
INSERT INTO emply(empcode, empname, address, age, deptcode) VALUES('E111','Deva','Trichy', 38,'D301');
INSERT INTO emply(empcode, empname, address, age, deptcode) VALUES('E112','Saju','Dhanya, Ernakulam', 27,'D202');
INSERT INTO emply(empcode, empname, address, age, deptcode) VALUES('E113','Priyesh','Priya Nivas, Kottayam',26,'D302');

update emply set Age=15 where Empcode ="E107";

select * from emply where Age between 35 and 45;

create table payslip(
    empcode varchar(4) primary key,
    basic int(6) not null,
    hra int(6) not null,
    da int(6) not null,
    foreign key(empcode) references emply(empcode)
);

INSERT INTO payslip(empcode, basic, hra, da) VALUES ('E101' ,4000 ,1900 ,1500);
INSERT INTO payslip(empcode, basic, hra, da) VALUES ('E102' ,4500 ,2200 ,2000);
INSERT INTO payslip(empcode, basic, hra, da) VALUES ('E103' ,5000 ,2800 ,2200);
INSERT INTO payslip(empcode, basic, hra, da) VALUES ('E104' ,7000 ,3000 ,2700);
INSERT INTO payslip(empcode, basic, hra, da) VALUES ('E105' ,3000 ,1500 ,1200);
INSERT INTO payslip(empcode, basic, hra, da) VALUES ('E106' ,5700 ,3000 ,2900);
INSERT INTO payslip(empcode, basic, hra, da) VALUES ('E107' ,6200 ,3300 ,3000);
INSERT INTO payslip(empcode, basic, hra, da) VALUES ('E108' ,5700 ,3700 ,3000);
INSERT INTO payslip(empcode, basic, hra, da) VALUES ('E109' ,7500 ,4660, 545);
INSERT INTO payslip(empcode, basic, hra, da) VALUES ('E110' ,5000 ,300, 100);
INSERT INTO payslip(empcode, basic, hra, da) VALUES ('E111' ,6000 ,200, 120);

Select emply.empcode, emply.empname, emply.address, ( basic + hra + da ) AS Netpay from emply, payslip WHERE emply.empcode = payslip.empcode ORDER BY emply.empcode;

select concat('Employees with empcode ' , payslip.empcode , ' draws a basic salary ', payslip.basic) as sentence from payslip;

select emply.Empname, emply.Address from emply, payslip where emply.Empcode=payslip.Empcode and payslip.basic + payslip.hra + payslip.da between  5000 and 7000;

Select  emply.* , ( payslip.basic + payslip.hra + payslip.da ) AS Total_Sal from emply, payslip where ( emply.empcode IN (Select payslip.empcode from payslip where payslip.empcode > 'E107') and emply.empcode = payslip.empcode);
