# Usando uma imagem moderna e oficial da comunidade
FROM ghcr.io/cirruslabs/flutter:stable


USER root

WORKDIR /app


COPY pubspec.yaml pubspec.lock ./


RUN flutter pub get --suppress-analytics

# Agora copia o resto do projeto
COPY . .

# Comando para rodar os testes ou build
CMD ["flutter", "doctor", "-v"]