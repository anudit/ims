/* 1 */

create table person(
	driver_id char(4) primary key,
	name varchar(30),
	address varchar(30)
);

create table car(
	reg_no char(15) primary key,
	model char(20),
	year tinyint(4)
);

create table accident(
	report_no tinyint primary key,
	acc_date date,
	location varchar(30)
);

Create table owns (
	driver_id varchar(20) references persondb,
    regno varchar(20) references cardb
)

Create table participated(
    driver_id varchar(20) references persondb,
    regno varchar(20) references cardb,
    report_no int(10) references accidentdb,
    damage_amount int(10)
)

/* 2 */

insert into person values('1234','amith','no a-1-12 koppal');
insert into person values('2345','anil','23 vijaya apts');
insert into person values('3412','john','no 3423 vicky apts');
insert into person values('4567','arun','kamal nivas koppal');
insert into person values('4522','sunil','no 54 ravi nagar');
insert into car values('ka37k32','hyundai',2);
insert into car values('ka05d34','maruti 800',1);
insert into car values('ka23j90','zen',2);
insert into car values('ka35f45','fiat',2);
insert into car values('ka36m78','benz',2);
insert into accident values(12,'1990-02-12','vit cross');
insert into accident values(34,'1999-01-31','jayanagar');
insert into accident values(56,'1998-12-12','btm layout');
insert into accident values(67,'2003-06-07','jp nagar');
insert into accident values(87,'2001-05-01','allalsandra');
insert into owns values('1234','ka37k32');
insert into owns values('2345','ka05d34');
insert into owns values('3412','ka23j90');
insert into owns values('4567','ka35f45');
insert into owns values('4522','ka36m78');
insert into participated values('1234','ka37k32',12,12000);
insert into participated values('2345','ka05d34',34,13000);
insert into participated values('3412','ka23j90',56,14000);
insert into participated values('4567','ka35f45',67,12450);
insert into participated values('4522','ka36m78',87,10000);

/* 1 */

Update participated set damage_amount = 25000 where report_no = 12;

/* 2 */

Insert into participated values('1004','2004',10,3000);

/* 3 */

Select count(*) from accident where acc_date LIKE '2001-%-%';

/* 4 */

Select count(*) from car c ,participated p where c.reg_no=p.regno and c.model = 'benz'
