-- create all tables at the database 
-- drop table hired_employees ;
-- drop table departments;
-- drop table jobs; 
 
create table departments (
   id integer,
   department varchar (40),
   constraint pk_departments primary key (id)
);

create table jobs (
   id integer,
   job varchar (40),
   constraint pk_job primary key (id)
); 

create table hired_employees ( 
   id integer,
   name varchar (40),
   datetime datetime, 
   department_id integer,
   job_id integer,
   constraint pk_hired_employees primary key (id) 
);
