FROM node:16-alpine

WORKDIR /usr/src/app

COPY . . 

ENV REACT_APP_BACKEND_URL=http://localhost:8080

RUN npm install && \
    npm install -g serve && \
    npm run build && \
    adduser -D frontuser && \ 
    rm -rf /var/cache/apk/* && \
    rm -rf src
    
USER frontuser

EXPOSE 5000

CMD ["serve", "-s", "-l", "5000", "build"]





