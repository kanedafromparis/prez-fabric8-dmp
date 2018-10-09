#!/bin/bash
#
# This bach is a trick to getaround quote hell
# use it with 
# watch -n 2 bash showtables.sh
#
# Remember
#(optional)
#`minikube start`
#`minikube update-context && \`
#`minikube dashboard && \`
#`eval $(minikube docker-env)`
#(optional) 
#`kubens prez-fabric8-dmp`


kubectl -n prez-fabric8-dmp exec -it \
  $(kubectl -n prez-fabric8-dmp get po -l db -o name | cut -d '/' -f 2) \
  -- sh -c 'exec echo "select * from todo_item;" | mysql -uroot -p"$MYSQL_ROOT_PASSWORD" db_todo';

