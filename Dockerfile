# Estágio 1: Build
FROM cirrusci/flutter:stable AS build
WORKDIR /app
COPY . .
# Garante que as dependências sejam baixadas
RUN flutter pub get
# Build focado em web
RUN flutter build web --release

# Estágio 2: Produção com Nginx
FROM nginx:alpine
# Copia o build e a config
COPY --from=build /app/build/web /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]