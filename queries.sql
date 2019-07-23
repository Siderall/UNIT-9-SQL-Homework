-------------------------------------------------------------------
-------------------------------------------------------------------
-- DATA ANALYSIS 1.) List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
FROM employees AS e
RIGHT JOIN salaries AS s
ON (s.emp_no = e.emp_no);
-- SUMMARY: 300024 employees
-------------------------------------------------------------------
-------------------------------------------------------------------
-- DATA ANALYSIS 2.) List employees who were hired in 1986.
SELECT
	emp_no,
	birth_date,
	first_name,
	last_name,
	gender,
	hire_date
from employees
WHERE EXTRACT (YEAR FROM hire_date) = 1986
-- SUMMARY: 36150 employees hired in 1986, in total.
-------------------------------------------------------------------
-------------------------------------------------------------------
-- DATA ANALYSIS 3.) List the manager of each department with the 
-- following information: department number, department name, the 
-- manager's employee number, last name, first name, and start and 
-- end employment dates.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM departments AS d
RIGHT JOIN dept_manager AS dm
ON (d.dept_no = dm.dept_no)
JOIN employees AS e
ON (dm.emp_no = e.emp_no)
-- SUMMARY: 24 total Department Managers, now with robust data.
-------------------------------------------------------------------
-------------------------------------------------------------------
-- DATA ANALYSIS 4.) List the department of each employee with the 
-- following information: employee number, last name, first name, 
-- and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
JOIN departments AS d
ON (de.dept_no = d.dept_no);
-- SUMMARY: 331603 employees now with department info.
-------------------------------------------------------------------
-------------------------------------------------------------------
-- DATA ANALYSIS 5.) List all employees whose first name is 
-- "Hercules" and last names begin with "B."
SELECT *
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
-- SUMMARY: There are 20 employees with first name Hercules and 
-- last initial "B" that have worked for Pewlett Hackard.
-------------------------------------------------------------------
-------------------------------------------------------------------
-- DATA ANALYSIS 6.) List all employees in the Sales department, 
-- including their employee number, last name, first name, and 
-- department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales';
-- SUMMARY: There are 52245 employees that have worked in the sales
-- department.
-------------------------------------------------------------------
-------------------------------------------------------------------
-- DATA ANALYSIS 7.) List all employees in the Sales and 
-- Development departments, including their employee number, last 
-- name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';
-- SUMMARY: There are 52245 employees that have worked in the Sales
-- and Development departments.
-------------------------------------------------------------------
-------------------------------------------------------------------
-- DATA ANALYSIS 8.) In descending order, list the frequency count 
-- of employee last names, i.e., how many employees share each last 
-- name.
SELECT COUNT(last_name) AS "Count", last_name AS "Last Name"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
-- SUMMARY: There are 1638 total last names of employees, with the
-- last name of "Baba" being the most numerous (226).