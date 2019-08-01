CREATE TABLE Book (
    Bno varchar(255),
    Title varchar(255),
    Author varchar(255),
    Price INT(4)
);

INSERT INTO Book(Bno, Title, Author, Price) VALUES('BNO100', 'DTIT100', 'A100',231);
INSERT INTO Book(Bno, Title, Author, Price) VALUES('BNO101', 'DTIT101', 'A101',231);
INSERT INTO Book(Bno, Title, Author, Price) VALUES('BNO102', 'DTIT102', 'A102',238);
INSERT INTO Book(Bno, Title, Author, Price) VALUES('BNO103', 'DTIT103', 'A103',238);
INSERT INTO Book(Bno, Title, Author, Price) VALUES('BNO104', 'DTIT104', 'A104',238);
INSERT INTO Book(Bno, Title, Author, Price) VALUES('BNO105', 'TITL105', 'C105',245);
INSERT INTO Book(Bno, Title, Author, Price) VALUES('BNO106', 'TITL106', 'C106',245);
INSERT INTO Book(Bno, Title, Author, Price) VALUES('BNO107', 'TITL107', 'C107',245);
INSERT INTO Book(Bno, Title, Author, Price) VALUES('BNO108', 'TITL108', 'C108',252);
INSERT INTO Book(Bno, Title, Author, Price) VALUES('BNO109', 'TITL109', 'C109',252);

SELECT * FROM Book WHERE Title LIKE 'D%';

DELETE FROM Book WHERE Author LIKE 'A%';
