
### Build
```bash

microk8s.enable registry

go mod init bulutzincir

go mod tidy

go mod vendor

# change directory to ethereum-operator
cd ethereum-operator

# build the ethereum operator binary
CGO_ENABLED=0 GOOS=linux go build

# build the docker container
docker build -t localhost:32000/ethereum-operator:0.1 .

docker push localhost:32000/ethereum-operator:0.1
```

### Start the Operator

```bash
# Create the ethereum operator
$ kubectl create -f ethereum-operator.yaml

# Wait for the pod status to be Running
$ kubectl get pod -l app=ethereum-operator
NAME                              READY     STATUS    RESTARTS   AGE
ethereum-operator-821691060-m5vqp   1/1       Running   0          3m

# View the ethereums CRD
$ kubectl get crd ethereums.bulutzincir.io
NAME                   KIND
ethereums.bulutzincir.io   CustomResourceDefinition.v1beta1.apiextensions.k8s.io
```

### Create the Sample Resource
```bash
# Create the ethereum
$ kubectl create -f ethereum-resource.yaml

# See the ethereum resource
$ kubectl get ethereums.bulutzincir.io
NAME       KIND
myethereum   Sample.v1alpha1.bulutzincir.io
```

### Modify the Sample Resource
Change the value of the `Hello` property in `ethereum-resource.yaml`, then apply the new yaml.
```bash
kubectl apply -f ethereum-resource.yaml
```

### Logs

Notice the added and modified Hello= text in the log below

```bash
$ kubectl logs -l app=ethereum-operator
Getting kubernetes context
Creating the ethereum resource
Managing the ethereum resource
Added Sample 'myethereum' with Hello=world!
Updated ethereum 'myethereum' from world to goodbye!
```

### Cleanup
```bash
kubectl delete -f ethereum-resource.yaml
kubectl delete -f ethereum-operator.yaml
kubectl delete crd ethereums.bulutzincir.io
```
