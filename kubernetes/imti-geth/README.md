# READ First

 - yeni node eklemek için önce yeni bir account oluşturup onun keyfile'ını configmape koymak gerekiyor.
 - daha sonra genesis file dosyasından ilk önce private key sonra da private to pub çalıştırılmalı sonuçta çıkan kopyalanmalı.
 
 - yeni bir conteiner eklenmeli enode://kopyalanan@127.0.0.1:port koyulmalı ve bootnodes kısmına , ile eklenmeli
 
 - bunu otomatize etmli

 - # Follow the following instructions
 
 - - ``` kubectl apply -f 000-geth-namespace.yml ```
 
 - - ``` kubectl apply -f 100-geth-pv.yml ```
  
 - - ``` kubectl apply -f 300-etherstats-service.yml```
   
 - - ``` kubectl apply -f 310-etherstats-secret.yml ```
    
 - - ``` kubectl apply -f 320-etherstats-dashb.yaml ```
     
 - - ``` kubectl apply -f 330-ethstats-ingress.yml ```
      
 - - ``` kubectl apply -f 410-geth-confmap.yml ```
 
 - - ``` kubectl -n geth get all  ``` and copy the name of pod eth-stats
 
 - - ``` kubectl -n geth pod eth-ethstats-xxxxxxxx -o wide``` paste copied pods name
 
 - - get the ip of that pod and paste it to HOSTNAME's value which is covered by env inside the 420 file 
 - - ``` kubectl apply -f 420-geth-sealer-ss.yml ```
 
 - - ``` kubectl port-forward geth-0 8545:8545 --namespace geth ```
 
 - - ``` kubectl port-forward eth-ethstats-77f8b775f9-vw7tx 3000:3000 --namespace geth ```
 
 
