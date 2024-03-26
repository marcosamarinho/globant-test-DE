# 1- Creates database if not exists 
# 2- Create tables from flat files using native LOAD  
# 3- Load tables using NATIVE clp 
# other languages can be used so I choose use native load 
# is a simple and optimized way to work along flat files and databases 

# mysql address change it  
#Host=0.0.0.0
Host=192.168.2.20
User=root

#TODO implement secret or Ip trusted on db 
Pwd=password

DB=db
Base_Path="$(pwd)/data"
clp="mysql -u $User -p$Pwd -h $Host"

###############################
function load_table {
echo $0 $*>>/tmp/load_table
DIR="$1"
DB="$2"
table="$3"
$clp --local-infile $DB <<EOF
LOAD DATA LOCAL INFILE '$DIR/$table.csv' 
INTO TABLE $table 
COLUMNS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
-- select count(1) from $table; 
-- select * from $table; 
EOF
return=$?
if [ "$return" != '0' ];then
   echo Error $return >>/tmp/load_table
   exit $return 
fi 
}
