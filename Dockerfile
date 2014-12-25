FROM node:0.10.34

ADD ./app /usr/src/app

CMD ["node", "/usr/src/app/index.js"]
