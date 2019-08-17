create table publisher
(
    Publisher_Name varchar(30),
    address varchar(30) not null,
    phone varchar(12),
    primary key(Publisher_Name)
);

create table book
(
    Book_id int not null,
    Title varchar(20),
    Publisher_Name varchar(20) ,
    Pub_Year int,
    Primary key(Book_id,Publisher_Name),
    foreign key(Publisher_Name) references publisher(Publisher_Name)
);

create table book_authors
(
    Book_id int not null,
    Author_name varchar(30),
    primary key(Book_id),
    foreign key(Book_id) references book(Book_id)
);

create table library_branch
(
    Branch_Id int,
    Branch_Name varchar(20) ,
    address varchar(200),
    primary key(Branch_Id)
);

create table book_lending
(
    Book_Id int,
    Branch_Id int,
    Card_No int,
    Date_Out date,
    Due_Date date ,
    primary key(Book_Id,Branch_Id,Card_No),
    foreign key(Book_Id) references book(Book_Id),
    foreign key(Branch_Id) references library_branch(Branch_Id)
);

create table bookcopies
(
    Book_Id int,
    Branch_Id int,
    noofcopies int,
    primary key(Book_Id,Branch_Id),
    foreign key(Book_Id) references book(Book_Id),
    foreign key(Branch_Id) references library_branch(Branch_Id)
);


INSERT INTO PUBLISHER VALUES ('MCGRAW-HILL', 'BANGALORE', 9989076587);
INSERT INTO PUBLISHER VALUES ('PEARSON', 'NEWDELHI', 9889076565);
INSERT INTO PUBLISHER VALUES ('RANDOM HOUSE', 'HYDRABAD', 7455679345);
INSERT INTO PUBLISHER VALUES ('HACHETTE LIVRE', 'CHENAI', 8970862340);
INSERT INTO PUBLISHER VALUES ('GRUPO PLANETA', 'BANGALORE', 7756120238);

INSERT INTO BOOK VALUES (1, 'DBMS', 'MCGRAW-HILL', 2017);
INSERT INTO BOOK VALUES (2, 'ADBMS', 'MCGRAW-HILL', 2016);
INSERT INTO BOOK VALUES (3, 'CN', 'PEARSON', 2016);
INSERT INTO BOOK VALUES (4, 'CG', 'GRUPO PLANETA', 2015);
INSERT INTO BOOK VALUES (5, 'OS', 'PEARSON', 2016);

INSERT INTO BOOK_AUTHORS VALUES (1, 'NAVATHE');
INSERT INTO BOOK_AUTHORS VALUES (2, 'NAVATHE');
INSERT INTO BOOK_AUTHORS VALUES (3, 'TANENBAUM');
INSERT INTO BOOK_AUTHORS VALUES (4, 'EDWARD ANGEL');
INSERT INTO BOOK_AUTHORS VALUES (5, 'GALVIN');

INSERT INTO LIBRARY_BRANCH VALUES (10, 'RR NAGAR', 'BANGALORE');
INSERT INTO LIBRARY_BRANCH VALUES (11, 'RNSIT', 'BANGALORE');
INSERT INTO LIBRARY_BRANCH VALUES (12, 'RAJAJI NAGAR', 'BANGALORE');
INSERT INTO LIBRARY_BRANCH VALUES (13, 'NITTE', 'MANGALORE');
INSERT INTO LIBRARY_BRANCH VALUES (14, 'MANIPAL', 'UDUPI');

INSERT INTO book_lending VALUES (1,10, 101, '17-01-01', '01-06-12');
INSERT INTO book_lending VALUES (3, 14, 101, '17-01-11', '13-03-12');
INSERT INTO book_lending VALUES (2, 13, 101, '17-02-17', '21-04-12');
INSERT INTO book_lending VALUES (4, 11, 101, '17-03-15', '17-04-15');
INSERT INTO book_lending VALUES (1, 11, 104, '17-04-12', '17-05-12');

INSERT INTO BOOKCOPIES VALUES (1, 10,10);
INSERT INTO BOOKCOPIES VALUES (1, 11,5);
INSERT INTO BOOKCOPIES VALUES (2, 12,2);
INSERT INTO BOOKCOPIES VALUES (2, 13,5);
INSERT INTO BOOKCOPIES VALUES (3, 14,7);
INSERT INTO BOOKCOPIES VALUES (5, 10,1);
INSERT INTO BOOKCOPIES VALUES (4, 11,3);

/* q1 */
SELECT
    book.Book_Id,
    book.Title,
    book.Publisher_Name,
    bookcopies.noofcopies,
    book_authors.Author_name AS 'Author Name'
FROM
    book,
    bookcopies,
    book_authors
WHERE
    book.Book_Id = book_authors.Book_Id
        AND bookcopies.Book_Id = book.Book_Id;

/* q2 */
Select *
from book
where Book_Id in (
    Select Book_Id
    from book_lending
    where Card_No LIKE (
        SELECT Card_No
        FROM book_lending
        WHERE Date_Out BETWEEN '2017-01-01' AND '2017-06-30'
        GROUP BY Card_No HAVING COUNT(*) > 3
        )
    )
;


/* q3 */
DELETE FROM book WHERE Book_Id = 1;
SELECT * FROM book_lending;

/* q4 */
Select * from book, bookcopies
where (
    book.Book_id in (
        SELECT bookcopies.Book_Id
        FROM book, bookcopies
        WHERE book.Book_Id = bookcopies.Book_Id
        GROUP BY book.Book_Id)
    )
and book.Book_Id = bookcopies.Book_Id ;
