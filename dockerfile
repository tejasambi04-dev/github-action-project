FROM node:8

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build

EXPOSE 8000

USER node

CMD ["npm", "run", "server"]