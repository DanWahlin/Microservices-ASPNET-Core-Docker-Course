FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 51832
EXPOSE 44357

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY MonolithToMicroservices.csproj .
RUN dotnet restore
COPY . .
RUN dotnet build -c Release -o /app

FROM build AS publish
RUN dotnet publish -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "MonolithToMicroservices.dll"]

