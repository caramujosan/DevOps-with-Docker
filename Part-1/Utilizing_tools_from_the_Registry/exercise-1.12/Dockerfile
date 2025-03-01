# Stage 1: Build the application
FROM node:16-alpine AS build-stage

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Stage 2: Serve the application
FROM node:16-alpine

WORKDIR /usr/src/app

COPY --from=build-stage /usr/src/app/build ./build

RUN npm install -g serve

EXPOSE 5000

CMD ["serve", "-s", "-l", "5000", "build"]





