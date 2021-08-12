# CLOUD-CHAIN

 - To build image, type the following command to terminal ``` docker build --tag geth2 ```.
 
 - Run in terminal via ``` docker run --rm -i -t -v ~/geth2logs:/var/log/geth -p 30303:30303 geth2 ```
 
 - Now you should login your docker account in terminal. ``` docker login ```.
 
 - And now we will push our image to the Docker Hub with ``` docker push jozzy008/geth2:v0.0.1  ```.
 
 - This image is already pushed on Docker Hub.
 
 - If you done these steps, continue with the [README](https://bag.org.tr/proje/util/bulut-zincir/tree/master/Kubernetes) inside the Kubernetes folder.

