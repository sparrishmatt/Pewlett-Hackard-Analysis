--Deliverable 1
select 
employees.emp_no, 
employees.first_name, 
employees.last_name,
titles.title,
titles.from_date,
titles.to_date
into retirement_titles
from employees
inner join titles
on (employees.emp_no=titles.emp_no)
where (birth_date between '1952-01-01' and '1955-12-31')
order by emp_no asc;

-- Use Dictinct with Orderby to remove duplicate rows
select distinct on (retirement_titles.emp_no) retirement_titles.emp_no,
retirement_titles.first_name,
retirement_titles.last_name,
retirement_titles.title

into unique_titles
from retirement_titles
where to_date = '9999-01-01'
order by emp_no asc, to_date DESC;
select * from unique_titles

select count(unique_titles.emp_no),
unique_titles.title
into retiring_titles
from unique_titles
group by title 
order by count(title) desc;
select * from retiring_titles

--Mentorship program Deliverable 2
select distinct on (employees.emp_no)employees.emp_no,
employees.first_name,
employees.last_name,
employees.birth_date,
dept_emp.from_date,
dept_emp.to_date,
titles.title
into mentorship_eligibility
from employees
inner join dept_emp
on (employees.emp_no=dept_emp.emp_no)
inner join titles
on (employees.emp_no=titles.emp_no)
where (dept_emp.to_date = '9999-01-01') 
and (employees.birth_date between '1965-01-01' and '1965-12-31')
order by employees.emp_no;

select * from mentorship_eligibility
