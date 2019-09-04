# q1


#q2
UPDATE employees SET SALARY = 8000 WHERE employee_id = 105 AND salary < 5000;


#q3
UPDATE employees SET JOB_ID= 'SH_CLERK'
WHERE employee_id=118
AND department_id=30
AND NOT JOB_ID LIKE 'SH%';

#q4
UPDATE employees SET salary= CASE department_id
                          WHEN 40 THEN salary+(salary*.25)
                          WHEN 90 THEN salary+(salary*.15)
                          WHEN 110 THEN salary+(salary*.10)
                          ELSE salary
                        END
             WHERE department_id IN (40,50,50,60,70,80,90,110);

#q5
SELECT first_name "First Name",  last_name "Last Name"
	FROM employees;

#q6
SELECT DISTINCT department_id
	FROM employees;

#q7
SELECT *
	FROM employees
	ORDER BY first_name DESC;

#q8
SELECT first_name, last_name, salary, salary*.15 PF
	FROM employees;

#q9
SELECT employee_id, first_name, last_name, salary
    FROM employees
    ORDER BY salary;

#q10
SELECT SUM(salary)
     FROM employees;

#q11
SELECT MAX(salary), MIN(salary)
     FROM employees;

#q12
SELECT AVG(salary), COUNT(*)
     FROM employees;

#q13
SELECT COUNT(*)
    FROM employees;

#q14
SELECT COUNT(DISTINCT job_id)
    FROM employees;

#q15
SELECT UPPER(first_name)
FROM employees;

#q16
SELECT SUBSTRING(first_name,1,3)
     FROM employees;

#q17
SELECT 171*214+625 Result;

#q18
SELECT  CONCAT(first_name,' ', last_name) 'Employee Name'
     FROM employees;

#q19
SELECT TRIM(first_name)
    FROM employees;

#q20
SELECT first_name,last_name, LENGTH(first_name)+LENGTH(last_name)  'Length of  Names'
    FROM employees;

#q21
SELECT *
   FROM employees
   WHERE  first_name REGEXP  '[0-9]';

#q22
SELECT employee_id, first_name
    FROM employees  LIMIT 10;

#q23
SELECT first_name, last_name, round(salary/12,2) as 'Monthly Salary'
   FROM employees;

#q24
SELECT first_name, last_name, salary
FROM employees
WHERE salary NOT BETWEEN 10000 AND 15000;

#q25
SELECT first_name, last_name, department_id
FROM employees
WHERE department_id IN (30, 100)
ORDER BY  department_id  ASC;

#q26
SELECT first_name
FROM employees
WHERE first_name LIKE '%b%'
AND first_name LIKE '%c%';

#q27
SELECT *
FROM employees
WHERE last_name IN('JONES', 'BLAKE', 'SCOTT', 'KING', 'FORD');

#q28
SELECT location_id, street_address, city, state_province, country_name,department_name
FROM locations
NATURAL JOIN countries
NATURAL JOIN departments;

#q29
SELECT first_name, last_name, department_id, department_name
FROM employees
JOIN departments USING (department_id);

#q30
SELECT first_name, last_name, hire_date, salary,
(DATEDIFF(now(), hire_date))/365 Experience
FROM departments d JOIN employees e
ON (d.manager_id = e.employee_id)
WHERE (DATEDIFF(now(), hire_date))/365>15;

#q31
SELECT job_title, first_name, salary-min_salary 'Salary - Min_Salary'
FROM employees
NATURAL JOIN jobs;

#q32
SELECT job_title, AVG(salary)
FROM employees
NATURAL JOIN jobs
GROUP BY job_title;
