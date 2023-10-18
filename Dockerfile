FROM mcr.microsoft.com/dotnet/runtime:6.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["OnePiece_Rogue.csproj", "./"]
RUN dotnet restore "OnePiece_Rogue.csproj"
COPY . .
WORKDIR "/src/"
RUN dotnet build "OnePiece_Rogue.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "OnePiece_Rogue.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "OnePiece_Rogue.dll"]
