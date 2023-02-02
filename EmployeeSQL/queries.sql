-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON
s.emp_no=e.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date LIKE '1986%';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM department_manager as dm
INNER JOIN departments as d ON
dm.dept_no = d.dept_no
INNER JOIN employees as e ON
dm.emp_no = e.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT ed.dept_no, ed.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee_department as ed
INNER JOIN employees as e ON
ed.emp_no = e.emp_no
INNER JOIN departments as d ON
ed.dept_no = d.dept_no;

-- List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM employees as e
INNER JOIN employee_department as ed ON
e.emp_no = ed.emp_no
WHERE ed.dept_no LIKE 'd007';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN employee_department as ed ON
e.emp_no = ed.emp_no
INNER JOIN departments as d ON
ed.dept_no = d.dept_no
WHERE ed.dept_no LIKE 'd007' OR ed.dept_no LIKE 'd005';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*)
FROM employees 
GROUP BY last_name
ORDER BY COUNT DESC;