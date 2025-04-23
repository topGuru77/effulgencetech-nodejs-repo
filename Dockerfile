FROM node:20-alpine@sha256:8378c88c56f2a6c038705487ce1e447c61c48557cd6a76aea4d53e255304260a

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

USER node

RUN npm install

COPY --chown=node:node . .

EXPOSE 8080

CMD [ "node", "app.js" ]
