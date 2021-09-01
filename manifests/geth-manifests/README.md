
# manifest

- manifest dosyasi nedir ?
- kubnernetes apisinde neyi temsil eder/manipule eder ? (objects ?)

# sorular
- minimum demo ortami icin nasil bir manifest gerekli ?
    - replication controller
    - service

# notlar

- muhtemelen basit bir deployment (dogru terim mi ?) kitaptaki gibi sadece kubectl kullanilarak olusturulabilir fakat her bir object icin ayri manifest olmasi daha iyi olurdu.
 
 ```
 kubectl run ...
 kubectl expose ...
 ```

 bu komutlarda kubernets apisine mudehale ediyor

# TODO

- [X] disardan erisilebilen minimal bir geth kubernetes objecti olustur (YAML manifest). (manifests/deployments/basic-geth.yml)

# cheatsheet

buradan ekleme yapilabilir [kubectl cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

```
microk8s kubectl describe  geth-on-kube # detay
microk8s kubectl get pod geth-on-kube # durum
```