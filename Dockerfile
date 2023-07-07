FROM node:latest

WORKDIR /app

COPY package.json .

RUN yarn install

RUN yarn install --frozen-lockfile

COPY . .

CMD [ "yarn", "start" ]