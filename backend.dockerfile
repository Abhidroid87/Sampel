FROM node:18-slim

WORKDIR /home/sampel

COPY src /home/sampel/src
COPY tsconfig.json /home/sampel/
COPY drizzle.config.ts /home/sampel/
COPY package.json /home/sampel/
COPY yarn.lock /home/sampel/

RUN mkdir /home/sampel/data
RUN mkdir /home/sampel/uploads

RUN yarn install --frozen-lockfile --network-timeout 600000
RUN yarn build

CMD ["yarn", "start"]