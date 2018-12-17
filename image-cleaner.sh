set +e
df -h
docker rmi $(docker images --format '{{.Repository}}:{{.Tag}}' |grep 'yny-places-dev') --force
docker rmi $(docker images --format '{{.Repository}}:{{.Tag}}' |grep 'yny-places-prod') --force
docker rmi $(docker images --format '{{.Repository}}:{{.Tag}}' |grep 'yny-backoffice-dev') --force
docker rmi $(docker images --format '{{.Repository}}:{{.Tag}}' |grep 'yny-backoffice-prod') --force
docker rmi $(docker images --format '{{.Repository}}:{{.Tag}}' |grep 'yny-image-filter-dev') --force
docker rmi $(docker images --format '{{.Repository}}:{{.Tag}}' |grep 'yny-image-filter-prod') --force
df -h
