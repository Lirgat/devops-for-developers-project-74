FROM node:18-alpine

# Устанавливаем зависимости системы
RUN apk add --no-cache python3 make g++ sqlite-dev bash

WORKDIR /app

# Копируем package файлы
COPY ./app/package*.json ./

# Устанавливаем зависимости, игнорируя проблемные скрипты
RUN npm install --no-optional --ignore-scripts

# Копируем всё приложение
COPY ./app .

# Создаем заглушку для sequelize-cli если нет
RUN if [ ! -f node_modules/sequelize-cli/package.json ]; then \
      npm install sequelize-cli@6.6.2 --no-save --ignore-scripts; \
    fi

# Убеждаемся, что миграции не запускаются автоматически
RUN sed -i 's/npm run migrate/echo "Migrations disabled for dev"/' package.json 2>/dev/null || true

EXPOSE 8080

CMD ["sh", "-c", "npm run start"]
