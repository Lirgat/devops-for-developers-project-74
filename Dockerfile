FROM node:18-alpine

RUN apk add --no-cache python3 make g++ sqlite-dev

WORKDIR /app

COPY ./app/package*.json ./

RUN npm install --ignore-scripts

COPY ./app .

RUN npm rebuild --ignore-scripts || true

EXPOSE 8080

CMD ["npm", "run", "dev"]
