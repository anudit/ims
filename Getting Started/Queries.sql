CREATE DATABASE anudit;

CREATE TABLE Students (
    EnrollmentNo varchar(255),
    LastName varchar(255),
    FirstName varchar(255)
);

SELECT * from students;

ALTER TABLE students ADD dor DATE;

INSERT INTO students(EnrollmentNo, LastName, FirstName, dor) VALUES("E18CSE024", "Nagar", "Anudit", DATE '2019-07-19');
INSERT INTO students(EnrollmentNo, LastName, FirstName, dor) VALUES("E18CSE025", "Jalota", "Anurup", DATE '2019-07-19');
INSERT INTO students(EnrollmentNo, LastName, FirstName, dor) VALUES("E18CSE022", "Agarwal", "Anshuman", DATE '2019-07-19');

SELECT * from students;

SELECT EnrollmentNo, FirstName from students where (EnrollmentNo) like 'E18CSE%';

SELECT EnrollmentNo, FirstName from students where (EnrollmentNo) like 'E18CSE%' order by EnrollmentNo DESC;

SELECT * from students WHERE (EnrollmentNo) BETWEEN 'E18CSE022' AND 'E18CSE024';

ALTER TABLE students MODIFY COLUMN EnrollmentNo varchar(255) NOT NULL PRIMARY KEY;

UPDATE students SET LastName = "Agarwall" WHERE FirstName LIKE "Anshuman";