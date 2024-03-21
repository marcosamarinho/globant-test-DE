# globant-test-DE
Data Engeneer Test 

Directories  

# data 
   Contains CSV files and pdf instructions  	
# mariadb 
   Docker-compose database nstall 
# python-flask 
   web environment to upload file and database load 
# scripts 
   sql scripts and shell scripts 

Note : Used database native client to allow use LOAD command to read CSV 
Native load was chosen to allow fast load for small and big files even using database constraints . 

# Steps to install mariadb (docker-compose) port 3306 
. cd mariadb 

. linux-install-mysql-client.sh
# start mariadb in bg 
run.sh & 
cd .. 
# start development web server  
cd python-flask 
./install.sh 
flaskctl start

cd ..
cd scripts 
./create_tables.sh 

./load_table ../data db departments
./load_table ../data db jobs
./load_table ../data db hired_employees


or 

using  web browser by now 

http://localhost:5000
nd upload the CSV files 

jobs
jobs


