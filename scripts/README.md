# Scripts

 - # bulut-zincir
 
 - First of all we are gonna use this script as ``` bulut-zincir -----```.
 
 - Because of that we have some steps to be done.
 
 - I am going to make a dir named ```bin``` inside home dir 
 but if you want you can use the real ```bin``` dir.
 	
 - - If you going to make ```~/bin``` dir follow the steps below.
 
 - - ```mkdir ~/bin && cd ~/bin```
 
 - - ```gedit bulut-zincir``` And then copy the code inside.
 
 - - Now we are gonna add this folder to path -> 
 ```export PATH=$PATH":$HOME/bin"```
 
 - - Note that if you working on real ``` bin ``` dir you can pass the path step if its already added.
 
 - Now try ``` bulut-zincir -h ``` and check if the script running or not.
 If not then log out and in and try again. If still not reboot the computer.
 
 - Then to deploy enter this
 
 - ``` bulut-zincir run --image geth2 --version v0.0.1 --http --http.corsdomain https://remix.ethereum.org --http.api personal,eth,net,web3 --rpc --rpccorsdomain "http://remix.ethereum.org" ```
 
 - The pod should be created and running.
 
 - # What this script doing?
 
 - What that this script done is if you pass a run and the bunch of other arguments it collects the other arguments and putting the right arguments in right places on the yaml template.
 
 - Then it converts that yaml to the json and generates a json file. 
 
 - After that it just runs the code which i stated end of the [Kubernetes/README.md](https://bag.org.tr/proje/bulutzincir/bulut-zincir/tree/master/Kubernetes). But I'll put it in here as well ->
 
 - ``` curl -k -v -X POST -H "Authorization: Bearer {token}" -H "Content-Type: application/json" http://127.0.0.1:8080/api/v1/namespaces/default/pods -d@geth.json ```