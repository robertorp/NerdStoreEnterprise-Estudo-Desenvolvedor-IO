#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
COPY ["./services/NSE.Pedido.API/NSE.Pedidos.API.csproj", "services/NSE.Pedido.API/"]
COPY ["./services/NSE.Pedido.Infra/NSE.Pedidos.Infra.csproj", "services/NSE.Pedido.Infra/"]
COPY ["./services/NSE.Pedido.Domain/NSE.Pedidos.Domain.csproj", "services/NSE.Pedido.Domain/"]
COPY ["./building blocks/NSE.Core/NSE.Core.csproj", "building blocks/NSE.WebAPI.Core/"]
COPY ["./building blocks/NSE.WebAPI.Core/NSE.WebAPI.Core.csproj", "building blocks/NSE.WebAPI.Core/"]
COPY ["./building blocks/NSE.MessageBus/NSE.MessageBus.csproj", "building blocks/NSE.MessageBus/"]

RUN dotnet restore "services/NSE.Pedido.API/NSE.Pedidos.API.csproj"
COPY . .
WORKDIR "/services/NSE.Pedido.API"
RUN dotnet build "NSE.Pedidos.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "NSE.Pedidos.API.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "NSE.Pedidos.API.dll"]