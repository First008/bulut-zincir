# kubernetes objects

Object Spec and Status
Almost every Kubernetes object includes two nested object fields that govern the object's configuration: the object spec and the object status. For objects that have a spec, you have to set this when you create the object, providing a description of the characteristics you want the resource to have: its desired state [src](Object Spec and Status
Almost every Kubernetes object includes two nested object fields that govern the object's configuration: the object spec and the object status. For objects that have a spec, you have to set this when you create the object, providing a description of the characteristics you want the resource to have: its desired state)

objeleri tanimla (hiyerarsi, neye yarar, birbirleri ile iliskisi vb.)

- objeler YAML dosyalari ile belirtilir.

- Container
- Pod 
- Service
- ServiceAccount
- Volume
- PersistentVolume
- ContainerPort
- Namespace
- ConfigMap

## Container
TODO 

## Pod 
TODO 

## Service
TODO 

## ServiceAccount
TODO 

## Volume
TODO 

## PersistentVolume
TODO 

## ContainerPort
TODO 

## Namespace (?)
TODO 

## ConfigMap
TODO 

# Workload Resources
TODO 

- Deployments
- ReplicaSet
- StatefulSets
- DaemonSet
- Jobs
- TTL Controller for Finished Resources
- CronJob
- ReplicationController

### Deployments
TODO 

### ReplicaSet
TODO 

### ReplicationController
TODO

# Labels and Selectors

- Allows userst to filter a list of resources based on labels. 

labeller arbitrary, kullanici organizasyondan  sorumlu.

Labels are key/value pairs that are attached to objects, such as pods. Labels are intended to be used to specify identifying attributes of objects that are meaningful and relevant to users, but do not directly imply semantics to the core system. Labels can be used to organize and to select subsets of objects [src](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/)
