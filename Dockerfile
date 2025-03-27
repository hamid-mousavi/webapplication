# مرحله اول: بیلد پروژه
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app
COPY . .
RUN dotnet publish -c Release -o /out

# مرحله دوم: اجرای برنامه
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /out .
EXPOSE 8080
CMD ["dotnet", "WebApplication1.dll"]
