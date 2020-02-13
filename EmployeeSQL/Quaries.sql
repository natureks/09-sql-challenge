-- 0.  Generic Quaries
select * from Employees;
select * from Departments;
select * from Salaries;
select * from Titles;
select * from Dept_Employee;
select * from Dept_Manager;



-- 1. List the following details of each employee: 
--		employee number, last name, first name, gender, and salary.
select e.Emp_No, e.First_Name, e.Last_Name, e.Gender, s.Salary
from Employees e
left join Salaries s on e.Emp_No = s.Emp_No


-- 2. List employees who were hired in 1986.
select * from employees where hire_date like '1986%'


-- 3. List the manager of each department with the following information: 
--		department number, department name, the manager's employee number, 
--		last name, first name, and start and end employment dates.
select d.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name, de.from_date, de.to_date
from Dept_Manager dm
left join Departments d on dm.dept_no = d.dept_no
left join Employees e on e.Emp_No = dm.Emp_No
left join Dept_Employee de on de.Emp_No = dm.Emp_No

-- 4. List the department of each employee with the following information: 
--		employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from Employees e
left join Dept_Employee de on de.Emp_No = e.Emp_No
left join Departments d on de.dept_no = d.dept_no

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
-- Retuend 22 rows
select e.emp_no, e.last_name, e.first_name, d.dept_name
from Employees e
left join Dept_Employee de on de.Emp_No = e.Emp_No
left join Departments d on de.dept_no = d.dept_no
where e.first_name = 'Hercules' and e.last_name like 'B%'

-- 6. List all employees in the Sales department, 
--		including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from Employees e
left join Dept_Employee de on de.Emp_No = e.Emp_No
left join Departments d on de.dept_no = d.dept_no
where d.dept_name = 'Sales'

-- 7. Option A
---		List all employees in the Sales and Development departments, including their 
--		employee number, last name, first name, and department name.

--	EMPLOYEES IN EITHER DEPARTMENTS ---	137952 rows returned ----
		select e.emp_no, e.last_name, e.first_name, d.dept_name
		from Employees e
		left join Dept_Employee de on de.Emp_No = e.Emp_No
		left join Departments d on de.dept_no = d.dept_no
		where d.dept_name = 'Sales' or d.dept_name = 'Development'
		order by e.last_name, e.first_name

-- 7. Option B
--		List all employees in the Sales and Development departments, including their 
--		employee number, last name, first name, and department name.

--	EMPLOYEES IN BOTH DEPARTMENTS ---	Zero rows returned ---

		select s.emp_no, s.last_name, s.first_name, s.dept_name from
		  (
			select e.emp_no, e.last_name, e.first_name, d.dept_name
			from Employees e
			left join Dept_Employee de on de.Emp_No = e.Emp_No
			left join Departments d on de.dept_no = d.dept_no
			where d.dept_name = 'Sales'
		  ) s
		  join (
			select e.emp_no
			from Employees e
			left join Dept_Employee de on de.Emp_No = e.Emp_No
			left join Departments d on de.dept_no = d.dept_no
			where d.dept_name = 'Development'
		  ) d
		  on s.emp_no = d.emp_no



-- 8. In descending order, list the frequency count of employee last names, 
--		i.e., how many employees share each last name.
--first Baba has 226 entries
select e.last_name, count(*) as last_name_count
from Employees e
group by e.last_name
order by last_name_count DESC
