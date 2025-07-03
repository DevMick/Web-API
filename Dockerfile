# Utilise l'image officielle .NET 6.0 SDK pour la compilation
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY . .
RUN dotnet restore InstitutFroebel.API/InstitutFroebel.API.csproj
RUN dotnet publish InstitutFroebel.API/InstitutFroebel.API.csproj -c Release -o /app/out

# Utilise l'image officielle .NET 6.0 Runtime pour l'exécution
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "InstitutFroebel.API.dll"] 