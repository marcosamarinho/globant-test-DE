# RUN a docker new image 
container=fastAPI
sudo docker rm -f $container
sudo docker run -d --name $container -p 80:80 myfastapi
