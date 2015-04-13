# vagrant-coreos-docker-registry

Easiest way to have your own docker registry with its UI.

## How to install it:

 - Clone this repository
 
 - Run the virtual machine. 
   ```
   vagrant up
   ```
 
 - Launch the provide.sh (Take some times to pull and build docker registry and registry-ui)
  ```
  ./provide.sh
  ```
  
- At the end of the script you should have a running registry. (Check http://localhost:8081 in your browser)

## How to use it:

 - Docker registry frontend
 
 The frontend of this virtual machine is build with a great app shared on github. (https://github.com/kwk/docker-registry-frontend)
 
 To learn more about the frontend, you can read its wiki. (https://github.com/kwk/docker-registry-frontend/wiki/Features)
 
 - Docker registry:
 
 Read the docker documentation, if you don't know how to use local repository(https://docs.docker.com/reference/commandline/cli/)
 
 By default the registry adress is: 172.12.8.100:5000
 
 Example:
 ```
 docker tag busybox 172.12.8.100:5000/local_busybox
 docker push 172.12.8.100:5000/local_busybox
 ```
 
 ## Allowing insecure registry endpoint

You may have some error as:
```
FATA[0004] Error: v1 ping attempt failed with error: Get https://172.12.8.100:5000/v1/_ping: EOF. If this private registry supports only HTTP or HTTPS with an unknown CA certificate, please add `--insecure-registry 172.12.8.100:5000` to the daemon's arguments. In the case of HTTPS, if you have access to the registry's CA certificate, no need for the flag; simply place the CA certificate at /etc/docker/certs.d/172.12.8.100:5000/ca.crt
```
- Linux docker users: 
Open /etc/docker/default and add the following at the end:

```
EXTRA_ARGS="--insecure-registry 172.12.0.0/16"
```

- Boot2docker users:

```
boot2docker ssh
sudo vi /var/lib/boot2docker/profile
```

Add the following at the end of the file and restart boot2docker:
```
EXTRA_ARGS="--insecure-registry 172.12.0.0/16"
```
