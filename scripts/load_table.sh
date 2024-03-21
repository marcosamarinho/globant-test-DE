# 1- Creates database if not exists 
# 2- Create tables from flat files using native LOAD  
# 3- Load tables using NATIVE clp 
# other languages can be used so native load
# is a simple and optimized way to work along flat files and databases 
cd  $(dirname $0)
#echo $0 $*
. ./lib.sh
load_table $*
if [ "$?" != '0' ]; then
   exit 100  
fi
