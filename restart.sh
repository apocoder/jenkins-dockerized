docker stop jenkins-master
docker rm jenkins-master
docker rmi $(docker images -a -q)
docker build -t myjenkins .
docker run -p 8080:8080 -p 50000:50000 --name=jenkins-master --mount source=jenkins-log,target=/var/log/jenkins --mount source=jenkins-data,target=/var/jenkins_home -d myjenkins
