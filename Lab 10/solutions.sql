use hr;
select * from jobs;

DELIMITER $$
CREATE PROCEDURE `q1`
(INOUT no_employees INT, IN salary INT)
BEGIN
CASE
WHEN (salary>10000) THEN
	(SELECT COUNT(job_id) INTO no_employees
	FROM jobs
	WHERE min_salary>10000);
WHEN (salary<10000) THEN
	(SELECT COUNT(job_id) INTO no_employees
	FROM jobs
	WHERE min_salary<10000);
ELSE
	(SELECT COUNT(job_id) INTO no_employees
	FROM jobs WHERE min_salary=10000);
END CASE;
END$$

CALL q1(@C,10001);
SELECT @C


DECLARE
	cursor Emp_Cursor is
    select * from employees;

begin
    for emprec in Emp_Cursor
    loop
         if  emprec.salary > (Select MAX_SALARY from jobs where JOB_ID LIKE "IT_PROG") and emprec.salary < (Select MAX_SALARY into FI_MGR from jobs where JOB_ID LIKE "FI_MGR") then
              DBMS_OUTPUT.PUT_LINE(emprec);
         end if;
    end loop;
end;

DECLARE cur1 CURSOR FOR SELECT salary FROM employees;
OPEN cur1;

Select * from employees;

DROP procedure q2;

Delimiter //;
DECLARE @sal int;
DELIMITER $$
CREATE PROCEDURE q2()
BEGIN
DECLARE
	Emp_Cursor cursor for select salary from employees;
	-- FETCH NEXT FROM Emp_Cursor INTO sal;

END$$
DELIMITER ;
