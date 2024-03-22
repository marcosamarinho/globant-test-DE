# globant-test-DE
Data Engeneer Test <br>
using native database load to read CSV and load at the database <br>
chosen to allow fast load for small and big files even using database constraints .<br>
python FastAPI framework to allow document and run requests 
 

Project Directories  

- ## data 
   Contains CSV files and pdf instructions <br>
   Note . link on pdf not works then I created at CSV hand at hand 
- ## mariadb 
   Docker-compose database nstall 
- ## FastAPI
   python framework to allow create API  
- ## scripts 
   sql scripts and shell scripts
- ## python-flask  ( NOT IN USE ) 
   web environment to upload file and database load  



# Steps to install mariadb (docker-compose) port 3306 
```bash
cd mariadb
linux-install-mysql-client.sh
```

# Start mariadb in bg
```bash
run.sh &
cd ..
```
# Start development web server  
```bash
cd python-flask 
./install.sh 
flaskctl start 
cd ..
```
# Create database tables
```bash
cd scripts 
./create_tables.sh
```
# Load tables using scripts 
```bash
./load_table ../data db departments
./load_table ../data db jobs
./load_table ../data db hired_employees
```

# Load table using API using curl 
```bash
curl -X 'POST' \<br>
  'http://localhost:9000/upload' \
  -H 'accept: application/json' \
  -H 'Content-Type: multipart/form-data' \
  -F 'file=@jobs.csv;type=text/csv'
```
# OR Using  web browser FastAPI /docs
upload the CSV files<br>
http://localhost:9000/docs<br>
![screenshot](upload_FastAPI.png)
# Run queries 
```bash
run_queriess.sh
```
# output
```bash

run query 1
+-------------+-----------+---------+---------+---------+---------+
| department  | job       | sum(q1) | sum(q2) | sum(q3) | sum(q4) |
+-------------+-----------+---------+---------+---------+---------+
| Staff       | Recruiter |       3 |       0 |       7 |      11 |
| Staff       | Manager   |       2 |       1 |       0 |       2 |
| Suppy Chain | Manager   |       0 |       1 |       3 |       0 |
+-------------+-----------+---------+---------+---------+---------+

run query 2
+---------------+------------+-------+---------+
| department_id | department | hired | mean    |
+---------------+------------+-------+---------+
|             7 | Staff      |    26 | 15.0000 |
+---------------+------------+-------+---------+
```



