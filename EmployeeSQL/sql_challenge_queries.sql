--Employee number, last name, first name, sex, and salary of each employee

SELECT  employees.emp_no,
		employees.last_name,
		employees.first_name,
		employees.sex,
		salaries.salary
FROM employees
LEFT JOIN salaries 
ON employees.emp_no = salaries.emp_no;


--First name, last name, and hire date for the employees who were hired in 1986

SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
AND hire_date <= '1986-12-31';


--Manager of each department along with their department number, department name, employee number, last name, and first name

SELECT dept_manager.dept_no, 
	   departments.dept_name,
	   dept_manager.emp_no,
	   employees.last_name,
	   employees.first_name
FROM dept_manager
LEFT JOIN departments 
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees 
ON dept_manager.emp_no = employees.emp_no;


--Department number for each employee along with that employee’s employee number, last name, first name, and department name

SELECT departments.dept_no,
	   employees.emp_no, 
	   employees.last_name, 
	   employees.first_name,
	   departments.dept_name
FROM employees
INNER JOIN dept_manager 
ON employees.emp_no = dept_manager.emp_no
INNER JOIN Departments 
ON dept_manager.dept_no = departments.dept_no;


--first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT  employees.first_name,
		employees.last_name,
		employees.sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


--Each employee in the Sales department, including their employee number, last name, and first name

SELECT  employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM departments
LEFT JOIN dept_emp 
ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees 
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales';


--Each employee in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT  employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM departments
LEFT JOIN dept_emp 
ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees 
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';


--Frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

SELECT  last_name,
COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC





