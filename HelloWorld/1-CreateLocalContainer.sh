dotnet publish -c Release ./HelloWorld

docker build -t helloworldimage:v1 .
docker run --name helloworld --publish 8080:80 --detach helloworldimage:v1

docker stop helloworld
docker rm helloworld
docker image ls helloworldimage:v1