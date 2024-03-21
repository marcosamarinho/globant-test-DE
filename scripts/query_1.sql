with quarter_emp_2021 as  
   (select 
   j.job,
   d.department,
   case when quarter(datetime)=1 then 1 else 0 end as Q1,
   case when quarter(datetime)=2 then 1 else 0 end as Q2,
   case when quarter(datetime)=3 then 1 else 0 end as Q3,
   case when quarter(datetime)=4 then 1 else 0 end as Q4
   from hired_employees he
   inner join jobs j ON  he.job_id = j.id
   inner join departments d ON  he.department_id = d.id
   where year(datetime)=2021
   )
select 
department, 
job, 
sum(q1),
sum(q2),
sum(q3),
sum(q4)
from quarter_emp_2021 
group by department,job 
order by department, job desc;
