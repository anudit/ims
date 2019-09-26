use hr;

#q-1
create view lab5_view1 as select * from employees where department_id=100;
select * from lab5_view1;

#q-2
create view lab5_view2 as select employee_id, concat(first_name, ' ',last_name) as name,email,salary,department_id from employees;
select * from lab5_view2;

#q-3
select employee_id,salary from lab5_view2;

#q-4
create view lab5_view4 as select * from employees;
update lab5_view4 set first_name='Anudit' where employee_id=181;
select First_name from lab5_view4 where employee_id=181;

#q-5
create view lab5_view5 as select first_name,last_name from employees where salary>7000 and department_id=100;
select * from lab5_view5;

#q-6
create view lab5_view6 as select department_id,count(employee_id) from employees group by department_id;
select * from lab5_view6;

#q-7
create view lab5_view7 as select first_name,last_name,department_id,city,state_province from employees
natural join departments
natural join locations;
select * from lab5_view7;

#q-8
create view lab5_view8 as select first_name,last_name,department_id,city,state_province from employees
natural join departments
natural join locations
where first_name like "%z%";

select * from lab5_view8;

#q-9
create view lab5_view9 as SELECT  department_id, department_name FROM departments;
select * from lab5_view9;

#q-10
create view lab5_view10 as select e.first_name,e.last_name,e.employee_id,j.job_title from employees e
join jobs j on e.job_id=j.job_id
join job_history j1 on j.job_id=j1.job_id
join departments d on j1.department_id=d.department_id
join locations l on d.location_id=l.location_id
where city='toronto';

select * from lab5_view10;
