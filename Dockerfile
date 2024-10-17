# Etapa 1: Construção
FROM python:3.10 AS build

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de requisitos
COPY requirements.txt .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante dos arquivos da aplicação
COPY . .

# Etapa 2: Imagem final
FROM python:3.10-slim AS production

# Define o diretório de trabalho
WORKDIR /app

# Copia apenas os arquivos necessários da etapa de build
COPY --from=build /app /app

# Comando para rodar a aplicação
CMD ["python", "app.py"]