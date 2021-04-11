FROM        mcr.microsoft.com/dotnet/aspnet:5.0
LABEL       author="Your Name"

ENV         ASPNETCORE_URLS=http://+:5000
ENV         ASPNETCORE_ENVIRONMENT=production

EXPOSE      5000

WORKDIR     /app
COPY        ./dist .

CMD         ["dotnet", "ASPNET-Core-And-Docker.dll"]


# Run the following:
# 1. dotnet restore
# 2. dotnet build
# 3. dotnet publish -c Release -o dist
# 4. docker build -f linux.prod.dockerfile -t aspnetcore-prod .
# 5. docker run -d -p 5000:5000 aspnetcore-prod
# 6. Visit http://localhost:5000 in the browser
