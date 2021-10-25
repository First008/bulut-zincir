# kubernetes

## Manifest

 - What is manifest file?
 - What does it represent/manipulate in kubernetes api? (objects?)What it means 

## Questions

- What kind of manifest is required for the minimum demo environment?
    - Replication Controller
    - Service

## Notes

- probably a simple deployment (correct term?) can be created using just kubectl as in the book, but it would be better to have a separate manifest for each object.
```
kubectl apply -f ...
```

## TODO

- [X] create a minimal externally accessible geth kubernetes object (YAML manifest). (manifests/deployments/basic-geth.yml)

