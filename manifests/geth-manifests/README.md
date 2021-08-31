
# manifest

- manifest dosyasi nedir ?
- kubnernetes apisinde neyi temsil eder/manipule eder ? (objects ?)

# sorular
- minimum demo ortami icin nasil bir manifest gerekli ?

# notlar

- muhtemelen basit bir deployment (dogru terim mi ?) kitaptaki gibi sadece kubectl kullanilarak olusturulabilir fakat her bir object icin ayri manifest olmasi daha iyi olurdu.
 
 ```
 kubectl run ...
 kubectl expose ...
 ```

# TODO

- [ ] disardan erisilebilen minimal bir geth (deployment ?) kubernetes objecti olustur.

# cheatsheet

buradan ekleme yapilabilir [kubectl cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

```
microk8s kubectl describe  geth-on-kube # detay
microk8s kubectl get pod geth-on-kube # durum
```