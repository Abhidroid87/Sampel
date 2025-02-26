FROM node:18-slim

WORKDIR /home/perplexica

COPY src /home/Sampel/src
COPY tsconfig.json /home/Sampel/
COPY drizzle.config.ts /home/Sampel/
COPY package.json /home/Sampel/
COPY yarn.lock /home/Sampel/

RUN mkdir /home/Sampel/data
RUN mkdir /home/Sampel/uploads

RUN yarn install --frozen-lockfile --network-timeout 600000
RUN yarn build

CMD ["yarn", "start"]