with emp_2021 as  
   (select he.department_id , name, 
   j.job,
   d.department
   from hired_employees he
   inner join jobs j ON  he.job_id = j.id
   inner join departments d ON  he.department_id = d.id
   where year(datetime)=2021
   )
, sum_employees_2021 as
   ( 
   select  sum(1) tot
   from hired_employees he
   where year(datetime)=2021
   group by department_id 
   )
, mean_dep_2021 as
   (select avg(tot) mean 
   from sum_employees_2021
   )
   select 
   department_id,
   department,
   sum(1) hired, 
   mean
   from emp_2021,mean_dep_2021 
   group by department_id
   having sum(1) >mean
   order by sum(1) desc 
; 
