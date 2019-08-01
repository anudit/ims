CREATE TABLE Student (
    Rno varchar(255),
    Name varchar(255),
    Branch varchar(255),
    Year INT(4),
    Gender varchar(255),
    Marks INT(255),
    Age INT(255)
);

INSERT INTO Student(Rno, Name, Branch, Year, Gender, Marks, Age) VALUES('RNO100', 'NAME100', 'CSE',1, 'FEMALE', 70, '100');
INSERT INTO Student(Rno, Name, Branch, Year, Gender, Marks, Age) VALUES('RNO101', 'NAME101', 'CSE',1, 'FEMALE', 70, '101');
INSERT INTO Student(Rno, Name, Branch, Year, Gender, Marks, Age) VALUES('RNO102', 'NAME102', 'CSE',1, 'FEMALE', 70, '102');
INSERT INTO Student(Rno, Name, Branch, Year, Gender, Marks, Age) VALUES('RNO103', 'NAME103', 'CSE',1, 'FEMALE', 70, '103');
INSERT INTO Student(Rno, Name, Branch, Year, Gender, Marks, Age) VALUES('RNO104', 'NAME104', 'CSE',1, 'FEMALE', 70, '104');
INSERT INTO Student(Rno, Name, Branch, Year, Gender, Marks, Age) VALUES('RNO105', 'NAME105', 'CSE',3, 'MALE', 70, '105');
INSERT INTO Student(Rno, Name, Branch, Year, Gender, Marks, Age) VALUES('RNO106', 'NAME106', 'CSE',3, 'MALE', 70, '106');
INSERT INTO Student(Rno, Name, Branch, Year, Gender, Marks, Age) VALUES('RNO107', 'NAME107', 'CSE',3, 'MALE', 70, '107');
INSERT INTO Student(Rno, Name, Branch, Year, Gender, Marks, Age) VALUES('RNO108', 'NAME108', 'CSE',3, 'MALE', 70, '108');
INSERT INTO Student(Rno, Name, Branch, Year, Gender, Marks, Age) VALUES('RNO109', 'NAME109', 'CSE',3, 'MALE', 70, '109');

SELECT * FROM Student WHERE Year LIKE 3 and Branch LIKE 'CSE';

UPDATE Student SET Gender = 0 WHERE Gender LIKE "MALE";
ALTER TABLE Student MODIFY COLUMN Gender Boolean;

SELECT * FROM Student;
