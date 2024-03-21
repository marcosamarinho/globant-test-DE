# globant-test-DE
Data Engeneer Test 

Directories  

- # data 
   Contains CSV files and pdf instructions  	
- # mariadb 
   Docker-compose database nstall 
- # python-flask 
   web environment to upload file and database load 
- # scripts 
   sql scripts and shell scripts 

Note : Used database native client to allow use LOAD command to read CSV 
Native load was chosen to allow fast load for small and big files even using database constraints . 

# Steps to install mariadb (docker-compose) port 3306 
cd mariadb<br>
linux-install-mysql-client.sh<br>

# start mariadb in bg 
run.sh & <br>
cd .. <br>
# start development web server  
cd python-flask <br>
./install.sh <br>
flaskctl start <br>
cd .. <br>
# create database tables 
cd scripts <br>
./create_tables.sh <br>

# load tables using scripts 
./load_table ../data db departments<br>
./load_table ../data db jobs<br>
./load_table ../data db hired_employees<br>

# or using  web browser ( by now ) 

http://localhost:5000<br>
upload the CSV files<br>


run_queriess.sh<br>

run query 1

+-------------+-----------+---------+---------+---------+---------+<br>
| department  | job       | sum(q1) | sum(q2) | sum(q3) | sum(q4) |<br>
+-------------+-----------+---------+---------+---------+---------+<br>
| Staff       | Recruiter |       3 |       0 |       7 |      11 |<br>
| Staff       | Manager   |       2 |       1 |       0 |       2 |<br>
| Suppy Chain | Manager   |       0 |       1 |       3 |       0 |<br>
+-------------+-----------+---------+---------+---------+---------+<br>
run query 2<br>
+---------------+------------+-------+---------+<br>
| department_id | department | hired | mean    |<br>
+---------------+------------+-------+---------+<br>
|             7 | Staff      |    26 | 15.0000 |<br>
+---------------+------------+-------+---------+<br>




