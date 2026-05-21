FROM node:18-alpine

# Устанавливаем зависимости для PostgreSQL и сборки
RUN apk add --no-cache \
    python3 \
    make \
    g++ \
    postgresql-dev \
    bash

WORKDIR /app

# Копируем package файлы
COPY ./app/package*.json ./

# Устанавливаем зависимости
RUN npm install --no-optional --ignore-scripts

# Устанавливаем pg-native если нужно
RUN npm install pg pg-hstore --no-save

# Копируем приложение
COPY ./app .

# Устанавливаем sequelize-cli глобально
RUN npm install -g sequelize-cli

EXPOSE 8080

CMD ["make", "dev"]
