# Creating a Kubernetes pod

 - First of all we have to install kubernetes and minikube.
 
 - To do that follow the instructions [from here](https://kubernetes.io/docs/tasks/tools/)
 
 - - Note that if kubectl refuses something try with ```sudo```.
 
 - I assume that you installed all docker, kubectl, kubelet, kubeadm and minikube. And I also assume that you 
 published your docker image to docker hub. So lets move on. 
 
 - There is two way to make deployements.
 
 - # 1. Using terminal
 
 - - Make sure your minikube is running. ``` minikube start ```.
 
 - - After that type the following command to terminal -> ``` kubectl create deployment geth-app --image=jozzy008/geth2:v0.0.1 ```.
 
 - - terminal aswer shoud be like this -> ``` deployment.apps/geth-app created ```.
 
 - # 2. Using yaml file
 
 - - Enter ``` kubectl create -f geth.yaml ``` to terminal. The aswer should be like this
  ``` pod/geth-app2 created ```.
 
 -  Than check your deployement status with ``` kubectl get pods ```. It should be Running.
 
 - - If it says ImagePullBackOff it faild and it is trying again. 
 Check the problem with typing the following command 
 
 ``` kubectl describe pod geth-app ```. 
 
 If you see something like 
 
 ``` Error response from daemon: pull access denied for /posts, 
 repository does not exist or may require 'docker login': denied: requested access to the 
 resource is denied 
 ``` 
 you probably warote containers name wrong or trying to get local container and kubernetes 
 cant reach your local containers. There is a command like ``` minikube load image geth2 ``` but it wont worked for me.
 
 - Than you expose it with ``` kubectl expose deployment geth-app --type=LoadBalancer --port=8080  ```.
 
 - Than type the following command -> ``` minikube service geth-app ```. And it opens the service on browser.
 
 
 - # Deploy Pod Using Api
 
 - start serve ```$ microk8s kubectl proxy --port=8080```
 
 - then you have to learn what the default token and decode it.
 
 - Learn token with ``` microk8s kubectl get secret --namespace=default ```
 
 - Then paste the default-xxxx-xxx -> ```microk8s kubectl get secret default-xxxx-xxxx --namespace=default -o yaml```
 
 - Copy the token and decode it. After that you can use the decoded token in the code below.
 
 - curl -k -v -X POST -H "Authorization: Bearer {token}" -H "Content-Type: application/json" http://127.0.0.1:8080/api/v1/namespaces/default/pods -d@geth.json


