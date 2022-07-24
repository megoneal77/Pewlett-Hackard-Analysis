select
	e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
into retirement_titles
from employees as e
	inner join titles as ti
		on (e.emp_no = ti.emp_no)
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;

select * from retirement_titles;

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

select * from retirement_titles;

--
select count(title),
	title
	
into retiring_title_count
from retirement_titles
group by title
order by count(title) desc;
	
select * from retiring_title_count;


select distinct on (emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
	
into mentorship_eligibility 
from employees as e
	join dept_emp as de
		on (e.emp_no) = de.emp_no
	join titles as ti
		on (e.emp_no = ti.emp_no)
where (de.to_date = '9999-01-01')
and (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
order by e.emp_no;

select * from mentorship_eligibility;


select distinct on (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title

into mentorship_eligibility_alt1
from employees as e
	join dept_emp as de
		on (e.emp_no = de.emp_no)
	join titles as ti
		on (e.emp_no = ti.emp_no)
where (de.to_date = '9999-01-01')
and (ti.title = 'Technique Leader')
order by e.emp_no;

select * from mentorship_eligibility_alt1;



select distinct on (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title

into mentorship_eligibility_alt2
from employees as e
	join dept_emp as de
		on (e.emp_no = de.emp_no)
	join titles as ti
		on (e.emp_no = ti.emp_no)
where (de.to_date = '9999-01-01')
and (e.birth_date BETWEEN '1956-01-01' AND '1965-12-31')
and (ti.title = 'Senior Engineer' or ti.title = 'Senior Staff')
order by e.emp_no;

select * from mentorship_eligibility_alt2;
