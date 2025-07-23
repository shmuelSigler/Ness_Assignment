FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine AS build
WORKDIR /src
COPY src/HelloWorld.csproj ./src/
RUN dotnet restore src/HelloWorld.csproj
COPY . .
WORKDIR /src/src
RUN dotnet publish -c Release -o /app --no-restore


FROM mcr.microsoft.com/dotnet/runtime:8.0-alpine AS runtime
RUN addgroup -g 10001 appgrp
RUN adduser -S -u 10000 -G appgrp ness
RUN mkdir /app && chown -R ness:appgrp /app
WORKDIR /app
COPY --from=build /app ./
USER ness

ENTRYPOINT ["dotnet", "App.dll"]

