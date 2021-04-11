FROM mcr.microsoft.com/dotnet/sdk:5.0

LABEL author="Dan Wahlin"

ENV DOTNET_USE_POLLING_FILE_WATCHER=1

WORKDIR /var/www/app

CMD ["dotnet restore && dotnet watch run"]
