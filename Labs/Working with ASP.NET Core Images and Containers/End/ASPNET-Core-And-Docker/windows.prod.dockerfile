FROM        mcr.microsoft.com/dotnet/core/aspnet
LABEL       author="Your Name"

ENV         ASPNETCORE_URLS=http://+:5000
ENV         ASPNETCORE_ENVIRONMENT=production

EXPOSE      5000

WORKDIR     /app
COPY        ./dist .

ENTRYPOINT  ["dotnet", "ASPNET-Core-And-Docker.dll"]

# Run the following:
# 1. dotnet restore
# 2. dotnet build
# 3. dotnet publish -c Release -o dist
# 4. Switch Docker to use Windows containers
# 5. docker build -f windows.prod.dockerfile -t aspnetcore-prod . 
# 6. docker run -d -p 5000:5000 aspnetcore-prod
# 7. Visit http://localhost:5000 in the browser