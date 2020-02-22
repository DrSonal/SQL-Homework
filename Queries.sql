--1.List the following details of each employee: employee number, last name, first name, gender, and salary.
Select e.emp_no, e.first_name, e.last_name, e.gender, s.salary
  from employees as e
  join salaries as s
  on (e.emp_no = s.emp_no);

--2.List employees who were hired in 1986.
select emp_no, first_name, last_name, hire_date
from employees
where hire_date >= '1986-01-01' 
and hire_date<= '1987-01-01';

--3.List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name, and start and end employment dates.

select Departments.dept_no, Departments.dept_name, Dept_manager.emp_no, 
employees.first_name, employees.last_name, Dept_manager.from_date, Dept_manager.to_date
from Departments
right join Dept_manager
on (Departments.dept_no = Dept_manager.dept_no)
join employees
on (Dept_manager.emp_no = employees.emp_no);

--4.List the department of each employee with the following information: employee number, last name, 
--first name, and department name.
select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
from employees
join dept_emp
on (dept_emp.emp_no = employees.emp_no)
join departments
on (dept_emp.dept_no = departments.dept_no);

--5.List all employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name
from employees
where first_name = 'Hercules'
and last_name like 'B%';

--6.List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.
select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
from employees
join dept_emp
on (employees.emp_no = dept_emp.emp_no)
join departments
on (dept_emp.dept_no = departments.dept_no)
where departments.dept_name = 'Sales';


--7.List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
from employees
join dept_emp
on (employees.emp_no = dept_emp.emp_no)
join departments
on (departments.dept_no = dept_emp.dept_no)
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';


--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name,
count(last_name) as "frequency"
from employees
group by last_name
order by
count(last_name) desc;



