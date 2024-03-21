# 1- Creates database if not exists 
# 2- Create tables

 
. $(dirname $0)/lib.sh

  #-------#
 # Start #
#-------# 

echo "# create database $DB if not exists "
 echo $clp 
$clP <<EOF
create database $DB;
EOF
return=$?
if [ "$return" != '0' ];then
   echo Error $return 
   exit $return 
fi 

# create all tables 
$clp $DB < ddl.sql 
return=$?
if [ "$return" != '0' ];then
   echo Error $return 
   exit $return 
fi 

 
