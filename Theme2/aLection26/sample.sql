SELECT d.name, count(e.*)
from employees e
JOIN departments d on e.department_id = d.id
group by d.name


select department_id, count(*) 
from employees
group by department_id

select d.name as "department", count(e.*) as "Employees"
from employees e
join departments d on e.department_id = d.id
group by d.name