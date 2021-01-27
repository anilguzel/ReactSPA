FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM node:10-alpine as build-node
WORKDIR /src/SPA.Web/ClientApp
COPY src/SPA.Web/ClientApp/package.json .
COPY src/SPA.Web/ClientApp/package-lock.json .
RUN npm install
COPY src/SPA.Web/ClientApp/ . 
RUN npm run build  

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
ENV BuildingDocker true
WORKDIR /src
COPY ["src/SPA.Web/SPA.Web.csproj", "src/SPA.Web/"]
RUN dotnet restore "src/SPA.Web/SPA.Web.csproj"
COPY . .
WORKDIR "/src/src/SPA.Web"
RUN dotnet build "SPA.Web.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "SPA.Web.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
COPY --from=build-node /src/SPA.Web/ClientApp/build ./ClientApp/build

EXPOSE 5000/tcp
ENV ASPNETCORE_URLS http://*:5000

ENTRYPOINT ["dotnet", "SPA.Web.dll"]