--(1)list the details of each employee
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;

--(2)list the info of employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-31' and hire_date <= '1986-12-31';

--(3)list the manager info from each department
SELECT
	dept_manager.dep_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name
From dept_manager
INNER JOIN departments
ON dept_manager.dep_no = departments.dept_no
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--(4)list the department of each employee
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM dept_emp
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no

--(5)list the employees whose first name is Hercules and last name starts with a B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

--(6)list the employee info of those in sales
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM dept_emp
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales';

--(7)list the employee info of those in sales and development
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM dept_emp
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' or dept_name = 'Development';

--(8) descending order count of employee last names
Select
	last_name,
	COUNT(last_name) as "last_name_count"
FROM employees
GROUP BY last_name
ORDER BY "last_name_count" DESC;