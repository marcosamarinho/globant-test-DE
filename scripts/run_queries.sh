# run queries 
 
. $(dirname $0)/lib.sh
echo $DB

  #-------#
 # Start #
#-------# 
$clp --table $DB <<EOF
show tables; 
select count(*) from jobs; 
select count(*) from departments; 
select count(*) from hired_employees; 
EOF

echo run query 1 
$clp --table $DB< query_1.sql 

echo run query 2 
$clp --table $DB< query_2.sql
 
#$clp --table $DB <<EOF
#show tables; 
#-- select count(*) from jobs; 
#-- select count(*) from departments; 
#select * from hired_employees
# where year(datetime)=2021; 
#EOF
