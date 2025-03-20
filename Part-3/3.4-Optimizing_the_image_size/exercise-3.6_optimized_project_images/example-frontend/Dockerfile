FROM node:16-alpine

WORKDIR /usr/src/app

COPY ./public ./public
COPY ./src ./src/

COPY package*.json ./

RUN npm install && \
    npm run build && \
    npm install -g serve && \
    adduser -h /home/frontuser -D frontuser && \ 
    rm -rf /var/cache/apk/*
    
USER frontuser

ENV REACT_APP_BACKEND_URL=http://localhost:8080

EXPOSE 5000

CMD ["serve", "-s", "-l", "5000", "build"]





