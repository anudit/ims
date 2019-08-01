CREATE TABLE Employee (
    Eno varchar(255),
    Ename varchar(255),
    Dept varchar(255),
    Salary INT(10),
    City varchar(255),
    PAN varchar(255),
    Manager_name varchar(255)
);

INSERT INTO Employee(Eno, Ename, Dept, Salary, City, PAN, Manager_name) VALUES('ENO100', 'NAME100', 'Engineering', 12000, 'Hyderabad', 'PANNO100', 'MNAME100');
INSERT INTO Employee(Eno, Ename, Dept, Salary, City, PAN, Manager_name) VALUES('ENO101', 'NAME101', 'Law',12120, 'Mumbai', 'PANNO101', 'MNAME101');
INSERT INTO Employee(Eno, Ename, Dept, Salary, City, PAN, Manager_name) VALUES('ENO102', 'NAME102', 'Engineering', 12240, 'Mumbai', 'PANNO102', 'MNAME102');
INSERT INTO Employee(Eno, Ename, Dept, Salary, City, PAN, Manager_name) VALUES('ENO103', 'NAME103', 'Law', 12360, 'Hyderabad', 'PANNO103', 'MNAME103');
INSERT INTO Employee(Eno, Ename, Dept, Salary, City, PAN, Manager_name) VALUES('ENO104', 'NAME104', 'Management', 12480, 'Noida', 'PANNO104', 'MNAME104');
INSERT INTO Employee(Eno, Ename, Dept, Salary, City, PAN, Manager_name) VALUES('ENO105', 'NAME105', 'Engineering', 12600, 'Mumbai', 'PANNO105', 'MNAME105');
INSERT INTO Employee(Eno, Ename, Dept, Salary, City, PAN, Manager_name) VALUES('ENO106', 'NAME106', 'Management', 12720, 'Noida', 'PANNO106', 'MNAME106');
INSERT INTO Employee(Eno, Ename, Dept, Salary, City, PAN, Manager_name) VALUES('ENO107', 'NAME107', 'Engineering', 12840, 'Hyderabad', 'PANNO107', 'MNAME107');
INSERT INTO Employee(Eno, Ename, Dept, Salary, City, PAN, Manager_name) VALUES('ENO108', 'NAME108', 'Engineering', 12960, 'Noida', 'PANNO108', 'MNAME108');
INSERT INTO Employee(Eno, Ename, Dept, Salary, City, PAN, Manager_name) VALUES('ENO109', 'NAME109', 'Law', 13080, 'Mumbai', 'PANNO109', 'MNAME109');

SELECT * FROM Employee WHERE city != 'Hyderabad';

UPDATE Employee SET Manager_name = "Jain" WHERE City LIKE "Noida";

SELECT COUNT(Eno) AS "Employees under Jain" FROM Employee WHERE Manager_name LIKE 'Jain';

UPDATE Employee SET Ename = "ANAME100" WHERE PAN LIKE "PANNO100";

SELECT * FROM Employee WHERE Ename LIKE 'A%';

