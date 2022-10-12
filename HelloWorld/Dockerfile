FROM mcr.microsoft.com/dotnet/aspnet:6.0

RUN mkdir /app
WORKDIR /app

COPY ./bin/Release/net6.0/publish ./

EXPOSE 80
ENTRYPOINT [ "dotnet", "HelloWorld.dll" ]
