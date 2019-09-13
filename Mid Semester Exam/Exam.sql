# SET2

#q1
SELECT * FROM employees WHERE salary IN (
	SELECT MAX(salary) AS salary
	FROM employees
	WHERE salary < (
		SELECT MAX(salary)
        FROM employees
	)
);

#q2
SELECT employees.EMPLOYEE_ID, CONCAT(employees.FIRST_NAME , " " ,  employees.LAST_NAME) AS 'Name', jobs.JOB_TITLE FROM employees, jobs
WHERE salary >
ANY(
	SELECT avg(salary)
    FROM employees
    GROUP BY department_id
) AND employees.JOB_ID = jobs.JOB_ID;

#q3
SELECT employees.first_name, employees.LAST_NAME, departments.DEPARTMENT_NAME, locations.CITY, locations.STATE_PROVINCE
FROM employees, departments, locations
WHERE employees.first_name LIKE '%j%'
AND employees.DEPARTMENT_ID = departments.DEPARTMENT_ID
AND departments.LOCATION_ID = locations.LOCATION_ID
ORDER BY employees.first_name ;

#q4
SELECT CONCAT(employees.FIRST_NAME , " " ,  employees.LAST_NAME) AS 'Name', HIRE_DATE, EMAIL, DEPARTMENT_ID
FROM employees
WHERE DEPARTMENT_ID IN (30, 80)
ORDER BY DEPARTMENT_ID DESC;

#q5
SELECT departments.DEPARTMENT_NAME, CONCAT(employees.FIRST_NAME , " " ,  employees.LAST_NAME) AS 'Name', HIRE_DATE, Salary
FROM employees, departments
where employees.EMPLOYEE_ID IN (
	SELECT EMPLOYEE_ID
	FROM job_history
	WHERE (DATEDIFF(now(), Start_date)/365) > 10
)
AND employees.DEPARTMENT_ID = departments.DEPARTMENT_ID;
