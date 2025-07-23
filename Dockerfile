FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine AS build
WORKDIR /src

COPY src/*.csproj ./src/
RUN dotnet restore src/HelloWorld.csproj   # cached

COPY . .
WORKDIR /src/src
RUN dotnet publish -c Release -o /app --no-restore


FROM mcr.microsoft.com/dotnet/runtime:8.0-alpine AS runtime
WORKDIR /app
COPY --from=build /app ./

ENTRYPOINT ["dotnet", "App.dll"]

