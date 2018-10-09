# 8 - Build the specific application image and push it into kubernetes with a configmap configuration and a mariadb database
## Reminder

This application is created in order to introduce [https://dmp.fabric8.io/](fabric8io/docker-maven-plugin)

At this step we want to add a database via docker


## Sample To Do List web application using Spring Boot (and Mariadb)

### This is a simple Todo list application using Spring Boot (Spring JPA, Thymeleaf template, mariadb storage)

1. instantiate a local mariadb

  1.1. (optional) 
  `minikube start`

  1.2. (optional) 
  `minikube update-context && \`
  `minikube dashboard && \`
  `eval $(minikube docker-env)`

2. Udpate and project files

  2.1. create 
    - [src/main/fabric8/application-configmap.yaml](src/main/fabric8/application-configmap.yaml)
    - [src/main/fabric8/prez-fabric8-dmp-deployment.yml](src/main/fabric8/prez-fabric8-dmp-deployment.yml)
    - [src/main/fabric8/prez-fabric8-dmp-service.yaml](src/main/fabric8/prez-fabric8-dmp-service.yaml)
    - [src/main/fabric8/mariadb-deployment.yml](src/main/fabric8/mariadb-deployment.yml)
    - [src/main/fabric8/mariadb-service.yml](src/main/fabric8/mariadb-service.yml)
  In order to define kubernetes ressources manifest

3. build and run our project image using

  3.1. `mvn clean package`
  
  3.2. `mvn fabric8:build fabric8:resource fabric8:deploy`
  
  3.3. (optional) `kubens prez-fabric8-dmp`
  
4. Check project 

   4.1 map a pod port to local host
   `kubectl port-forward $(kubectl -n prez-fabric8-dmp get po -l db!=mariadb -o name | tail -n 1) 8080:8080`

   4.2. Open a web browser to [http://127.0.0.1:8080](http://127.0.0.1:8080)

   4.3. check your database mouvement with
   `watch -n 2 bash showtables.sh`

   4.4 kill the pod and map another pod port to local host
   kubectl delete $(kubectl -n prez-fabric8-dmp get po -l db!=mariadb -o name | tail -n 1) --grace-period=0
   `kubectl port-forward $(kubectl get po -l app=prez-fabric8-dmp -o name) 8080:8080`
   
   
## Next Step

Question and Response