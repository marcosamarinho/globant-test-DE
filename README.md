# globant-test-DE
Data Engeneer Test <br>
This project creates tables and them call API to load data into database (mariadb) <br>
using native database LOAD command usin client  , to read CSV and load at the database <br>
chosen to allow fast load , proved on small and big files even using database constraints for more information take a look at https://medium.com/@benmorel/high-speed-inserts-with-mysql-9d3dcd76f723 .<br>
python FastAPI and uvicorn frameworks to allow create web server to dispose API , document and run requests<br>
API allows upload file using chunks for not put all file in memory and them call script to load ar the remote database . 

Project Directories  

- ## data 
   Contains CSV files and pdf instructions <br>
   Note . link on pdf not works then I created  CSVs at hand following examples in pdf .  
- ## mariadb 
   Docker-compose database install 
- ## FastAPI
   python framework to allow create API  
- ## scripts 
   sql scripts and shell scripts

# Clone project on linux apt environment and follow the steps below 
# install mariadb first command bellow can be used on local docker environment (docker-compose) port 3306 
```bash
cd mariadb
# install client 
linux-install-mysql-client.sh
# Start mariadb in bg docker-compose run 
run.sh &
cd ..
```

# Change the script to point to the database installed 
edit scripts/lib.sh and change Host=(database address>)<br>
TODO change it to use secret or create ip address database security 
# Create database tables using DDL.sql
```bash
cd scripts 
./create_tables.sh
```
# Load tables using scripts ( optional )(same one will be called by API) 
```bash
./load_table.sh ../data db departments
./load_table.sh ../data db jobs
./load_table.sh ../data db hired_employees
```
# Start FastAPI on local environment (developmrent)( or use the docker below ) 
```bash
cd FastAPI
# install python requirement.txt 
./install_requirements.sh
cd app
uvicornctl start
```
# create docker image with FastAPI, uvicorn and mysql client
```bash
./build_image_myFastAPI.sh
```
# run docker image 
```bash
./image_run.sh
```


# Use web browser GUI FastAPI /docs
Note : port 9000 for development and 80 on docker  
http://localhost:9000/docs<br>
or 
http://localhost/docs<br>
upload the CSV files<br>
![screenshot](upload_FastAPI.png)
# Run queries 
```bash
run_queries.sh
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



