-- create a retirement_titles table that holds all the titles of current employees who were born between January 1, 1952 and December 31, 1955

SELECT emp.emp_no, emp.first_name, emp.last_name,tt.title,tt.from_date,tt.to_date
INTO retirement_titles
FROM employees as emp
INNER JOIN titles as tt on emp.emp_no = tt.emp_no
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;
SELECT*FROM test;
SELECT*FROM test;
SELECT*FROM test;

-- Create a unique_titles table that contains the most recent title of each employee
SELECT DISTINCT ON (emp_no)emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;
SELECT*FROM unique_titles;

--Create a table counting the number of retiring employees by their most recent job title 
SELECT COUNT (emp_no), ut.title 
INTO retiring_titles 
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;
SELECT*FROM retiring_titles;

--Create a mentorship_eligibilty table including all the employees elegibile to the Mentorship elegibility program
SELECT DISTINCT ON (emp.emp_no)emp.emp_no,emp.first_name, emp.last_name, emp.birth_date, dep.from_date, dep.to_date, tit.title
INTO mentorship_eligibilty
FROM employees as emp
INNER JOIN department_employee as dep on emp.emp_no = dep.emp_no
INNER JOIN titles as tit on emp.emp_no = tit.emp_no
WHERE (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31' AND dep.to_date = '9999-01-01')
ORDER BY emp_no ASC;
SELECT*FROM mentorship_eligibilty;


