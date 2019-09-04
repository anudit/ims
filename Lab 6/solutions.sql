
#q1
SELECT E.first_name , E.last_name ,
       E.department_id , D.department_name
        FROM employees E
         JOIN departments D
          ON E.department_id = D.department_id;

#q2
SELECT E.first_name,E.last_name,
   D.department_name, L.city, L.state_province
     FROM employees E
      JOIN departments D
        ON E.department_id = D.department_id
          JOIN locations L
           ON D.location_id = L.location_id;

#q3
SELECT E.first_name, E.last_name, E.salary, J.grade_level
 FROM employees E
   JOIN job_grades J
     ON E.salary BETWEEN J.lowest_sal AND J.highest_sal;

#q4
SELECT E.first_name , E.last_name ,
       E.department_id ,  D.department_name
         FROM employees E
         JOIN departments D
          ON E.department_id = D.department_id
          AND E.department_id IN (80 , 40)
           ORDER BY E.last_name;

#q5
SELECT E.first_name, E.last_name, D.department_id, D.department_name
 FROM employees E
   RIGHT OUTER JOIN departments D
     ON E.department_id = D.department_id;

#q6
SELECT E.first_name, E.last_name, D.department_id, D.department_name
 FROM employees E
   RIGHT OUTER JOIN departments D
     ON E.department_id = D.department_id;

#q7
SELECT E.first_name, E.last_name, E.salary
  FROM employees E
   JOIN employees S
     ON E.salary < S.salary
      AND S.employee_id = 182;

#q8
SELECT E.first_name AS "Employee Name",
   M.first_name AS "Manager"
     FROM employees E
       JOIN employees M
         ON E.manager_id = M.employee_id;

#q9
SELECT D.department_name , L.city , L.state_province
  FROM  departments D
    JOIN locations L
      ON  D.location_id = L.location_id;

#q10
SELECT E.first_name, E.last_name, E.department_id, D.department_name
  FROM employees E
   LEFT OUTER JOIN departments D
     ON E.department_id = D.department_id;

#q11
SELECT E.first_name AS "Employee Name",
   M.first_name AS "Manager"
    FROM employees E
      LEFT OUTER JOIN employees M
       ON E.manager_id = M.employee_id;

#q12
SELECT E.first_name, E.last_name, E.department_id
 FROM employees E
   JOIN employees S
     ON E.department_id = S.department_id
       AND S.last_name = 'Taylor';
