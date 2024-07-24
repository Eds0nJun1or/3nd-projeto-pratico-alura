# Use uma imagem base oficial de .NET SDK (ajuste conforme a linguagem/tecnologia usada)
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /app

# Copie e restaure as dependências do projeto
COPY . .
RUN dotnet restore

# Compile o projeto
RUN dotnet publish -c Release -o out

# Use uma imagem base oficial de ASP.NET Core Runtime
FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=build /app/out .

# Exponha a porta que a aplicação irá rodar
EXPOSE 80

# Inicie a aplicação
ENTRYPOINT ["dotnet", "UserService.dll"]
