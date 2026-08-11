FROM node:8 AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build


FROM node:current-alpine3.23

WORKDIR /app

COPY package*.json ./
RUN npm install --omit=dev

COPY --from=build /app/src ./src
COPY --from=build /app/public ./public

EXPOSE 8000

USER node

CMD ["npm", "run", "server"]