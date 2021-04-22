FROM node:14.16.1-alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json package-lock.json babel.config.json tsconfig.json ./
COPY ./prisma ./prisma/
RUN npm install
EXPOSE 3000
CMD ["npm", "run", "start:dev"]
