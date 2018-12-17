set +e
df -h
docker rmi $(docker images --format '{{.Repository}}:{{.Tag}}' |grep 'image-name') --force
df -h
