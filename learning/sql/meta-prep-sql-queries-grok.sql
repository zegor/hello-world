select *
from orders;

select *
from salesperson;

select *,
	round(avg(salary) over(partition by department)) as "avg dep salary"
from salesperson
order by "avg dep salary", id;

select *,
	round(sum(salary) over(partition by department order by id range between unbounded preceding and current row)) as "avg dep salary"
from salesperson;

-- Q1
select o.number, o.order_date, o.amount, s.name
from orders o
inner join salesperson s
	on o.salesperson_id = s.id
order by o.number;

-- Q2
select s.id, s.name, o.number, o.amount
from salesperson s
left outer join orders o
	on s.id = o.salesperson_id
order by s.id asc;

-- Q3
select s.id, s.name, o.number, o.amount
from salesperson s
right outer join orders o
	on s.id = o.salesperson_id
order by o.number;

-- Q4
select s.id, s.name, o.number, o.amount
from salesperson s
full outer join orders o
	on s.id = o.salesperson_id
order by o.number, s.id;

-- Q5
select s.name, o.number
from salesperson s
cross join orders o
order by s.name, o.number;

-- Q6a
select age
from salesperson
where age < 40
union
select age
from salesperson
where age > 30;

-- Q6b
select age
from salesperson
where age < 40
union all
select age
from salesperson
where age > 30;

-- Q7
select s.name, s.salary, s.department
from salesperson s
where s.salary > (
	select avg(salary)
	from salesperson
	where salesperson.department = s.department
);

-- Q8
select s.department, sum(o.amount) as total_order_amount, avg(o.amount) as average_order_amount, max(o.amount) as max_order_amount, count(o.*) as count_orders
from orders o
inner join salesperson s
	on o.salesperson_id = s.id
group by s.department
order by s.department;

-- Q9
select s.department, sum(o.amount) as total_order_amount
from orders o
inner join salesperson s
	on o.salesperson_id = s.id
where o.amount > 500
group by s.department
having sum(o.amount) > 2000
order by s.department;

-- Q10
select id, name, age,
	case
		when age < 35 then 'Junior'
		when age < 45 then 'Mid-level'
		else 'Senior'
	end as experience_level
from salesperson
order by age;

-- Q11
select id, name, department, salary, age
from salesperson
where (department = 'Finance' and salary > 60000)
or (department = 'IT' and age < 50)
order by department, name;

-- Q12
select department, count(*) as num_salespersons, round(avg(age), 2) as avg_age, sum(salary) as total_salary
from salesperson
group by department
order by department;

-- Q13
select name, department, salary,
	row_number() over(partition by department order by salary desc) as row_num,
	rank() over(partition by department order by salary desc) as rank_val,
	dense_rank() over(partition by department order by salary desc) as dense_rank
from salesperson
order by department, salary desc;

-- Q14
select department, count(*) as total_count, count(salary) non_null_salary_count, sum(salary) as total_salary_with_nulls_as_zero, avg(salary) as avg_non_null_salary,
	case
		when count(salary) = 0 then 'No salary data'
		when count(*) = count(salary) then 'All salaries present'
		when count(*) <> count(salary) then 'Has missing salaries'
	end as validation_status
from salesperson
group by department
order by department;