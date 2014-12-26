FROM node:0.10.34

WORKDIR /usr/src/app

ADD ./app /usr/src/app
RUN npm install

CMD ["node", "index.js"]
