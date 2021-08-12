#!/bin/bash


spinner()
{
    local pid=$!
    local delay=0.05
    local spinstr='|/-\'
    printf "\n"
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b\n"
}

printf "Welcome, prepairing for setup ...\n"

sleep 2 & 
spinner 
wait


FILE=./Dockerfile
if test -f "$FILE"; then
    echo "$FILE exists. Setting it for building..."
else 
    echo "$FILE does not exist. Exiting..."
    exit 1
fi

sleep 1&
spinner
wait

docker build --tag geth2 .

printf "\nStarting the container ...\n"

OUTPUT=$(docker run --rm -i -t -v ~/geth2logs:/var/log/geth -p 30303:30303 -d geth2)

sleep 2 &
spinner
wait
printf "\n Waiting if it fails or not..\n"


sleep 3 &

spinner

wait

docker kill $OUTPUT
printf "\n"
echo "Killed $OUTPUT"
printf "\n\n"

sleep 1
printf "\nStarting minikube for Kubernetes"


minikube start 

OUTPUT=$(kubectl create deployment geth-app --image=jozzy008/geth2:v0.0.1)

SUCCESS_TEST="deployment.apps/geth-app created"

if [ "$OUTPUT" == "$SUCCESS_TEST" ];then
    echo "success! Deleting it.."
    kubectl delete deployment geth-app
else
    echo "deployment failed. Exiting..."
    kubectl delete deployment geth-app
    exit 1
fi

sleep 1


echo "All set up and completed with success. Exiting..."

exit 0





