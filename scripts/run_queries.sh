# run queries 
 
. $(dirname $0)/lib.sh

  #-------#
 # Start #
#-------# 

echo run query 1 
$clp $DB< query_1.sql 

echo run query 2 
$clp $DB< query_2.sql
 
