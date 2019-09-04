# q1
SELECT *
	FROM employees
		WHERE employee_id NOT IN
       (SELECT employee_id
		FROM job_history);

#q2
SELECT first_name, last_name, salary, department_id
FROM employees
WHERE salary IN
( SELECT MIN(salary)
FROM employees
GROUP BY department_id
);

#q3
SELECT *
	FROM departments
	WHERE manager_id IN
	(SELECT employee_id
		FROM employees
			WHERE first_name='Susan');

#q4
SELECT *
FROM employees m
WHERE  2 = (SELECT COUNT(DISTINCT salary )
            FROM employees
            WHERE  salary <= m.salary);


#q5
SELECT *
	FROM jobs
		WHERE job_id IN
		(SELECT job_id
			FROM employees
				WHERE employee_id IN
        (SELECT employee_id
			FROM job_history
				WHERE job_id='SA_REP'));

#q6
SELECT first_name || ' ' || last_name AS Manager_name,department_id
	FROM employees
		WHERE employee_id IN
		(SELECT manager_id
		FROM employees
			GROUP BY manager_id
			HAVING COUNT(*)>=4);

#q7
SELECT * FROM departments
	WHERE department_id IN
		( SELECT department_id
                   FROM employees
			GROUP BY department_id
				HAVING MIN(salary)>=8000);

#q8
SELECT *
FROM departments
WHERE DEPARTMENT_ID IN
    (SELECT DEPARTMENT_ID
     FROM employees
     WHERE EMPLOYEE_ID IN
         (SELECT EMPLOYEE_ID
          FROM job_history
          GROUP BY EMPLOYEE_ID
          HAVING COUNT(EMPLOYEE_ID) > 1)
     GROUP BY DEPARTMENT_ID
     HAVING MAX(SALARY) > 7000);

#q9
SELECT city
	FROM locations
		WHERE location_id =
    (SELECT location_id
		FROM departments
			WHERE department_id =
             	(SELECT department_id
					FROM employees
						WHERE employee_id=134));

#q10
SELECT first_name, last_name, salary, department_id
  FROM employees
    WHERE department_id IN
          (SELECT department_id
            FROM departments
             WHERE location_id =
               (SELECT location_id
                 FROM locations
                   WHERE city = 'London'));

#q11
SELECT first_name, last_name, salary, department_id
 FROM employees
   WHERE salary <
      (SELECT AVG(salary)
        FROM employees )
         AND department_id =
               (SELECT department_id
                 FROM employees
                  WHERE first_name = 'Laura');

#q12
SELECT first_name, last_name, salary, department_id
 FROM employees
  WHERE salary < ALL
     (SELECT salary
       FROM employees
         WHERE department_id = 70);

#q13
SELECT first_name ||' '|| last_name AS Full_Name , hire_date
 FROM employees
  WHERE hire_date > (
                     SELECT hire_date
                       FROM employees
                        WHERE employee_id = 165);

#q14
SELECT first_name, last_name, salary, department_id
 FROM employees
  WHERE salary > ALL
                  (SELECT salary
                    FROM employees
                     WHERE department_id = 40);

#q15
SELECT first_name, last_name, department_id
 FROM employees
   WHERE department_id =
       (SELECT department_id
          FROM departments
           WHERE department_name = 'Marketing');

#q16
SELECT first_name, last_name, salary, department_id
 FROM employees
  WHERE salary > ANY
    (SELECT salary
       FROM employees
          WHERE department_id = 40);

#q17
SELECT first_name, last_name, salary, department_id
 FROM employees
  WHERE department_id =
     (SELECT department_id
       FROM employees
        WHERE employee_id = 201);

#q18
SELECT department_name, department_id
  FROM departments
   WHERE location_id =
        (
          SELECT location_id
            FROM  departments
             WHERE department_id = 30);

#q19
SELECT first_name, last_name, salary, department_id
 FROM employees
  WHERE salary > ALL
                  (SELECT salary
                    FROM employees
                     WHERE department_id = 40);

#q20
SELECT first_name, last_name , salary, department_id
  FROM employees
    WHERE salary > (
                SELECT AVG(salary)
                   FROM employees )
    ORDER BY salary DESC;

#q21
SELECT department_id, department_name
  FROM departments
    WHERE location_id =
            (
              SELECT location_id
                FROM locations
                  WHERE city = 'London'
            );

#q22
SELECT a.employee_id, a.first_name, a.last_name, a.salary, b.department_name, c.city
FROM employees a, departments b, locations c
WHERE a.salary =
(SELECT MAX(salary)
FROM employees
WHERE hire_date BETWEEN '01/01/2002' AND '12/31/2003')
AND a.department_id=b.department_id
AND b.location_id=c.location_id;

#q23
SELECT *
FROM employees
WHERE employee_id=ANY
( SELECT manager_id FROM departments );
